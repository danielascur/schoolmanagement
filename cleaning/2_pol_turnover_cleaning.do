
*-----------------------------------------*
* Merge "Management Index" with "Akhtari et al. (2022)" at the school-grade-year level
*-----------------------------------------*

local indices a wms pca

**** Organizing data set to merge: Management Index at the school-grade-year level
**** This data set also contains school-year level management scores

use "analysis/data/MgmtIndex_ProvaBrasil_SchlGradeYear", clear

// Lagged MM score
egen id = group(codschool grade)
xtset id year, delta(2)
foreach i of local indices {
	generate MM_`i'_practices_baseline = L.MM_`i'_practices
	generate MM_`i'_practices_baseline_schl = L.MM_`i'_practices_schl
}
drop id

// Good/bad classification within each year and within each grade, using baseline MM scores
sort year grade
foreach p in 50 75 90 {
	foreach i of local indices {
	
		by year grade: egen p`p'_`i' = pctile(MM_`i'_practices_baseline), p(`p')
		generate MM_`i'_p`p' = .
		replace MM_`i'_p`p' = 0 if MM_`i'_practices_baseline < p`p'_`i'
		replace MM_`i'_p`p' = 1 if MM_`i'_practices_baseline >= p`p'_`i'
		
		by year grade: egen p`p'_`i'_schl = pctile(MM_`i'_practices_baseline_schl), p(`p')
		generate MM_`i'_p`p'_schl = .
		replace MM_`i'_p`p'_schl = 0 if MM_`i'_practices_baseline_schl < p`p'_`i'_schl
		replace MM_`i'_p`p'_schl = 1 if MM_`i'_practices_baseline_schl >= p`p'_`i'_schl		
		
	}
}

save "cleaning/tempdata/MgmtIndex_ProvaBrasil_SchlGradeYear_temp", replace

***** Main data set: Restricted to schools in the two data sets

foreach schltype in Munic NonMunic {

	use "input/Akhtari et al. (2022)/s_MainData_SchlLevel2007_2013_`schltype'Schools", clear

	expand 2, generate(grade)
	replace grade = 5 if grade == 0
	replace grade = 9 if grade == 1

	rename PK_COD_ENTIDADE codschool

	merge 1:1 codschool year grade using "cleaning/tempdata/MgmtIndex_ProvaBrasil_SchlGradeYear_temp", ///
		keepusing(MM_a_practices MM_wms_practices MM_pca_practices MM_a_practices_baseline MM_wms_practices_baseline MM_pca_practices_baseline MM_a_p50 MM_wms_p50 MM_pca_p50 MM_a_p75 MM_wms_p75 MM_pca_p75 MM_a_p90 MM_wms_p90 MM_pca_p90 TS_wms TE_wms TM_wms HH_wms ///
		MM_a_practices_schl MM_wms_practices_schl MM_pca_practices_schl MM_a_practices_baseline_schl MM_wms_practices_baseline_schl MM_pca_practices_baseline_schl MM_a_p50_schl MM_wms_p50_schl MM_pca_p50_schl MM_a_p75_schl MM_wms_p75_schl MM_pca_p75_schl MM_a_p90_schl MM_wms_p90_schl MM_pca_p90_schl TS_wms_schl TE_wms_schl TM_wms_schl HH_wms_schl)
	keep if _merge == 3
	drop _merge
	rename codschool PK_COD_ENTIDADE

	save "analysis/data/PoliticalTurnover_SchlGradeLevel2007_2013_`schltype'Schools", replace	

}



// *-----------------------------------------*
* Merge "Management Index" with "Akhtari et al. (2022)" at the STUDENT-year level
*-----------------------------------------*

local indices a wms pca

**** Organizing data set to merge: Management Index at the school-grade-year level
**** This data set also contains school-year level management scores

use "analysis/data/MgmtIndex_ProvaBrasil_SchlGradeYear", clear

// Lagged MM score
egen id = group(codschool grade)
xtset id year, delta(2)
foreach i of local indices {
	generate MM_`i'_practices_baseline = L.MM_`i'_practices
	generate MM_`i'_practices_baseline_schl = L.MM_`i'_practices_schl
}
drop id

// Good/bad classification within each year and within each grade, using baseline MM scores
sort year grade
foreach p in 50 75 90 {
	foreach i of local indices {
	
		by year grade: egen p`p'_`i' = pctile(MM_`i'_practices_baseline), p(`p')
		generate MM_`i'_p`p' = .
		replace MM_`i'_p`p' = 0 if MM_`i'_practices_baseline < p`p'_`i'
		replace MM_`i'_p`p' = 1 if MM_`i'_practices_baseline >= p`p'_`i'
		
		by year grade: egen p`p'_`i'_schl = pctile(MM_`i'_practices_baseline_schl), p(`p')
		generate MM_`i'_p`p'_schl = .
		replace MM_`i'_p`p'_schl = 0 if MM_`i'_practices_baseline_schl < p`p'_`i'_schl
		replace MM_`i'_p`p'_schl = 1 if MM_`i'_practices_baseline_schl >= p`p'_`i'_schl
		
	}
}

save "cleaning/tempdata/MgmtIndex_ProvaBrasil_SchlGradeYear_temp", replace

***** Main data set: Restricted to schools in the two data sets

foreach schltype in Munic NonMunic {
	use "input/Akhtari et al. (2022)/s_MainData_StdtLevel2007_2013_`schltype'Schools", clear

	// Even though this data set is at the student level, there is no variable indicating whether the student is in 4th or 8th grade
	// We use the variables both_score_indiv_`grade'_stdComb, since they are used in the regressions below
	// Let's generate this in the 5-9 format

	generate grade = .
	replace grade = 5 if both_score_indiv_4_stdComb != .
	replace grade = 9 if both_score_indiv_8_stdComb != .

	// And now to the merge itself

	rename PK_COD_ENTIDADE codschool

	merge m:1 codschool year grade using "cleaning/tempdata/MgmtIndex_ProvaBrasil_SchlGradeYear_temp", ///
		keepusing(MM_a_practices MM_wms_practices MM_pca_practices MM_a_practices_baseline MM_wms_practices_baseline MM_pca_practices_baseline MM_a_p50 MM_wms_p50 MM_pca_p50 MM_a_p75 MM_wms_p75 MM_pca_p75 MM_a_p90 MM_wms_p90 MM_pca_p90 TS_wms TE_wms TM_wms HH_wms ///
		MM_a_practices_schl MM_wms_practices_schl MM_pca_practices_schl MM_a_practices_baseline_schl MM_wms_practices_baseline_schl MM_pca_practices_baseline_schl MM_a_p50_schl MM_wms_p50_schl MM_pca_p50_schl MM_a_p75_schl MM_wms_p75_schl MM_pca_p75_schl MM_a_p90_schl MM_wms_p90_schl MM_pca_p90_schl TS_wms_schl TE_wms_schl TM_wms_schl HH_wms_schl)	
	keep if _merge == 3
	drop _merge

	rename codschool PK_COD_ENTIDADE

	// renaming some variables

	rename both_score_indiv_4_stdComb both_score_indiv_5_stdComb
	rename both_score_indiv_8_stdComb both_score_indiv_9_stdComb
	rename both_score_4_baseline both_score_5_baseline
	rename both_score_8_baseline both_score_9_baseline

	save "analysis/data/PoliticalTurnover_StdtLevel2007_2013_`schltype'Schools", replace	

}

*** Add variable expthisschl_lessthan2_DPB from school-grade-year level Political Turnover data sets

foreach schltype in Munic NonMunic {
	use "analysis/data/PoliticalTurnover_StdtLevel2007_2013_`schltype'Schools", clear

	merge m:1 PK_COD_ENTIDADE year using "input/Akhtari et al. (2022)/s_MainData_SchlLevel2007_2013_`schltype'Schools", keepusing(expthisschl_lessthan2_DPB)
	drop if _merge == 2
	drop _merge

	save "analysis/data/PoliticalTurnover_StdtLevel2007_2013_`schltype'Schools", replace
}

*** Add variable newtchr from school-grade-year level Political Turnover data sets

foreach schltype in Munic NonMunic {

	use "analysis/data/PoliticalTurnover_StdtLevel2007_2013_`schltype'Schools", clear

	merge m:1 PK_COD_ENTIDADE year using "input/Akhtari et al. (2022)/s_MainData_SchlLevel2007_2013_`schltype'Schools", keepusing(newtchr)
	drop if _merge == 2
	drop _merge

	save "analysis/data/PoliticalTurnover_StdtLevel2007_2013_`schltype'Schools", replace
}




