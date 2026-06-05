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





*---------------------------------------------------------------------*
* Running regressions as a cross section with the main year (2013), 
* using 2011's Z variables in the X vector
*---------------------------------------------------------------------*

* Importing Prova Brasil Student level data
use "analysis/data/MgmtIndex_ProvaBrasil_StdtYear.dta", clear

* Keep variables that we are going to use
keep codschool grade id_class year coduf codmunic network zmgmt newpr ${all_controls} ${t_ctrl_sch_avg} ${t_ctrl_sch_avg_miss} ${stu_sch_avg_ctrl} ${stu_sch_avg_ctrl_miss} score_saeb_average_std_year

* Filtering only 2011 and 2013
keep if year == 2011 | year == 2013 

* Generating 2011 versions of Z variables (not including teacher and student vars) to add to X
local z_2011 ""
foreach var of global post_treat_prev_year {
	
	* Creating temp variable with 2011 value
	gen `var'_2011_t = `var' if year == 2011
	
	* Spreading the 2011 value to all years for that school
	bysort codschool: egen `var'_2011 = max(`var'_2011_t)
	
	* Dropping temp
	drop `var'_2011_t
	
	* Adding to the list of new variables
	local z_2011 "`z_2011' `var'_2011"
}

* Appending 2011 variables to other_controls (X)
global other_controls "${other_controls} `z_2011'"


* Filtering only the year we want
keep if year == 2013 // 58751 schools

drop if score_saeb_average_std_year == . | newpr == .

* Running Full model (to define sample)
reg score_saeb_average_std_year newpr ${post_treat} ${all_mediators} ${other_controls} i.coduf, cluster(codschool)

gen sample_full = 1 if e(sample)


*-------------------------------------------------------------*
* Regressions with each of mediators and table output
*-------------------------------------------------------------*

local boot_save "acde=r(acde)"
foreach var of global other_controls {
	local boot_save "`boot_save' `var'=r(b_`var')"
}


* Original Treatment Effect (Y ~ T + X)
reg score_saeb_average_std_year newpr ${other_controls} i.coduf if sample_full == 1, cluster(codschool)
	scalar b_orig_avg = _b[newpr]
	scalar se_orig_avg = _se[newpr]
	scalar r2 = e(r2)
	
	eststo model_orig
	* Add indicators for table
	estadd scalar nschool e(N_clust)
	estadd local head_pre ""
	estadd local pre_urban "Y"
	estadd local pre_educ "Y"
	estadd local pre_fin "Y"
	estadd local pre_sch "Y"
	estadd local head_med ""
	estadd local med_mgmt ""
	estadd local med_princ ""
	estadd local head_post ""
	estadd local post_educ ""
	estadd local post_fin ""
	estadd local post_sch ""

* Bootstraps for ACDEs with different mediators

* Only Management
bootstrap `boot_save', reps($num_bootstrap) cluster(codschool): acde_boot score_saeb_average_std_year zmgmt
	scalar b_zmgmt_avg = e(b)[1,1]
	scalar se_zmgmt_avg = sqrt(e(V)[1,1])
	
	eststo model_mgmt
	estadd scalar nschool e(N_clust)
	estadd local head_pre ""
	estadd local pre_urban "Y"
	estadd local pre_educ "Y"
	estadd local pre_fin "Y"
	estadd local pre_sch "Y"
	estadd local head_med ""
	estadd local med_mgmt "Y"
	estadd local med_princ ""
	estadd local head_post ""
	estadd local post_educ "Y"
	estadd local post_fin "Y"
	estadd local post_sch "Y"

* Only Principal Controls
bootstrap `boot_save', reps($num_bootstrap) cluster(codschool): acde_boot score_saeb_average_std_year ${principal_controls}
	scalar b_principal_avg = e(b)[1,1]
	scalar se_principal_avg = sqrt(e(V)[1,1])
	
	eststo model_princ
	estadd scalar nschool e(N_clust)
	estadd local head_pre ""
	estadd local pre_urban "Y"
	estadd local pre_educ "Y"
	estadd local pre_fin "Y"
	estadd local pre_sch "Y"
	estadd local head_med ""
	estadd local med_mgmt ""
	estadd local med_princ "Y"
	estadd local head_post ""
	estadd local post_educ "Y"
	estadd local post_fin "Y"
	estadd local post_sch "Y"
	
	
* All Mediators
bootstrap `boot_save', reps($num_bootstrap) cluster(codschool): acde_boot score_saeb_average_std_year ${all_mediators}
	scalar b_all_avg = e(b)[1,1]
	scalar se_all_avg = sqrt(e(V)[1,1])

	eststo model_all
	estadd scalar nschool e(N_clust)
	estadd local head_pre ""
	estadd local pre_urban "Y"
	estadd local pre_educ "Y"
	estadd local pre_fin "Y"
	estadd local pre_sch "Y"
	estadd local head_med ""
	estadd local med_mgmt "Y"
	estadd local med_princ "Y"
	estadd local head_post ""
	estadd local post_educ "Y"
	estadd local post_fin "Y"
	estadd local post_sch "Y"
	
	
* Saving stored models to temp
foreach model in model_orig model_mgmt model_princ model_all {
    estimates restore `model'
    estimates save "cleaning/tempdata/Med_`model'_avg_2013_all.ster", replace
}	
	
*------------ Generating Table -----------*

* We rename 'acde' to 'newpr' so they align in the same row in the table
esttab model_orig model_mgmt model_princ model_all ///
	using "analysis/results/table_5.tex", replace ///
	cells(b(star fmt(3)) se(par fmt(3))) ///
	rename(acde newpr) /// 
	keep(newpr) ///
	coeflabels(newpr "New Principal = 1" ) ///
	refcat(newpr "\textbf{Treatment variable}", nolabel) ///
	prefoot("") ///
	stats(head_pre pre_urban pre_educ pre_fin pre_sch  N N_clust ///
	      head_med med_mgmt med_princ head_post post_educ post_fin post_sch, ///
	      labels("\textbf{Pre-treatment variables}" "Urban = 1" "Education spending (2011)" "Financial controls (2011)" ///
	      "School characteristics (2011)" ///
	      "\\ \# Students" "\# Schools" ///
	      "\midrule \textit{Variables used in first state of mediation analysis} \\ \\ \textbf{Mediators}" "Management score" ///
	      "Principal characteristics" "\\ \textbf{Post-treatment controls}" "Education spending (2013)" ///
	      "Financial controls (2013)" "School characteristics (2013)" ) ///
		fmt(0 0 0 0 0 %9.0fc %9.0fc 3 0 0 0 0 0 0 )) ///
	mgroups("Original effect" "De-mediated outcome", pattern(1 1 0 0) ///
	prefix(\multicolumn{@span}{c}{) suffix(}) span erepeat(\cmidrule(lr){@span})) ///
	nomtitle collabels(none) frag		
	


*-------------------------------------------------------------*
* Coefficient plot (like Abebe et al, 2020) 
*-------------------------------------------------------------*

*----- Building the results dataset  ----*
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

save "cleaning/tempdata/mediation_2013_coeff.dta", replace		




use "cleaning/tempdata/mediation_2013_coeff.dta", clear

gen year = 2013

* Labels of the coefficients
local y_labels 1 "Management + Principal chars." 2 "Principal chars." 3 "Management" 4 "Original 'treatment' effect"

*------------ Calculting percentages to add to the plot ------------*

* Saving "Original treatment effect"
sum coef if id == 4 & year == 2013 & outcome == "Average"
local b0 = r(mean)

* Calculating the percentage explained for the mediators
* Formula: (1 - (Mediated_Coeff / Original_Coeff)) * 100
gen pct_explained = (1 - (coef / `b0')) * 100 if id != 4 & year == 2013
gen pct_str = "(" + string(pct_explained, "%3.0f") + "%)" if id != 4 & year == 2013

* Creating percentage labels 
local pct_labels ""
count if id != 4 & year == 2013 & outcome == "Average"
local N = r(N)
local ids_to_label "1 2 3"

foreach i of local ids_to_label {
    * Get coordinates and text for this specific coeff dot
    sum coef if id == `i' & year == 2013 & outcome == "Average"
    local x_pos = r(mean)
    
    * Look up the generated string
    levelsof pct_str if id == `i' & year == 2013 & outcome == "Average", local(l_str) clean
    
    * Append to the text the local. Note: "id+0.1" adds the % slightly on top of the dot
    local pct_labels `pct_labels' text(`=`i'+0.1' `x_pos' "`l_str'", place(c) size(small))
}

* Plotting
twoway ///
    (rspike ci_low_95 ci_high_95 id if outcome == "Average" & year == 2013, horizontal lcolor(gs8) lwidth(thin)) ///
    (scatter id coef if outcome == "Average" & year == 2013, mcolor(black) msymbol(circle)), ///
    ytitle("") xtitle("Impact on average test score") ///
    xline(0, lpattern(dash) lcolor(gs12)) ///
    xscale(range(0)) ///
    xlabel(-0.08(0.02)0, format(%9.2f)) /// 
    ylabel(`y_labels', angle(horizontal)) ///
    legend(off) ///
    `pct_labels' /// Adding percentages
    text(2 -0.134 "Mediator fixed:", place(c) orientation(vertical) size(small)) /// Adding square bracket indicating mediators
    text(2 -0.13 "|___________________________|", place(c) orientation(rvertical) size(medium))

graph export "analysis/results/figure_5.pdf", replace

	
