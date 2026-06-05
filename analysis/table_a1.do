
use "analysis/data/MgmtIndex_ProvaBrasil_StdtYear.dta", clear	

///// only 2011 - 2015
keep if year >= 2011 & year <= 2015

// Table

foreach x in port math {

	dis "col1_`x'"
	eststo col1_`x': reg score_saeb_`x'_std_year zmgmt i.year, cluster(codschool)
	estadd scalar nschool e(N_clust)
	estadd local yearfe 	"Y"
	estadd local statefe 	" " 
	estadd local schoolfe   " " 
	estadd local controls 	"Y" 
	
	dis "col2_`x'"
	eststo col2_`x': reg score_saeb_`x'_std_year zmgmt i.year i.coduf, cluster(codschool) 
	estadd scalar nschool e(N_clust)
	estadd local yearfe 	"Y"
	estadd local statefe 	"Y" 
	estadd local schoolfe   " " 
	estadd local controls 	"Y" 
	
	dis "col3_`x'"
	eststo col3_`x': reg score_saeb_`x'_std_year zmgmt i.year i.coduf $all_controls, cluster(codschool)
	estadd scalar nschool e(N_clust)
	estadd local yearfe 	"Y"
	estadd local statefe 	"Y" 
	estadd local schoolfe   " "
	estadd local controls 	"Y" 

	
	dis "col4_`x'"
	eststo col4_`x': areg score_saeb_`x'_std_year zmgmt i.year $all_controls , cluster(codschool) absorb(codschool)
	estadd scalar nschool e(N_clust)
	estadd local yearfe 	"Y"
	estadd local statefe 	" " 
	estadd local schoolfe   "Y" 
	estadd local controls 	"Y" 
}

// creating LaTeX Table
	
esttab col1_port col2_port col3_port col4_port   ///
	col1_math col2_math col3_math col4_math   ///
	using "analysis/results/table_a1.tex", tex ///
	replace frag compress noconstant nomtitle nogap collabels(none) ///
	mgroups("Portuguese Score" "Mathematics Score", pattern(1 0 0 0 1 0 0 0) ///
	prefix(\multicolumn{@span}{c}{) suffix(}) span erepeat(\cmidrule(lr){@span})) ///
	keep(zmgmt) cells(b(star fmt(3)) se(par fmt(3))) starlevels(* 0.1 ** 0.05 *** 0.01)  ///
	coeflabels(zmgmt "\hline Management Index") ///
	stats(r2 N nschool yearfe statefe controls schoolfe, fmt(3 %12.0fc %12.0fc 0 0 0 0) ///
	label("\\ R-Squared" "\\ \# Students"  "\# Schools" "\\ Year FE" "State FE" "Controls" "School FE")) ///
	obslast nolines 














