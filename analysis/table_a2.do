
*------------------------------------------------------
* Management and school functioning (PB)
*------------------------------------------------------	

use "analysis/data/MgmtIndex_ProvaBrasil_SchlGradeYear", clear

///// only 2011 - 2015
keep if year >= 2011 & year <= 2015

// We want this to be at the school level
egen unique = tag(codschool year)
keep if unique == 1
drop unique

egen _miss_controls = rowmiss($all_controls)
drop if _miss_controls > 0
drop _miss_controls


eststo clear

// No Controls (year FE only)

	dis "col1"
	eststo col1: reg TS_wms_std_schl zmgmt i.year, ///
		cluster(codschool)
	estadd scalar obs = e(N) 
	estadd scalar sch = e(N_clust)
	estadd scalar rsqu = e(r2_a)
	estadd local yearfe 	"Y"
	estadd local statefe 	"Y"
	estadd local schoolfe   " " 
	estadd local sch_c 	" " 
	estadd local stud 	" " 

	dis "col2"
	eststo col2: reg TM_wms_std_schl zmgmt i.year, ///
		cluster(codschool)
	estadd scalar obs = e(N) 
	estadd scalar sch = e(N_clust)
	estadd scalar rsqu = e(r2_a)
	estadd local yearfe 	"Y"
	estadd local statefe    " " 
	estadd local sch_c 	" " 
	estadd local stud 	" " 

	dis "col3"
	eststo col3: reg TE_wms_std_schl zmgmt i.year, ///
		cluster(codschool)
	estadd scalar obs = e(N) 
	estadd scalar sch = e(N_clust)
	estadd scalar rsqu = e(r2_a)
	estadd local yearfe 	"Y"
	estadd local statefe    " " 
	estadd local sch_c 	" " 
	estadd local stud 	" " 

	dis "col4"
	eststo col4: reg HH_wms_std_schl zmgmt i.year, ///
		cluster(codschool)
	estadd scalar obs = e(N) 
	estadd scalar sch = e(N_clust)
	estadd scalar rsqu = e(r2_a)
	estadd local yearfe 	"Y"
	estadd local statefe    " " 
	estadd local sch_c 	" " 
	estadd local stud 	" " 

// All Controls

	dis "col1_ctrl"
	eststo col1_ctrl: areg TS_wms_std_schl zmgmt i.coduf i.year ${all_controls}, ///
		cluster(codschool) absorb(codschool)
	estadd scalar obs = e(N) 
	estadd scalar sch = e(N_clust)
	estadd scalar rsqu = e(r2_a)
	estadd local yearfe 	"Y"
	estadd local statefe    "Y" 
	estadd local sch_c 	"Y" 
	estadd local stud 	"Y" 

	dis "col2_ctrl"
	eststo col2_ctrl: areg TM_wms_std_schl zmgmt i.coduf i.year ${all_controls}, ///
		cluster(codschool) absorb(codschool)
	estadd scalar obs = e(N) 
	estadd scalar sch = e(N_clust)
	estadd scalar rsqu = e(r2_a)
	estadd local yearfe 	"Y"
	estadd local schoolfe   "Y" 
	estadd local sch_c 	"Y" 
	estadd local stud 	"Y" 

	dis "col3_ctrl"
	eststo col3_ctrl: areg TE_wms_std_schl zmgmt i.coduf i.year ${all_controls}, ///
		cluster(codschool) absorb(codschool)
	estadd scalar obs = e(N) 
	estadd scalar sch = e(N_clust)
	estadd scalar rsqu = e(r2_a)
	estadd local yearfe 	"Y"
	estadd local statefe    "Y" 
	estadd local sch_c 	"Y" 
	estadd local stud 	"Y" 

	dis "col4_ctrl"
	eststo col4_ctrl: areg HH_wms_std_schl zmgmt i.coduf i.year ${all_controls}, ///
		cluster(codschool) absorb(codschool)
	estadd scalar obs = e(N) 
	estadd scalar sch = e(N_clust)
	estadd scalar rsqu = e(r2_a)
	estadd local yearfe 	"Y"
	estadd local statefe    "Y" 
	estadd local sch_c 	"Y" 
	estadd local stud 	"Y" 

// creating LaTeX Table	
esttab col1 col1_ctrl col2 col2_ctrl col3 col3_ctrl col4 col4_ctrl ///
	using "analysis/results/table_a2.tex", tex ///
	replace frag compress noconstant nogap collabels(none) ///
	mgroups("Teacher shortage" "Teacher motivation" "Teacher effort" "Household effort" , pattern(1 0 1 0 1 0 1 0) ///
	prefix(\multicolumn{@span}{c}{) suffix(}) span erepeat(\cmidrule(lr){@span})) ///
	keep(zmgmt) cells(b(star fmt(3)) se(par fmt(3))) starlevels(* 0.1 ** 0.05 *** 0.01)  ///
	coeflabels(zmgmt "Management Index") ///
	stats(r2 obs sch yearfe statefe sch_c stud, fmt(3 %9.0fc %9.0fc 0 0 0 0 ) ///
	label("\\ R-Squared" "\\ \# School-year obs" "\# Schools" "\midrule \textbf{Controls} \\ Year FE" "State FE" "School" "Student")) ///
	obslast nolines nomtitles	
	
	
	
	
	
	
	
	
	
	
	
	
