// Management in Schools
// Created by: Fabiano Dal-Ri
// (fabianodr@al.insper.edu.br)
// Date created: March 2022

// Purpose: Replication code for Table 3: Akhtari et al. (2021) replication with management 


*------------------------------------------------------
* Panel A: municipal schools
*------------------------------------------------------

use "analysis/data/PoliticalTurnover_SchlGradeLevel2007_2013_MunicSchools", clear

// We want this to be at the school level
egen unique = tag(PK_COD_ENTIDADE year)
keep if unique == 1
drop unique

// Setting up panel
egen id = group(PK_COD_ENTIDADE)
tsset id year, delta(2)

// Stacking/combining the 2008 and 2012 elections + selecting sample
// Only considering outcomes 1 year after the election
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

	eststo clear

	*Estimate optimal bandwidth

	rdbwselect MM_wms_practices_schl pX if !mi(urban_schl), ///
		covs(MM_wms_practices_baseline_schl) ///
		kernel(uni) vce(cluster COD_MUNICIPIO)
	
	local w0 =e(h_mserd)

	* Considering three different badwidths (the optimal one and two others)

	foreach band of numlist `w0' 0.07 0.11 {

	*NO CONTROLS

	eststo: reg MM_wms_practices_schl pX_dummy pX pX_pD MM_wms_practices_baseline_schl ///
		if abs(pX)<=`band' & !mi(urban_schl), ///
		cluster(COD_MUNICIPIO)
	
	local cluster=`e(N_clust)'

	estadd local controls " "
	estadd scalar clusters=`cluster'
	estadd scalar bw=`band'
	estadd scalar bw_opt=`w0'

	*ALL CONTROLS

	eststo: reg MM_wms_practices_schl pX_dummy pX pX_pD year_dummy MM_wms_practices_baseline_schl $controls_sch ///
		if abs(pX)<=`band' & !mi(urban_schl), ///
		cluster(COD_MUNICIPIO)
		
	local cluster=`e(N_clust)'

	estadd local controls "Y"
	estadd scalar clusters=`cluster'
	estadd scalar bw=`band'
	estadd scalar bw_opt=`w0'
	
}

esttab using "analysis/results/table_a3a.tex", tex ///
	replace frag noconstant nomtitle nogap collabels(none) ///
	mgroups("Outcome: Management Index", ///
	pattern(1 0 0 0 0 0) prefix(\multicolumn{@span}{c}{) suffix(}) span ///
	erepeat(\cmidrule(lr){@span})) ///
	keep(pX_dummy MM_wms_practices_baseline_schl) cells(b(star fmt(3)) se(par fmt(3))) starlevels(* 0.1 ** 0.05 *** 0.01) ///
	coeflabels(pX_dummy "\hline \textbf{Municipal Schools} \\ $1[IVoteM_{mt}<0]$" ///
	MM_wms_practices_baseline_schl "Baseline Management Index") ///
	stats(r2 N clusters bw bw_opt, fmt(3 %9.0fc %9.0fc 3 3) ///
	label("\\ R-Squared" "\\ \# School-year obs" "\# Schools" ///
	"Using Bandwidth" "Optimal Bandwidth")) ///
	obslast nolines
	
eststo clear

*------------------------------------------------------
* Panel B: non-municipal schools
*------------------------------------------------------

use "analysis/data/PoliticalTurnover_SchlGradeLevel2007_2013_NonMunicSchools", clear

// We want this to be at the school level
egen unique = tag(PK_COD_ENTIDADE year)
keep if unique == 1
drop unique

// Setting up panel
egen id = group(PK_COD_ENTIDADE)
tsset id year, delta(2)

// Stacking/combining the 2008 and 2012 elections + selecting sample
// Only considering outcomes 1 year after the election
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

	eststo clear

	*Estimate optimal bandwidth

	rdbwselect MM_wms_practices_schl pX if !mi(urban_schl), ///
		covs(MM_wms_practices_baseline_schl) ///
		kernel(uni) vce(cluster COD_MUNICIPIO)
	
	local w0 =e(h_mserd)

	* Considering three different badwidths (the optimal one and two others)

	foreach band of numlist `w0' 0.07 0.11 {

	*NO CONTROLS

	eststo: reg MM_wms_practices_schl pX_dummy pX pX_pD MM_wms_practices_baseline_schl ///
		if abs(pX)<=`band' & !mi(urban_schl), ///
		cluster(COD_MUNICIPIO)
	
	local cluster=`e(N_clust)'

	estadd local controls " "
	estadd scalar clusters=`cluster'
	estadd scalar bw=`band'
	estadd scalar bw_opt=`w0'

	*ALL CONTROLS

	eststo: reg MM_wms_practices_schl pX_dummy pX pX_pD year_dummy MM_wms_practices_baseline_schl $controls_sch ///
		if abs(pX)<=`band' & !mi(urban_schl), ///
		cluster(COD_MUNICIPIO)
		
	local cluster=`e(N_clust)'

	estadd local controls "Y"
	estadd scalar clusters=`cluster'
	estadd scalar bw=`band'
	estadd scalar bw_opt=`w0'
	
}

esttab using "analysis/results/table_a3b.tex", tex ///
	replace frag noconstant nomtitle nogap collabels(none) ///
	keep(pX_dummy MM_wms_practices_baseline_schl) cells(b(star fmt(3)) se(par fmt(3))) starlevels(* 0.1 ** 0.05 *** 0.01) ///
	coeflabels(pX_dummy "\\ \hline \textbf{Non-Municipal Schools} \\ $1[IVoteM_{mt}<0]$" ///
	MM_wms_practices_baseline_schl "Baseline Management Index") ///
	stats(r2 N clusters bw bw_opt controls, fmt(3 %9.0fc %9.0fc 3 3 0) ///
	label("\\ R-Squared" "\\ \# School-year obs" "\# Schools" ///
	"Using Bandwidth" "Optimal Bandwidth" "\\ \textbf{Controls} \\ School controls")) ///
	obslast nolines nodepvars noeqli nonumber eqlabels(none) substitute("\_" "_")
	
eststo clear



