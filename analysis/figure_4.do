// Management in Schools
// Created by: Fabiano Dal-Ri
// (fabianodr@al.insper.edu.br)
// Date created: June 2022

// Purpose: Political Turnover and Management Index -- by new principal

*-----------------------------------------*
* Main results
*-----------------------------------------*

// Color scheme 
set scheme stmono1

use "analysis/data/PoliticalTurnover_SchlGradeLevel2007_2013_MunicSchools", clear

// We want this to be at the school level
egen unique = tag(PK_COD_ENTIDADE year)
keep if unique == 1
drop unique

// Sample selection
keep if (year==2009 | year==2013)
drop if (year==2009 & supplement_2008==1) | (year==2013 & supplement_2012==1)
drop if (year==2009 & population_large==1) | (year==2013 & population_large==1)
gen year_dummy=(year==2013) if !mi(year)

// standardizing management scores within this subsample
egen MM_wms_std = std(MM_wms_practices_schl)
egen MM_wms_baseline_std = std(MM_wms_practices_baseline_schl)
replace MM_wms_practices_schl = MM_wms_std
replace MM_wms_practices_baseline_schl = MM_wms_baseline_std
drop MM_wms_std MM_wms_baseline_std

	***** First panel: no headmaster replacement

	* Selecting the bandwidth
	
	rdbwselect MM_wms_practices_schl pX if expthisschl_lessthan2_DPB == 0 ///
		& !mi(urban_schl), kernel(uni) covs(MM_wms_practices_baseline_schl) ///
		vce(cluster COD_MUNICIPIO)
	
	local w0=e(h_mserd)
	local j=substr("`w0'",1,5)

	* Storing discontinuity beta and p-value
	
	reg MM_wms_practices_schl pX_dummy pX pX_pD MM_wms_practices_baseline_schl ///
		if abs(pX)<=`w0' & !mi(urban_schl) & expthisschl_lessthan2_DPB == 0, ///
		cluster(COD_MUNICIPIO)
		
	local beta: di %6.3f _b[pX_dummy]
	local t = _b[pX_dummy]/_se[pX_dummy]
	local p_value = 2*ttail(e(df_r),abs(`t'))
	local p: di %5.3f `p_value'
	
	* For the binscatter itself

	binscatter MM_wms_practices_schl pX if expthisschl_lessthan2_DPB == 0 ///
		& abs(pX)<=`w0' & !mi(urban_schl), ///
		rd(0) controls(MM_wms_practices_baseline_schl) ///
		xsca(reverse) xlabel(-`j'(`j')`j') ///
		ysca(r(-.40 .60)) ylabel(-.40(.20).60) ///
		xtitle("Incumbent Vote Margin", size(large)) ///
		ytitle("Management Index", size(large)) ///
		name(GrNoRep, replace) ///
		caption("RD Estimate: `beta' [`p']", ring(0) pos(7))
		
		graph export "analysis/results/figure_4b.pdf", replace
	
	***** Second panel: headmaster replacement

	* Selecting the bandwidth

	rdbwselect MM_wms_practices_schl pX if expthisschl_lessthan2_DPB == 1 ///
		& !mi(urban_schl), kernel(uni) covs(MM_wms_practices_baseline_schl) ///
		vce(cluster COD_MUNICIPIO)
	
	local w0=e(h_mserd)
	local j=substr("`w0'",1,5)

	* Storing discontinuity beta and p-value
	
	reg MM_wms_practices_schl pX_dummy pX pX_pD MM_wms_practices_baseline_schl ///
		if abs(pX)<=`w0' & !mi(urban_schl) & expthisschl_lessthan2_DPB == 1, ///
		cluster(COD_MUNICIPIO)
		
	local beta: di %6.3f _b[pX_dummy]
	local t = _b[pX_dummy]/_se[pX_dummy]
	local p_value = 2*ttail(e(df_r),abs(`t'))
	local p: di %5.3f `p_value'
	
	* For the binscatter itself

	binscatter MM_wms_practices_schl pX if expthisschl_lessthan2_DPB == 1 ///
		& abs(pX)<=`w0' & !mi(urban_schl), ///
		rd(0) controls(MM_wms_practices_baseline_schl) ///
		xsca(reverse) xlabel(-`j'(`j')`j') ///
		ysca(r(-.40 .60)) ylabel(-.40(.20).60) ///
		xtitle("Incumbent Vote Margin", size(large)) ///
		ytitle("Management Index", size(large)) ///
		name(GrRep, replace) ///
		caption("RD Estimate: `beta' [`p']", ring(0) pos(7))
		
		graph export "analysis/results/figure_4a.pdf", replace
		

		

*-----------------------------------------*
* Main results
*-----------------------------------------*

use "analysis/data/PoliticalTurnover_SchlGradeLevel2007_2013_MunicSchools", clear

// We want this to be at the school level
egen unique = tag(PK_COD_ENTIDADE year)
keep if unique == 1
drop unique

// Sample selection
keep if (year==2009 | year==2013)
drop if (year==2009 & supplement_2008==1) | (year==2013 & supplement_2012==1)
drop if (year==2009 & population_large==1) | (year==2013 & population_large==1)
gen year_dummy=(year==2013) if !mi(year)

// standardizing management scores within this subsample
egen MM_wms_std = std(MM_wms_practices_schl)
egen MM_wms_baseline_std = std(MM_wms_practices_baseline_schl)
replace MM_wms_practices_schl = MM_wms_std
replace MM_wms_practices_baseline_schl = MM_wms_baseline_std
drop MM_wms_std MM_wms_baseline_std

// creating indictor variable for appointed principals
gen principal_appt = 0
replace principal_appt = 1 if (apptment_cat_13_DPB == 3 | apptment_cat_13_DPB == 6) & year == 2013
replace principal_appt = 1 if (apptment_cat_DPB == 4 | apptment_cat_DPB == 5 |apptment_cat_DPB == 6) ///
	& (year == 2007 | year == 2009 | year == 2011)
replace principal_appt = . if (apptment_cat_13_DPB == . & apptment_cat_DPB == .)

	***** First panel: not appointed

	* Selecting the bandwidth

	rdbwselect MM_wms_practices_schl pX if principal_appt == 0 ///
		& !mi(urban_schl), kernel(uni) covs(MM_wms_practices_baseline_schl) ///
		vce(cluster COD_MUNICIPIO)
	
	local w0=e(h_mserd)
	local j=substr("`w0'",1,5)
	
	* Storing discontinuity beta and p-value
	
	reg MM_wms_practices_schl pX_dummy pX pX_pD MM_wms_practices_baseline_schl ///
		if abs(pX)<=`w0' & !mi(urban_schl) & principal_appt == 0, ///
		cluster(COD_MUNICIPIO)
		
	local beta: di %6.3f _b[pX_dummy]
	local t = _b[pX_dummy]/_se[pX_dummy]
	local p_value = 2*ttail(e(df_r),abs(`t'))
	local p: di %5.3f `p_value'

	* For the binscatter itself

	binscatter MM_wms_practices_schl pX if principal_appt == 0 ///
		& abs(pX)<=`w0' & !mi(urban_schl), ///
		rd(0) controls(MM_wms_practices_baseline_schl) ///
		xsca(reverse) xlabel(-`j'(`j')`j') ///
		ysca(r(-.40 .60)) ylabel(-.40(.20).60) ///
		xtitle("Incumbent Vote Margin", size(large)) ///
		ytitle("Management Index", size(large)) ///
		name(GrNotAppt, replace)  ///
		caption("RD Estimate: `beta' [`p']", ring(0) pos(7))
		
		graph export "analysis/results/figure_4d.pdf", replace
	
	***** Second panel: appointed

	* Selecting the bandwidth

	rdbwselect MM_wms_practices_schl pX if principal_appt == 1 ///
		& !mi(urban_schl), kernel(uni) covs(MM_wms_practices_baseline_schl) ///
		vce(cluster COD_MUNICIPIO)
	
	local w0=e(h_mserd)
	local j=substr("`w0'",1,5)
	
	* Storing discontinuity beta and p-value
	
	reg MM_wms_practices_schl pX_dummy pX pX_pD MM_wms_practices_baseline_schl ///
		if abs(pX)<=`w0' & !mi(urban_schl) & principal_appt == 1, ///
		cluster(COD_MUNICIPIO)
		
	local beta: di %6.3f _b[pX_dummy]
	local t = _b[pX_dummy]/_se[pX_dummy]
	local p_value = 2*ttail(e(df_r),abs(`t'))
	local p: di %5.3f `p_value'

	* For the binscatter itself

	binscatter MM_wms_practices_schl pX if principal_appt == 1 ///
		& abs(pX)<=`w0' & !mi(urban_schl), ///
		rd(0) controls(MM_wms_practices_baseline_schl) ///
		xsca(reverse) xlabel(-`j'(`j')`j') ///
		ysca(r(-.40 .60)) ylabel(-.40(.20).60) ///
		xtitle("Incumbent Vote Margin", size(large)) ///
		ytitle("Management Index", size(large)) ///
		name(GrAppt, replace) ///
		caption("RD Estimate: `beta' [`p']", ring(0) pos(7))
		
		graph export "analysis/results/figure_4c.pdf", replace
		
		
		
