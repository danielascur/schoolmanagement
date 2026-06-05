*------------------------------------------------------------------*
* LEAVE ONE OUT ANALYSIS
*------------------------------------------------------------------*

* --- Run and Plot LOO Regressions in Stata ---

use "analysis/data/PISA2012_LOO.dta", clear

* Storing main coefficients for the plot later
* Initializing the postfile to save to the permanent path
postfile LOO_Results_Buffer str40 index_name str10 subject str4 model_col float (b p se) using "cleaning/tempdata/LOO_practices_regression_results.dta", replace


* Looping back to save the main index results
foreach sub in read math scie {

	* --- col1 ---
	repest PISA, estimate(stata: reg pv@`sub' mgmt_wms_practices_std i.c , cluster(uschool_id))
	local b = _b[mgmt_wms_practices_std]
	local se = _se[mgmt_wms_practices_std]
	test mgmt_wms_practices_std 
	local p = r(p)
	post LOO_Results_Buffer ("main_index") ("`sub'") ("col1") (`b') (`p') (`se')

	* --- col2 ---
	repest PISA, estimate(stata: reg pv@`sub' mgmt_wms_practices_std i.c private ${c_main}, cluster(uschool_id))
	local b = _b[mgmt_wms_practices_std]
	local se = _se[mgmt_wms_practices_std]
	test mgmt_wms_practices_std 
	local p = r(p)
	post LOO_Results_Buffer ("main_index") ("`sub'") ("col2") (`b') (`p') (`se')

	* --- col3 ---
	repest PISA, estimate(stata: reg pv@`sub' mgmt_wms_practices_std i.c private ${c_main} ${c_full}, cluster(uschool_id))
	local b = _b[mgmt_wms_practices_std]
	local se = _se[mgmt_wms_practices_std]
	test mgmt_wms_practices_std 
	local p = r(p)
	post LOO_Results_Buffer ("main_index") ("`sub'") ("col3") (`b') (`p') (`se')
}




* --- Part 2: LOO Regressions (for plotting) ---

* Defining a specific list of indices for testing
ds mgmt_wms_loo_*_std
local loo_indices `r(varlist)'

* Looping through each LOO index
foreach index of local loo_indices {
    
    * Looping through subjects
    foreach sub in read math scie {

        * --- col1 ---
        repest PISA, estimate(stata: reg pv@`sub' `index' i.c, cluster(uschool_id))
        local b = _b[`index']
        local se = _se[`index']
        test `index'
        local p = r(p)
        post LOO_Results_Buffer ("`index'") ("`sub'") ("col1") (`b') (`p') (`se')

        * --- col2 ---
        repest PISA, estimate(stata: reg pv@`sub' `index' i.c private ${c_main}, cluster(uschool_id))
        local b = _b[`index']
        local se = _se[`index']
        test `index'
        local p = r(p)
        post LOO_Results_Buffer ("`index'") ("`sub'") ("col2") (`b') (`p') (`se')

        * --- col3 ---
        repest PISA, estimate(stata: reg pv@`sub' `index' i.c private ${c_main} ${c_full}, cluster(uschool_id))
        local b = _b[`index']
        local se = _se[`index']
        test `index'
        local p = r(p)
        post LOO_Results_Buffer ("`index'") ("`sub'") ("col3") (`b') (`p') (`se')
    }
    
    * Dropping the temp standardized var to save memory
    drop `index'
}

* Closing the results file (this saves it to disk)
postclose LOO_Results_Buffer






* Loading the dataset we just created from its permanent location
use "cleaning/tempdata/LOO_practices_regression_results.dta", clear

* Generating variables for the main index values for each panel
gen is_main = (index_name == "main_index")

* Spreading the main index stats (b, p, se) to all rows for comparison
bysort subject model_col (is_main): gen main_b = b[_N] if is_main == 1
bysort subject model_col (is_main): gen main_p = p[_N] if is_main == 1
bysort subject model_col (is_main): gen main_se = se[_N] if is_main == 1

bysort subject model_col: egen main_b_val = max(main_b)
bysort subject model_col: egen main_p_val = max(main_p)
bysort subject model_col: egen main_se_val = max(main_se)

* Calculating 95% Confidence Intervals for the main index dynamically
gen main_ci_lb = main_b_val - (1.96 * main_se_val)
gen main_ci_ub = main_b_val + (1.96 * main_se_val)

* Generating variables for just the LOO values
gen loo_b = b if is_main == 0
gen loo_p = p if is_main == 0

* coefread 
{
    * Getting dynamic reference points for Read (Col 3)
    summarize main_b_val if subject == "read" & model_col == "col3", meanonly
    local b_ref = r(mean)
    
    summarize main_ci_lb if subject == "read" & model_col == "col3", meanonly
    local lb_ref = r(mean)
    
    summarize main_ci_ub if subject == "read" & model_col == "col3", meanonly
    local ub_ref = r(mean)

    kdensity loo_b if subject == "read" & model_col == "col3", generate(x_dens y_dens) nograph

    twoway (line y_dens x_dens, lcolor(black) lwidth(thick)) ///
           (pci 0.1 `lb_ref' 0.1 `ub_ref', lcolor(black) lwidth(medium)) ///
           (pci 0 `lb_ref' 0.2 `lb_ref', lcolor(black) lwidth(medium)) ///
           (pci 0 `ub_ref' 0.2 `ub_ref', lcolor(black) lwidth(medium)) ///
           (scatteri 0.1 `b_ref', mcolor(black) msymbol(D) msize(medium)) ///
           , ///
           title("") ///
           xtitle("Coefficient value of management on test scores regression", size(large)) ///
           ytitle(, size(large)) ///
           xlabel(0(.5)4, nogrid labsize(large)) yscale(range(-0.25 2.5)) ylabel(0(.5)2.5, labsize(large)) ///
           text(-0.1 `b_ref' "Reference coefficient", size(medium)) ///
           legend(off) note("") ///
           name(plot_read, replace)
        
    * Saving the final combined plot as PDF
    graph export "analysis/results/figure_a2a.pdf", replace
}

* coefscie
{
    * Getting dynamic reference points for Science (Col 3)
    summarize main_b_val if subject == "scie" & model_col == "col3", meanonly
    local b_ref = r(mean)
    
    summarize main_ci_lb if subject == "scie" & model_col == "col3", meanonly
    local lb_ref = r(mean)
    
    summarize main_ci_ub if subject == "scie" & model_col == "col3", meanonly
    local ub_ref = r(mean)

    kdensity loo_b if subject == "scie" & model_col == "col3", generate(x_sc y_sc) nograph

    twoway (line y_sc x_sc, lcolor(black) lwidth(thick)) ///
           (pci 0.1 `lb_ref' 0.1 `ub_ref', lcolor(black) lwidth(medium)) ///
           (pci 0 `lb_ref' 0.2 `lb_ref', lcolor(black) lwidth(medium)) ///
           (pci 0 `ub_ref' 0.2 `ub_ref', lcolor(black) lwidth(medium)) ///
           (scatteri 0.1 `b_ref', mcolor(black) msymbol(D) msize(medium)) ///
           , ///
           title("") ///
           xtitle("Coefficient value of management on test scores regression", size(large)) ///
           ytitle(, size(large)) ///
           xlabel(0(1)4, nogrid labsize(large)) yscale(range(-0.25 2.5)) ylabel(0(.5)2.5, labsize(large)) ///
           text(-0.1 `b_ref' "Reference coefficient", size(medium)) ///
           legend(off) note("") ///
           name(plot_scie, replace)

    * Saving the final combined plot as PDF
    graph export "analysis/results/figure_a2c.pdf", replace
}        

* coefmath
{
    * Getting dynamic reference points for Math (Col 3)
    summarize main_b_val if subject == "math" & model_col == "col3", meanonly
    local b_ref = r(mean)
    
    summarize main_ci_lb if subject == "math" & model_col == "col3", meanonly
    local lb_ref = r(mean)
    
    summarize main_ci_ub if subject == "math" & model_col == "col3", meanonly
    local ub_ref = r(mean)
 
    kdensity loo_b if subject == "math" & model_col == "col3", generate(x_m y_m) nograph

    twoway (line y_m x_m, lcolor(black) lwidth(thick)) ///
           (pci 0.1 `lb_ref' 0.1 `ub_ref', lcolor(black) lwidth(medium)) ///
           (pci 0 `lb_ref' 0.2 `lb_ref', lcolor(black) lwidth(medium)) ///
           (pci 0 `ub_ref' 0.2 `ub_ref', lcolor(black) lwidth(medium)) ///
           (scatteri 0.1 `b_ref', mcolor(black) msymbol(D) msize(medium)) ///
           , ///
           title("") ///
           xtitle("Coefficient value of management on test scores regression", size(large)) ///
           ytitle(, size(large)) ///
           xlabel(0(1)4, nogrid labsize(large)) yscale(range(-0.25 2.5)) ylabel(0(.5)2.5, labsize(large)) ///
           text(-0.1 `b_ref' "Reference coefficient", size(medium)) ///
           legend(off) note("") ///
           name(plot_math, replace)

    * Saving the final combined plot as PDF
    graph export "analysis/results/figure_a2b.pdf", replace
}        

* pread
{
    * Get the main coefficient value for this specific panel to draw the line
    summarize main_p_val if subject == "read" & model_col == "col3", meanonly
    local main_p_line = r(max) 
        
    * Create a temporary file to save this one plot
    tempfile plot_read_col3_p
        
    * Generate the kdensity plot for this subset
    kdensity loo_p if subject == "read" & model_col == "col3", bw(.002) ///
        lcolor(black) lwidth(thick) title("") ///
        xtitle("P-value of coefficient," "management on test scores regression", size(large)) ///
        ytitle(, size(large)) ///
        xline(`main_p_line', lpattern(solid) lcolor(black) lwidth(medium)) ///
        xlabel(0(.025).1, nogrid labsize(large)) ylabel(0(50)125, labsize(large)) ///
        text(125 .022 "<-- Reference p-value", size(medium)) note("") ///
        name(plot_read_p, replace)
        
    * Saving the final combined plot as PDF
    graph export "analysis/results/figure_a2d.pdf", replace
}

* pmath
{
    * Get the main coefficient value for this specific panel to draw the line
    summarize main_p_val if subject == "math" & model_col == "col3", meanonly
    local main_p_line = r(max) 
        
    * Create a temporary file to save this one plot
    tempfile plot_math_col3_p
        
    * Generate the kdensity plot for this subset
    kdensity loo_p if subject == "math" & model_col == "col3", bw(.005) ///
        lcolor(black) lwidth(thick) title("") ///
        xtitle("P-value of coefficient," "management on test scores regression", size(large)) ///
        ytitle(, size(large)) ///
        xline(`main_p_line', lpattern(solid) lcolor(black) lwidth(medium)) ///
        xlabel(0(.025).1, nogrid labsize(large)) ylabel(0(50)125, labsize(large)) ///
        text(125 .037 "<-- Reference p-value", size(medium)) note("") ///
        name(plot_math_p, replace)
        
    * Saving the final combined plot as PDF
    graph export "analysis/results/figure_a2e.pdf", replace
}

* pscie
{
    * Get the main coefficient value for this specific panel to draw the line
    summarize main_p_val if subject == "scie" & model_col == "col3", meanonly
    local main_p_line = r(max) 
        
    * Create a temporary file to save this one plot
    tempfile plot_scie_col3_p
        
    * Generate the kdensity plot for this subset
    kdensity loo_p if subject == "scie" & model_col == "col3", bw(.005) ///
        lcolor(black) lwidth(thick) title("") ///
        xtitle("P-value of coefficient," "management on test scores regression", size(large)) ///
        ytitle(, size(large)) ///
        xline(`main_p_line', lpattern(solid) lcolor(black) lwidth(medium)) ///
        xlabel(0(.025).1 , nogrid labsize(large)) ylabel(0(50)125, labsize(large)) ///
        text(125 .048 "<-- Reference p-value", size(medium)) note("") ///
        name(plot_scie_p, replace)
        
    * Saving the final combined plot as PDF
    graph export "analysis/results/figure_a2f.pdf", replace
}


