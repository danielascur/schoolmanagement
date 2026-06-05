// Purpose: Political turnover and test scores

*-----------------------------------------*
* 
*-----------------------------------------*

// Color scheme 
set scheme stmono1

local yrange_wms "-.4(.2).6"

	
// Municipal Schools	

	use "analysis/data/PoliticalTurnover_StdtLevel2007_2013_MunicSchools", clear

	// Sample selection
	keep if (year==2009 | year==2013)
	drop if (year==2009 & supplement_2008==1) | (year==2013 & supplement_2012==1)
	drop if (year==2009 & population_large==1) | (year==2013 & population_large==1)
	gen year_dummy=(year==2013) if !mi(year)

	// We combine both grades

	gen both_score_indiv_stdComb = .
	replace both_score_indiv_stdComb = both_score_indiv_5_stdComb if grade == 5
	replace both_score_indiv_stdComb = both_score_indiv_9_stdComb if grade == 9

	gen both_score_baseline = .
	replace both_score_baseline = both_score_5_baseline if grade == 5
	replace both_score_baseline = both_score_9_baseline if grade == 9

		* Selecting the bandwidth

		rdbwselect both_score_indiv_stdComb pX if !mi(urban_schl), ///
			kernel(uni) covs(both_score_baseline) ///
			vce(cluster COD_MUNICIPIO)
		
		local w0=e(h_mserd)
		local j=substr("`w0'",1,5)
		
		* Storing discontinuity beta and p-value
		
		reg both_score_indiv_stdComb pX_dummy pX pX_pD both_score_baseline ///
			if abs(pX)<=`w0' & !mi(urban_schl), ///
			cluster(COD_MUNICIPIO)
			
		local beta: di %6.3f _b[pX_dummy]
		local t = _b[pX_dummy]/_se[pX_dummy]
		local p_value = 2*ttail(e(df_r),abs(`t'))
		local p: di %5.3f `p_value'	

		* For the binscatter itself

		binscatter both_score_indiv_stdComb pX ///
			if abs(pX)<=`w0' & !mi(urban_schl), ///
			rd(0) controls(both_score_baseline) ///
			xsca(reverse) xlabel(-`j'(`j')`j') ///
			ysca(r(-.4 .6)) ylabel(`yrange_wms') ///
			xtitle("Incumbent Vote Margin", size(large)) ///
			ytitle("Test Scores (s.d.)", size(large)) ///
			caption("RD Estimate: `beta' [`p']", ring(0) pos(7))
			
			graph export "analysis/results/figure_3a.pdf", replace
			
//  Non-Municipal Schools	

	use "analysis/data/PoliticalTurnover_StdtLevel2007_2013_NonMunicSchools", clear

	// Sample selection
	keep if (year==2009 | year==2013)
	drop if (year==2009 & supplement_2008==1) | (year==2013 & supplement_2012==1)
	drop if (year==2009 & population_large==1) | (year==2013 & population_large==1)
	gen year_dummy=(year==2013) if !mi(year)

	// We combine both grades

	gen both_score_indiv_stdComb = .
	replace both_score_indiv_stdComb = both_score_indiv_5_stdComb if grade == 5
	replace both_score_indiv_stdComb = both_score_indiv_9_stdComb if grade == 9

	gen both_score_baseline = .
	replace both_score_baseline = both_score_5_baseline if grade == 5
	replace both_score_baseline = both_score_9_baseline if grade == 9

		* Selecting the bandwidth

		rdbwselect both_score_indiv_stdComb pX if !mi(urban_schl), ///
			kernel(uni) covs(both_score_baseline) ///
			vce(cluster COD_MUNICIPIO)
		
		local w0=e(h_mserd)
		local j=substr("`w0'",1,5)
		
		* Storing discontinuity beta and p-value
		
		reg both_score_indiv_stdComb pX_dummy pX pX_pD both_score_baseline ///
			if abs(pX)<=`w0' & !mi(urban_schl), ///
			cluster(COD_MUNICIPIO)
			
		local beta: di %6.3f _b[pX_dummy]
		local t = _b[pX_dummy]/_se[pX_dummy]
		local p_value = 2*ttail(e(df_r),abs(`t'))
		local p: di %5.3f `p_value'	

		* For the binscatter itself

		binscatter both_score_indiv_stdComb pX ///
			if abs(pX)<=`w0' & !mi(urban_schl), ///
			rd(0) controls(both_score_baseline) ///
			xsca(reverse) xlabel(-`j'(`j')`j') ///
			ysca(r(-.4 .6)) ylabel(`yrange_wms', labsize(medlarge)) ///
			xtitle("Incumbent Vote Margin", size(large)) ///
			ytitle("Test Scores (s.d.)", size(large)) ///
			caption("RD Estimate: `beta' [`p']", ring(0) pos(7))
			
			graph export "analysis/results/figure_3b.pdf", replace
			
			



// Color scheme 
set scheme stmono1

local yrange_a "-.4(.1).3"
local yrange_wms "-.4(.2).6"
local yrange_pca "-1(.3).5"

*------------------------------------------------------
* Panels A: main results
*------------------------------------------------------

use "analysis/data/PoliticalTurnover_SchlGradeLevel2007_2013_MunicSchools", clear

// We want this to be at the school level
egen unique = tag(PK_COD_ENTIDADE year)
keep if unique == 1
drop unique

// Setting panel
egen id = group(PK_COD_ENTIDADE)
tsset id year, delta(2)

// Stacking/combining the 2008 & 2012 elections + sample restrictions
keep if (year==2009 | year==2013)
drop if (year==2009 & supplement_2008==1) | (year==2013 & supplement_2012==1)
drop if (year==2009 & population_large==1) | (year==2013 & population_large==1)
generate year_dummy=(year==2013) if !mi(year)

// standardizing management scores within this subsample
egen MM_wms_std = std(MM_wms_practices_schl)
egen MM_wms_baseline_std = std(MM_wms_practices_baseline_schl)
replace MM_wms_practices_schl = MM_wms_std
replace MM_wms_practices_baseline_schl = MM_wms_baseline_std
drop MM_wms_std MM_wms_baseline_std

// Force bins
xtile temp1=pX if pX>0 & !mi(pX), n(20)
xtile temp2=pX if pX<0 & !mi(pX), n(20)
gen bins_pX=temp2 if !mi(temp2)
replace bins_pX=20+temp1 if !mi(temp1)

// Panel A: Municipal schools

	* Selecting bandwidth

	rdbwselect MM_wms_practices_schl pX if !mi(urban_schl), ///
		covs(MM_wms_practices_baseline_schl) ///
		kernel(uni) vce(cluster COD_MUNICIPIO) 

	local w0=e(h_mserd)
	local j=substr("`w0'",1,5)
	
	* Storing discontiuity beta and p-value
	
	reg MM_wms_practices_schl pX_dummy pX pX_pD MM_wms_practices_baseline_schl ///
		if abs(pX)<=`w0' & !mi(urban_schl), ///
		cluster(COD_MUNICIPIO)
		
	local beta: di %6.3f _b[pX_dummy]
	local t = _b[pX_dummy]/_se[pX_dummy]
	local p_value = 2*ttail(e(df_r),abs(`t'))
	local p: di %5.3f `p_value'
	
	* Running the binscatter itself

	binscatter MM_wms_practices_schl pX if abs(pX)<=`j' & !mi(urban_schl), ///
		controls (MM_wms_practices_baseline_schl) ///
		rd(0) xq(bins_pX) ///
		xsca(reverse) xlabel(-`j'(`j')`j', ///
		labsize(medlarge) format(%9.3fc))  ///
		ylabel(`yrange_wms', labsize(medlarge)) ///
		title("") xtitle("Incumbent Vote Margin", size(large)) ///
		ytitle("Management Index", size(large)) ///
		caption("RD Estimate: `beta' [`p']", ring(0) pos(7))

		graph export "analysis/results/figure_3c.pdf", replace
		
*------------------------------------------------------
* Panel B: placebo results -- V2 - nonmunic schools
*------------------------------------------------------		
		
use "analysis/data/PoliticalTurnover_SchlGradeLevel2007_2013_NonMunicSchools", clear

// We want this to be at the school level
egen unique = tag(PK_COD_ENTIDADE year)
keep if unique == 1
drop unique

// Setting panel
egen id = group(PK_COD_ENTIDADE)
tsset id year, delta(2)

// Stacking/combining the 2008 & 2012 elections + sample restrictions
keep if (year==2009 | year==2013)
drop if (year==2009 & supplement_2008==1) | (year==2013 & supplement_2012==1)
drop if (year==2009 & population_large==1) | (year==2013 & population_large==1)
generate year_dummy=(year==2013) if !mi(year)

// standardizing management scores within this subsample
egen MM_wms_std = std(MM_wms_practices_schl)
egen MM_wms_baseline_std = std(MM_wms_practices_baseline_schl)
replace MM_wms_practices_schl = MM_wms_std
replace MM_wms_practices_baseline_schl = MM_wms_baseline_std
drop MM_wms_std MM_wms_baseline_std

// Force bins
xtile temp1=pX if pX>0 & !mi(pX), n(20)
xtile temp2=pX if pX<0 & !mi(pX), n(20)
gen bins_pX=temp2 if !mi(temp2)
replace bins_pX=20+temp1 if !mi(temp1)

	* Selecting bandwidth

	rdbwselect MM_wms_practices_schl pX if !mi(urban_schl), ///
		covs(MM_wms_practices_baseline_schl) ///
		kernel(uni) vce(cluster COD_MUNICIPIO) 

	local w0=e(h_mserd)
	local j=substr("`w0'",1,5)
	
	* Storing discontinuity beta and p-value
	
	reg MM_wms_practices_schl pX_dummy pX pX_pD MM_wms_practices_baseline_schl ///
		if abs(pX)<=`w0' & !mi(urban_schl), ///
		cluster(COD_MUNICIPIO)
		
	local beta: di %6.3f _b[pX_dummy]
	local t = _b[pX_dummy]/_se[pX_dummy]
	local p_value = 2*ttail(e(df_r),abs(`t'))
	local p: di %5.3f `p_value'

	* Running the binscatter itself

	binscatter MM_wms_practices_schl pX if abs(pX)<=`j' & !mi(urban_schl), ///
		controls (MM_wms_practices_baseline_schl) ///
		rd(0) xq(bins_pX) ///
		xsca(reverse) xlabel(-`j'(`j')`j', ///
		labsize(medlarge) format(%9.3fc))  ///
		ylabel(`yrange_wms', labsize(medlarge)) ///
		title("") xtitle("Incumbent Vote Margin", size(large)) ///
		ytitle("Management Index", size(large)) ///
		caption("RD Estimate: `beta' [`p']", ring(0) pos(7)) 

		graph export "analysis/results/figure_3d.pdf", replace			
			
			
			
			
