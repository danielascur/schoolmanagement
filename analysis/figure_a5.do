* Purpose: this code uses the methodology from Acharya et al (2016) for mediator analysis. In the end, we plot the coefficients just like Abebe et al (2020).
* Papers: https://www.cambridge.org/core/journals/american-political-science-review/article/explaining-causal-findings-without-bias-detecting-and-assessing-direct-effects/D11BEB8666E913A0DCD7D0B9872F5D11 and https://academic.oup.com/restud/article/88/3/1279/5912023

* For a guide on how to apply this methodology in Stata, read to the Acharya et al (2016)'s Appendix
* Also, read the code "mediation_analysis.do" from Abebe et al (2020) replication package (not well commented)




* Globals for M, X and Z are defined in master.do
	
* Bootstrap reps
global num_bootstrap 1000

*-------------------------------------------------------------*
* Bootstraping program for running Acharya et al (2016) analysis
* with modular outcome variable and mediators
*-------------------------------------------------------------*

* We need to bootstrap the errors, so making the regression into a program
* Including error handling (there is the chance that one of the variables will be dropped because of colinearity in an interaction)

cap program drop acde_boot
program define acde_boot, rclass

	* Arguments: Y (outcome) and M (mediators)
	local Y "`1'" 	// first argument (Y) 
	mac shift 	// Shifting all arguments to the left
	local M "`*'" 	// Assigning ALL remaining arguments to M

	* First Stage: always the "full" model (controlling for all mediators and post-treatment outcomes)
	* Y ~ T + M + Z + X
	reg `Y' newpr ${all_mediators} ${post_treat} ${other_controls} i.coduf, cluster(codschool)
		
	* Creating the "demediated" outcome by removing effect from the mediators (M)
	gen ytilde = `Y' if e(sample)
		
	foreach var of varlist `M' {
	    capture local coef_val = _b[`var']
	    if _rc == 0 {
	    	* If _rc == 0, the coef exists, so subtract it
		replace ytilde = ytilde - `coef_val' * `var' if e(sample)
	    }
	}	
	

	* Second Stage: Y demeaned by M ~ T + X (no Z!)
	reg ytilde newpr ${other_controls} i.coduf, cluster(codschool)

	drop ytilde
	
	* Returning the Average Controlled Direct Effect (ACDE)
	return scalar acde = _b[newpr]
	
	* Also returning coefficients for all variables in $other_controls, to add to the reg table
	foreach var of global other_controls {
		cap return scalar b_`var' = _b[`var']
	}
end







*-------------------------------------------------------------------------------*
* Running regression with 2011, 2013 and 2015, for sample of common schools (also 2009, because we need variable from it)
*-------------------------------------------------------------------------------*


* Importing Prova Brasil Student level data
use "analysis/data/MgmtIndex_ProvaBrasil_StdtYear.dta", clear

* Keep variables that we are going to use
keep codschool grade id_class year coduf codmunic network zmgmt newpr ${all_controls} ${t_ctrl_sch_avg} ${t_ctrl_sch_avg_miss} ${stu_sch_avg_ctrl} ${stu_sch_avg_ctrl_miss} score_saeb_average_std_year


* keeping only 2009, 2011, 2013 and 2015
keep if year == 2009 | year == 2011 | year == 2013 | year == 2015

* Keeping schools present in all 4 years
bysort codschool year: gen school_year_tag = (_n == 1)
bysort codschool: egen year_count = total(school_year_tag)
keep if year_count == 4

unique codschool // 43736 schools

* Saving as temp
save "cleaning/tempdata/mediator_same_sample_Z_prev_year.dta", replace



* Appending previous year variables to other_controls (X)
local z_prev ""
foreach var of global post_treat_prev_year {
	local z_prev "`z_prev' `var'_prev"
}

global other_controls "${other_controls} `z_prev'"


* Calculate the same regressions as we did for 2013, for 2011 and 2015
foreach y in 2011 2015 {
		
	* Defining the year to be analyzed 
	global year `y'

	* Importing dataset 
	use "cleaning/tempdata/mediator_same_sample_Z_prev_year.dta", clear
	
	* Generating previous year versions of Z variables to add to X
	local z_prev ""
	foreach var of global post_treat_prev_year {
		
		* Creating temp variable with previous year value
		gen `var'_prev1 = `var' if year == $year - 2
		
		* Spreading the 2011 value to all years for that school
		bysort codschool: egen `var'_prev = max(`var'_prev1)
		
		* Dropping temp
		drop `var'_prev1
		
		* Adding to the list of new variables
		local z_prev "`z_prev' `var'_prev"
	}

	* Filtering only the year we want
	keep if year == $year

	* Running Full model (to define sample)
	reg score_saeb_average_std_year newpr ${post_treat} ${all_mediators} ${other_controls} i.coduf, cluster(codschool)

	gen sample_full = 1 if e(sample)


	*-------------------------------------------------------------*
	* Coefficient plots (like Abebe et al, 2020) 
	*-------------------------------------------------------------*

	local boot_save "acde=r(acde)"
	foreach var of global other_controls {
		local boot_save "`boot_save' `var'=r(b_`var')"
	}
	
	* Original Treatment Effect (Y ~ T + X)
	reg score_saeb_average_std_year newpr ${other_controls} i.coduf if sample_full == 1 , cluster(codschool)
		scalar b_orig_avg = _b[newpr]
		scalar se_orig_avg = _se[newpr]

	* Bootstraps for ACDEs with different mediators
	
	* Only Management
	bootstrap `boot_save', reps($num_bootstrap) cluster(codschool): acde_boot score_saeb_average_std_year zmgmt
		scalar b_zmgmt_avg = e(b)[1,1]
		scalar se_zmgmt_avg = sqrt(e(V)[1,1])

	* Only Principal Controls
	bootstrap `boot_save', reps($num_bootstrap) cluster(codschool): acde_boot score_saeb_average_std_year ${principal_controls}
		scalar b_principal_avg = e(b)[1,1]
		scalar se_principal_avg = sqrt(e(V)[1,1])
			
	* All Mediators
	bootstrap `boot_save', reps($num_bootstrap) cluster(codschool): acde_boot score_saeb_average_std_year ${all_mediators}
		scalar b_all_avg = e(b)[1,1]
		scalar se_all_avg = sqrt(e(V)[1,1])
		
		
	*------------ Building the results dataset  -----------*
	clear 
	set obs 4

	gen str15 outcome = "Average"
	gen str30 model = ""
	gen float coef = .
	gen float se = .
	gen int id = .

	replace model = "All" in 1
	replace id = 1 in 1
	replace coef = scalar(b_all_avg) in 1
	replace se = scalar(se_all_avg) in 1

	replace model = "Principal" in 2
	replace id = 2 in 2
	replace coef = scalar(b_principal_avg) in 2
	replace se = scalar(se_principal_avg) in 2

	replace model = "Management" in 3
	replace id = 3 in 3
	replace coef = scalar(b_zmgmt_avg) in 3
	replace se = scalar(se_zmgmt_avg) in 3

	replace model = "Original" in 4
	replace id = 4 in 4
	replace coef = scalar(b_orig_avg) in 4
	replace se = scalar(se_orig_avg) in 4

	* Confidence Intervals
	gen ci_low_90 = coef - 1.645 * se
	gen ci_high_90 = coef + 1.645 * se
	gen ci_low_95 = coef - 1.96 * se
	gen ci_high_95 = coef + 1.96 * se

	save "cleaning/tempdata/mediation_${year}_coeff.dta", replace		
}


*-------------------------------------------------------------*
* Coefficient Plots (Average Score)
*-------------------------------------------------------------*

* Appending saved datasets
use "cleaning/tempdata/mediation_2011_coeff.dta", clear
gen year = 2011

append using "cleaning/tempdata/mediation_2015_coeff.dta"
replace year = 2015 if year == .

* Offsets for plotting
gen id_plot = id
replace id_plot = id + 0.15 if year == 2011
replace id_plot = id - 0.15 if year == 2015


* Labels of the coefficients
local y_labels 1 "Management + Principal chars." 2 "Principal chars." 3 "Management" 4 "Original 'treatment' effect"


* Plotting 2011 and 2015 

* Calculating percentages to add to the plot ------------*

gen pct_explained = .
gen pct_str = ""

local years_to_calc "2011 2015"
foreach y of local years_to_calc {
    * Saving baseline for the specific year
    sum coef if id == 4 & year == `y' & outcome == "Average"
    local b0_`y' = r(mean)
    
    * Calculating percentage explained
    replace pct_explained = (1 - (coef / `b0_`y'')) * 100 if id != 4 & year == `y'
    replace pct_str = "(" + string(pct_explained, "%3.0f") + "%)" if id != 4 & year == `y'
}

* Creating percentage labels macro
local pct_labels ""
local ids_to_label "1 2 3"

foreach i of local ids_to_label {
    
    * Processing 2011
    sum coef if id == `i' & year == 2011 & outcome == "Average"
        local x_pos = r(mean)
        levelsof pct_str if id == `i' & year == 2011 & outcome == "Average", local(l_str) clean
        
        * Coordinate: id_plot (id+0.15) + 0.1 offset = id + 0.25
        local pct_labels `pct_labels' text(`=`i'+0.25' `x_pos' "`l_str'", place(c) size(small))
    

    * Processing 2015
    sum coef if id == `i' & year == 2015 & outcome == "Average"
        local x_pos = r(mean)
        levelsof pct_str if id == `i' & year == 2015 & outcome == "Average", local(l_str) clean
        
        local pct_labels `pct_labels' text(`=`i'-0.03' `x_pos' "`l_str'", place(c) size(small))
    
}

	twoway ///
	    (rspike ci_low_95 ci_high_95 id_plot if outcome == "Average" & year == 2011, horizontal lcolor(gs8) lwidth(thin)) ///
	    (scatter id_plot coef if outcome == "Average" & year == 2011, mlcolor(emerald) mcolor(emerald%60) msymbol(triangle)) ///
	    ///
	    (rspike ci_low_95 ci_high_95 id_plot if outcome == "Average" & year == 2015, horizontal lcolor(gs8) lwidth(thin)) ///
	    (scatter id_plot coef if outcome == "Average" & year == 2015, mlcolor(navy) mcolor(navy%80) msymbol(square)), ///
	    ///
	    ytitle("") xtitle("Impact on average test score") ///
	    ylabel(`y_labels', angle(horizontal)) ///
	    xline(0, lpattern(dash) lcolor(gs12)) ///
	    xlabel(-0.08(0.02)0, format(%9.2f)) /// 
	    legend(order(2 "2011" 4 "2015") rows(1) position(6)) ///
	    `pct_labels' /// Adding percentages
	    text(2 -0.134 "Mediator fixed:", place(c) orientation(vertical) size(small)) /// 
	    text(2 -0.13 "|________________________|", place(c) orientation(rvertical) size(medium))
 
	graph export "analysis/results/figure_a5.pdf", replace
