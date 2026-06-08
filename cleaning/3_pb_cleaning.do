*-----------------------------------------*
* Censo Escolar Data: it will be used as controls
*-----------------------------------------*

global input_census  "input/Censo Escolar"
global output_census "cleaning/tempdata"

* Stage anonymized Censo Escolar inputs.
forvalues year = 2007/2017 {
	use "$input_census/Escolas`year'.dta", clear
	save "$output_census/Escolas`year'.dta", replace

	use "$input_census/Turmas`year'.dta", clear
	save "$output_census/Turmas`year'.dta", replace
}

foreach year in 2007 2009 2010 2011 2012 2013 2014 2015 2016 2017 {
	use "$input_census/Professores`year'.dta", clear
	save "$output_census/Professores`year'.dta", replace
}

* Cleaning Teachers, Schools and Classes datasets
do "cleaning/aux_pb1_clean_census_teachers.do"
do "cleaning/aux_pb2_clean_census_schools.do"
do "cleaning/aux_pb3_clean_census_classes.do"



*-----------------------------------------*
* Prova Brasil Data
*-----------------------------------------*		
global input_pb  "input/PB"
global output_pb "cleaning/tempdata"

foreach dataset in Teachers Principals Schools Students {
	use "$input_pb/`dataset'.dta", clear
	save "$output_pb/`dataset'.dta", replace
}

global infra_names "infra_predio_telhado infra_predio_paredes infra_predio_piso infra_predio_portas infra_predio_janelas infra_predio_banheiros infra_predio_cozinha infra_predio_hidraulica infra_predio_eletrica"
do "cleaning/aux_pb4_clean_school.do"



*-----------------------------------------*
* Teachers
*-----------------------------------------*

use 	"cleaning/tempdata/Teachers.dta", clear

* Classifying questions as management practices or interemediates outcomes and scoring them

local 	teacher_controls  teacher_male teacher_white teacher_college_degree teacher_wage teacher_tenure teacher_less_40years teacher_less3min_wages
			
//MMTQ1, Management Index
recode 	use_news 		(0 2 = 0) (1 = 1), gen(MMTQ1_use_news)
recode 	use_literature_books 	(0 2 = 0) (1 = 1), gen(MMTQ1_use_literature_books)	
recode  def_cover_curricula	(1   = 0) (0 = 1), gen(MMTQ1_def_cover_curricula)
recode 	students_books  	(1 = 0)   (2 = 0.25) (3 = .5) (4 = 0.75) (5 = 1), gen(MMTQ1_students_books)
recode	share_curricula 	(1 = 0)   (2 = 0.33) (3 = 0.66) (4 = 1), gen(MMTQ1_share_curricula)

//MMTQ2, Management Index
recode  def_curricula		(1   = 0) (0 = 1), gen(MMTQ2_def_curricula)
recode  pedagogic_plan 		(1 2 = 0) (3 = 0.5) (4 = 1), gen(MMTQ2_pedagogic_plan)

//MMTQ4, Management Index
recode 	principal_innovation 	(1 2 = 0) (3 4 = 1), gen(MMTQ4_principal_innovation)
recode 	principal_learning	(1 2 = 0) (3 4 = 1), gen(MMTQ4_principal_learning)
			
//MMTQ7, Management Index
recode	meetings_class_council 	(4 5 = 0) (1 = 0.33) (2 = 0.66) (3 = 1), gen(MMTQ7_meetings_class_council) 
		
//TS T, Teacher Shortage Index
recode 	def_2muchwork 		 (1 = 1) (0 = 0), gen(TST_def_2muchwork)
		
//TM T, Teacher Motivation Index
recode 	principal_motivation 	 (1 2 = 0) (3 4 = 1), gen(TMT_principal_motivation)
recode 	principal_respect 	 (1 2 = 0) (3 4 = 1), gen(TMT_principal_respect)
recode 	principal_trust	 	 (1 2 = 0) (3 4 = 1), gen(TMT_principal_trust)
recode 	work_decisions	 	 (1 2 = 0) (3 4 = 1), gen(TMT_work_decisions)
recode 	my_ideas		 (1 2 = 0) (3 4 = 1), gen(TMT_my_ideas)
			
//HH T, Household Effort Index
recode 	def_noparents_support 	 (1 = 0) (0 = 1), gen(HHT_def_noparents_support)
recode 	def_student_loweffort 	 (1 = 0) (0 = 1), gen(HHT_def_student_loweffort)
recode 	def_bad_behavior 	 (1 = 0) (0 = 1), gen(HHT_def_bad_behavior)
recode 	def_absenteeism 	 (2 = 0) (1 = 0.5) (0 = 1), gen(HHT_def_absenteeism)

* The same class can have more than one teacher, lets calculate the average of teacher's characteristics by class		
collapse (mean) `teacher_controls' MM* TS* TM* HH* , by(id_class year codschool grade)	

	tempfile 	 teachers
	save 		`teachers'
		
collapse (mean) `teacher_controls' MM* TS* TM* HH*, by(year codschool grade) // 9th grade teachers at school level
	tempfile 	 teachers_school_level
	save 		`teachers_school_level'
		

		
*-----------------------------------------*
* Principals
*-----------------------------------------*

use "cleaning/tempdata/Principals.dta", clear

* Classifying questions as management practices or intermediates outcomes and scoring them
	
//MM P-Q2
clonevar    MMPQ2_abs_parents_meeting  	= absenteeism_parents_meeting
clonevar    MMPQ2_abssend_someone	= absenteeism_send_someone	
clonevar    MMPQ2_abs_talk_parents     	= absenteeism_talk_parents 
clonevar    MMPQ2_abs_parents_inperson 	= absenteeism_parents_inperson
clonevar    MMPQ2_abs_talk_students	= absenteeism_talk_students

recode book_choice (1 = 0) (2 = 0.5) (3 = 1), gen(MMPQ2_book_choice) 
recode pedagogic_plan  (1 2 = 0) (3 = 0.5) (4 = 1), gen(MMPQ2_pedagogic_plan) 
			
//MM P-Q3
recode criteria_teacher_classrooms (1 4 5 6 8 = 0) (2 3 = 1) (7 9 = .),	gen(MMPQ3_criteria_teacher)
recode criteria_classrooms 	   (5 = 0) (1 3 = 0.5) (2 4 = 1), gen(MMPQ3_criteria_classrooms)  
	
recode prog_reduce_dropout         (0 2 = 0) (1 = 1), gen(MMPQ3_prog_reduce_dropout)
recode prog_reduce_repetition 	   (0 2 = 0) (1 = 1), gen(MMPQ3_prog_reduce_repetition)
clonevar MMPQ3_prog_increase_learning = prog_increase_learning
			
//MM P-Q4
clonevar MMPQ4_org_training  = org_training
recode   teachers_training (0 = 0) (1 = 0.33) (2 = 0.66) (3 = 1), gen(MMPQ4_teachers_training )

//MM P-Q7
recode 	meetings_school_council	(4 5 = 0) (1 = 0.33) (2 = 0.66) (3 = 1), gen(MMPQ7_meetings_school_council)
recode 	meetings_class_council	(4 5 = 0) (1 = 0.33) (2 = 0.66) (3 = 1), gen(MMPQ7_meetings_class_council)
clonevar    MMPQ7_school_council_students = school_council_students
clonevar    MMPQ7_school_council_parents  = school_council_parents
clonevar    MMPQ7_school_council_staff    = school_council_staff
			
//TS P
recode 	lack_teachers	  (2 = 1) (1 = 0.5) (0 = 0), gen(TSP_lack_teachers)		
recode 	lack_pedago_staff (2 = 1) (1 = 0.5) (0 = 0), gen(TSP_lack_pedago_staff)	
recode  teachers_turnover (2 = 1) (1 = 0.5) (0 = 0), gen(TSP_teachers_turnover)	
			
//TE P
recode 	absenteeism_teachers (2 = 0) (1 = 0.5) (0 = 1), gen(TEP_absenteeism_teachers)	
			
//HH P
recode  absenteeism_students (2 = 0) (1 = 0.5) (0 = 1), gen(HHP_absenteeism_students)
recode 	student_bad_behavior (2 = 0) (1 = 0.5) (0 = 1), gen(HHP_student_bad_behavior)



***** Principal characteristics

* gender
gen p_male = (principal_gender==1)
replace p_male = . if principal_gender == .

* age (Dummy version >50 is median)
gen p_age50 = (principal_age_range>=1 & principal_age_range<=4)
replace p_age50 = . if principal_age_range==.

* seniority (Dummy version >14yrs is median)
rename principal_years_graduation p_seniority
gen p_sen15 = (p_seniority>=1 & p_seniority<=3)
replace p_sen15 = . if p_seniority==.

* pedagogical education
gen p_pededuc = (principal_edu == 3 & principal_edu!=. )
replace p_pededuc = . if principal_edu==.

* ba/ma
gen p_deg = 1 if principal_college_degree!=0 & principal_college_degree!=.
replace p_deg = 0 if principal_college_degree==0 & principal_college_degree!=.

* wage 
gen p_wage7plus = (principal_wage>=10)
replace p_wage7plus = . if principal_wage == .

* Additional variables
gen p_uniquejob = (principal_other_job==3 & principal_other_job!=.)
replace p_uniquejob = . if principal_other_job==.

* Turnover variable 
g newpr = (experience_asprincipal_school==1)
replace newpr=. if experience_asprincipal_school==.

* Financial Resources: making names shorter
ren finantial_resourses_federal 	fin_resourses_fed
ren finantial_resourses_state 		fin_resourses_state
ren finantial_resources_municipal 	fin_resourses_muni

* Keeping only raw variables (IMPUTATION WILL BE DONE LATER)
keep year codschool MMP* TS* TE* HH* ///
	p_male p_age50 p_sen15 p_pededuc p_deg p_wage7plus p_uniquejob ///
	fin_resourses_fed fin_resourses_state fin_resourses_muni newpr
	
tempfile principals
save 	`principals'


*-----------------------------------------*
* Student 
*-----------------------------------------*
use "cleaning/tempdata/Students.dta", clear
	
* Classifying students questions as intermediates outcomes and scoring them

//TES, Teacher Effort Index
recode homework_corrected_port (3 4 = 0) (2 = 0.5) (1 = 1), gen(TES_homework_corrected_port)
recode homework_corrected_math (3 4 = 0) (2 = 0.5) (1 = 1), gen(TES_homework_corrected_math)
	
//HHS, Household Effort Index
foreach name in study homework read school talk {
	clonevar HHS_incentive_`name' = incentive_`name'
}
recode parents_sch_meetings  	(3   = 0) (2 = 0.5) (1 = 1), gen(HHS_parents_sch_meetings)
recode do_homework_port 	(3 4 = 0) (2 = 0.5) (1 = 1), gen(HHS_do_homework_port )
recode do_homework_math 	(3 4 = 0) (2 = 0.5) (1 = 1), gen(HHS_do_homework_math )
tempfile students
save 	`students'

*********************************
collapse (mean) male white mother_edu_highschool incentive* ever_* work computer_internet ///
TE* HHS* *_insuf *_basic *_adequ *always like_port like_math socio_eco, by(year codschool grade)

foreach var of varlist *_insuf *_basic *_adequ {
	replace `var' = `var'*100
}
format	 male-like_math %5.2fc
tempfile students_school_level
save 	`students_school_level'


*-----------------------------------------*
* School 
*-----------------------------------------*

use "cleaning/tempdata/Schools.dta", clear
keep codschool year infra_index
tempfile schools	
save 	`schools'




*___________________________________________________________________________________________________________________*
*Censo Escolar


	**
	* School infrastrucure
	*------------------------------------------------------------------------------------------------------------------------*
		use  "cleaning/tempdata/School Infrastructure at school level.dta", clear
		tempfile infra
		save 	`infra'

		
	**
	* School size 
	*------------------------------------------------------------------------------------------------------------------------*
		* Adding the size of classes (and schools) and the number of teacher, and student teacher ratios
		use "cleaning/tempdata/Turmas.dta", clear

		* Keep only years after 2007
		keep if year >= 2007

		* Selecting  only variables that matter
		keep year codschool enrollments tclass5grade tclass9grade 

		* Creating grade variable 
		gen grade = .
		replace grade = 5 if tclass5grade == 1
		replace grade = 9 if tclass9grade == 1
		keep if grade != .

		* Collapsing the data (summing the enrollments for every combination of School-Year-Grade)
		collapse (sum) enrollments, by(codschool year grade)

		* Sorting and labelling
		sort codschool year grade
		label var grade "Grade (5 or 9)"
		label var enrollments "Total Enrollments"

		tempfile enroll_grade
		save 	`enroll_grade'

		
	**
	* Teacher numbers and Teacher School Ratio
	*------------------------------------------------------------------------------------------------------------------------*
		use  "cleaning/tempdata/Teachers per school.dta", clear
		keep year codschool Teacher5grade Teacher9grade
			
		* Renaming variables to create a consistent suffix for reshape
		rename Teacher5grade teacher5
		rename Teacher9grade teacher9

		* Reshaping data from wide to long format
		reshape long teacher, i(codschool year) j(grade)
	
	
		* Merging with school size
		merge 1:1 codschool year grade using `enroll_grade', keep(match) nogen
	

		**** Calculating ratios
			* Ratio at grade-school-year level
			gen stutch_ratio_grade = enrollments / teacher

			// Calculating total students and teachers at the school-year level
			bysort codschool year: egen stu = sum(enrollments)
			bysort codschool year: egen tch = sum(teacher)

			* Ratio at school-year level
			gen stutch_ratio = stu / tch
			
		tempfile stu_teacher
		save 	`stu_teacher'
				
**
**
*____________________________________________________________________________________________________________________________*
*Preparing Dataset at student and school levels
	
	**Student
	preserve
		use `students' if !missing(codschool), clear
		merge m:1 codschool year 		using `principals' 	, keep(1 3) nogen
		merge m:1 id_class codschool year 	using `teachers'   	, keep(1 3) nogen			
		merge m:1 codschool year 		using `infra'		, keep(1 3) nogen
		merge m:1 codschool year 		using `schools'   	, keep(1 3) nogen
		merge m:1 codschool year grade		using `stu_teacher'  	, keep(1 3) nogen
		
		* Ordering and saving 
		order year-coduf codmunic codschool network TES_homework_corrected_port-HHS_do_homework_math MMPQ2_abs_parents_meeting-HHP_student_bad_behavior MMTQ1_use_news-HHT_def_absenteeism
		save 	"cleaning/tempdata/PB_student_level.dta", replace
	restore
		
	**School-Grade
	preserve
		use `students_school_level' if !missing(codschool), clear
		merge m:1 codschool year 	using `principals'		, keep(1 3) nogen
		merge 1:1 grade codschool year 	using `teachers_school_level'	, keep(1 3) nogen			
		merge m:1 codschool year 	using `infra'			, keep(1 3) nogen
		merge m:1 codschool year 	using `schools'			, keep(1 3) nogen
		merge m:1 codschool year grade	using `stu_teacher'   		, keep(1 3) nogen
		
		* Ordering and saving 
		order year-coduf codmunic codschool network TES_homework_corrected_port-HHS_do_homework_math MMPQ2_abs_parents_meeting-HHP_student_bad_behavior MMTQ1_use_news-HHT_def_absenteeism
		save 	"cleaning/tempdata/PB_school_level.dta", replace
	restore

		
	
	
	*************************************
	* School-grade-year level mgmt index
	*************************************
	
	use "cleaning/tempdata/PB_school_level.dta", clear
	
	*-----------------------------------------*
	*  MANAGEMENT INDEX (WMS)  -- within year
	*-----------------------------------------*
	
	// mapping PB variables into the 5 big questions / practices
	egen MMQ1 = rowmean(MMTQ1_use_news MMTQ1_use_literature_books MMTQ1_def_cover_curricula MMTQ1_students_books MMTQ1_share_curricula)
	egen MMQ2 = rowmean(MMPQ2_abs_parents_meeting MMPQ2_abssend_someone MMPQ2_abs_talk_parents MMPQ2_abs_parents_inperson MMPQ2_abs_talk_students MMPQ2_book_choice MMPQ2_pedagogic_plan MMTQ2_def_curricula MMTQ2_pedagogic_plan)
	egen MMQ3 = rowmean(MMPQ3_criteria_teacher MMPQ3_criteria_classrooms MMPQ3_prog_reduce_dropout MMPQ3_prog_reduce_repetition MMPQ3_prog_increase_learning)
	egen MMQ4 = rowmean(MMPQ4_org_training MMPQ4_teachers_training MMTQ4_principal_innovation MMTQ4_principal_learning)
	egen MMQ7 = rowmean(MMPQ7_meetings_school_council MMPQ7_meetings_class_council MMPQ7_school_council_students MMPQ7_school_council_parents MMPQ7_school_council_staff MMTQ7_meetings_class_council)
	
	// standardize the practices -- within year
	
	levelsof year, local(years)
	
	foreach practice in Q1 Q2 Q3 Q4 Q7 {
	
		generate MM`practice'_std = .
		
		foreach y of local years {
			generate MM`practice'_`y' = MM`practice' if year == `y'
			egen MM`practice'_`y'_std = std(MM`practice'_`y')
			replace MM`practice'_std = MM`practice'_`y'_std if year == `y'
			drop MM`practice'_`y'
		}
	}
	
	// Anderson index -- within year
	levelsof year, local(years)
	generate MM_a_practices = .
	foreach y of local years {
		icw_index MMQ1_`y'_std MMQ2_`y'_std MMQ3_`y'_std MMQ4_`y'_std MMQ7_`y'_std, generate(MM_a_practices_`y')
		replace MM_a_practices = MM_a_practices_`y' if year == `y'
		drop MM_a_practices_`y' 
		
	}
	
	// WMS index (simple average) -- no difference if within year or not
	egen MM_wms_practices = rowmean(MMQ1_std MMQ2_std MMQ3_std MMQ4_std MMQ7_std)
	
	// PCA index -- within year
	local years 2007 2009 2011 2013 2015 2017
	generate MM_pca_practices = .
	foreach y of local years {
		pca MMQ1_`y'_std MMQ2_`y'_std MMQ3_`y'_std MMQ4_`y'_std MMQ7_`y'_std
		predict pc1, score
		rename pc1 MM_pca_practices_`y'
		replace MM_pca_practices = MM_pca_practices_`y' if year == `y'
		drop MM_pca_practices_`y'
	}

	*-----------------------------------------*
	* INTERMEDIATE OUTCOMES
	*-----------------------------------------*
		
	// some variable names are too long!
	rename TSP_lack_teachers    		TSP_lack_tch
	rename TSP_lack_pedago_staff		TSP_lack_ped_stf
	rename TSP_teachers_turnover		TSP_tch_turnover
	rename TST_def_2muchwork		TST_def_2muchwrk
	rename TMT_principal_motivation		TMT_prncpl_mot
	rename TMT_principal_respect 		TMT_prncpl_rspct
	rename TMT_principal_trust		TMT_prncpl_trust
	rename TMT_work_decisions		TMT_wk_decisions
	rename TMT_my_ideas			TMT_my_ideas
	rename TEP_absenteeism_teachers		TEP_abs_tch
	rename TES_homework_corrected_port	TES_hw_crtd_port
	rename TES_homework_corrected_math 	TES_hw_crtd_math
	rename HHP_absenteeism_students		HHP_abs_std
	rename HHP_student_bad_behavior		HHP_std_bad_bhv
	rename HHT_def_noparents_support	HHT_def_noparsup
	rename HHT_def_student_loweffort	HHT_def_std_leff
	rename HHT_def_bad_behavior		HHT_def_bad_bhv
	rename HHT_def_absenteeism		HHT_def_abs
	rename HHS_incentive_study		HHS_inc_study
	rename HHS_incentive_homework		HHS_inc_homework
	rename HHS_incentive_read		HHS_inc_read
	rename HHS_incentive_school		HHS_inc_school
	rename HHS_incentive_talk		HHS_inc_talk
	rename HHS_parents_sch_meetings		HHS_par_sch_meet
	rename HHS_do_homework_port		HHS_do_hw_port
	rename HHS_do_homework_math		HHS_do_hw_math	
	
	// standardize the questions
	
	local TS "TSP_lack_tch TSP_lack_ped_stf TSP_tch_turnover TST_def_2muchwrk"
	local TM "TMT_prncpl_mot  TMT_prncpl_rspct TMT_prncpl_trust TMT_wk_decisions TMT_my_ideas"
	local TE "TEP_abs_tch TES_hw_crtd_port TES_hw_crtd_math"
	local HH "HHP_abs_std HHP_std_bad_bhv HHT_def_noparsup HHT_def_std_leff HHT_def_bad_bhv HHT_def_abs  HHS_inc_study HHS_inc_homework HHS_inc_read HHS_inc_school HHS_inc_talk HHS_par_sch_meet HHS_do_hw_port HHS_do_hw_math"
	
	local all `TS' `TM' `TE' `HH'
	levelsof year, local(years)
	
	// Standardize all raw questions -- within year
	foreach var of local all {
	    generate `var'_std = .
	    foreach y of local years {
		generate `var'_`y' = `var' if year == `y'
		egen `var'_`y'_std = std(`var'_`y')
		replace `var'_std = `var'_`y'_std if year == `y'
		drop `var'_`y'
	    }
	}

	// Locals for standardized variables
	local TS_std "TSP_lack_tch_std TSP_lack_ped_stf_std TSP_tch_turnover_std TST_def_2muchwrk_std"
	local TM_std "TMT_prncpl_mot_std  TMT_prncpl_rspct_std TMT_prncpl_trust_std TMT_wk_decisions_std TMT_my_ideas_std"
	local TE_std "TEP_abs_tch_std TES_hw_crtd_port_std TES_hw_crtd_math_std"
	local HH_std "HHP_abs_std_std HHP_std_bad_bhv_std HHT_def_noparsup_std HHT_def_std_leff_std HHT_def_bad_bhv_std HHT_def_abs_std  HHS_inc_study_std HHS_inc_homework_std HHS_inc_read_std HHS_inc_school_std HHS_inc_talk_std HHS_par_sch_meet_std HHS_do_hw_port_std HHS_do_hw_math_std"

	*** Calculating Indices (Teacher Shortage, Teacher Motivation, Teacher Effort, Household Effort)

	// TS Index
	egen TS_wms = rowmean(`TS_std')

	// TM Index
	egen TM_wms = rowmean(`TM_std')

	// TE Index
	egen TE_wms = rowmean(`TE_std')

	// HH Index
	egen HH_wms = rowmean(`HH_std')



	*** Saving
	
	// school-grade-year level data set
	save "cleaning/tempdata/PB_school_level.dta", replace
	
	// temporary file to merge with student-level data set
	keep MM_a_practices MM_wms_practices MM_pca_practices ///
		TS_wms TM_wms TE_wms HH_wms ///
		codschool grade year
	tempfile indices
	save 	`indices'
	
	// Management and Intermediate indices at school-year level
	collapse (mean) MM_a_practices MM_wms_practices MM_pca_practices ///
			TS_wms TM_wms TE_wms HH_wms ///
			, by(codschool year)

	foreach var in MM_a_practices MM_wms_practices MM_pca_practices TS_wms TM_wms TE_wms HH_wms {
		rename `var' `var'_schl
	}
	

	* Standardizing indices at the school level WITHIN the year 

	* Management indices within each year
	bysort year: egen zmgmt = std(MM_wms_practices_schl)
	label var zmgmt "Management Index WMS, school-level, standardized within year"

	bysort year: egen zmgmt_a = std(MM_a_practices_schl)
	label var zmgmt_a "Management Index Anderson (2008), school-level, standardized within year"

	bysort year: egen zmgmt_pca = std(MM_pca_practices_schl)
	label var zmgmt_pca "Management Index PCA, school-level, standardized within year"
	
	* Intermediate index within each year
	foreach var in MM_a_practices MM_pca_practices TM_wms TS_wms TE_wms HH_wms {
		bysort year: egen `var'_std_schl = std(`var'_schl)
	}
		
	tempfile indices_schl
	save 	 `indices_schl'
	
	// Merging with student-level data set
	
	use "cleaning/tempdata/PB_student_level.dta", clear
	
	merge m:1 codschool grade year using `indices'
	drop if _merge == 2
	drop _merge
	
	merge m:1 codschool year using `indices_schl'
	drop if _merge == 2
	drop _merge
	
	save "cleaning/tempdata/PB_student_level2.dta", replace

	
	
		
		
*-----------------------------------------*
* FINAL DATA SETS: STUDENT-YEAR LEVEL
*-----------------------------------------*

***** Dataset to merge: Schools in WMS
use "input/WMS_Prova_Brasil_Schools/school_wms", clear
keep if wms_gmi != .
generate in_wms = 1
save "cleaning/tempdata/schools_wms", replace

***** Dataset to merge: Municipality school spending from Akhtari et al. (2022)
use "input/Akhtari et al. (2022)/s_spending_2009_2015_empenhada.dta", clear
rename COD_MUNICIPIO codmunic
save "cleaning/tempdata/s_spending_2009_2015_empenhada", replace


* Merging to student-level dataset
use "cleaning/tempdata/PB_student_level2", clear
order codschool grade year
sort codschool grade year

* Merging WMS school
merge m:1 codschool using "cleaning/tempdata/schools_wms", keepusing(wms_gmi in_wms) 
drop if _merge == 2
drop _merge



* Merging with municipality spending in education by year dataset
merge m:1 codmunic year using "cleaning/tempdata/s_spending_2009_2015_empenhada.dta", nogen keep(match master) keepusing(spending_educ)

* Log of spending
gen lspendeduc = ln(spending_educ+1)




*** Normalizing scores within grade (using raw SAEB score)

* Average the RAW scores first
gen score_saeb_average = (score_saeb_port + score_saeb_math) / 2

foreach x in port math average {

	gen score_saeb_`x'_5 = .
	replace score_saeb_`x'_5 = score_saeb_`x' if grade == 5
	egen score_saeb_`x'_5_std = std(score_saeb_`x'_5)

	gen score_saeb_`x'_9 = .
	replace score_saeb_`x'_9 = score_saeb_`x' if grade == 9
	egen score_saeb_`x'_9_std = std(score_saeb_`x'_9)

	gen score_saeb_`x'_std = .
	replace score_saeb_`x'_std = score_saeb_`x'_5_std if grade == 5
	replace score_saeb_`x'_std = score_saeb_`x'_9_std if grade == 9
	drop score_saeb_`x'_5_std score_saeb_`x'_9_std
}

	
* Normalizing scores within grade AND YEAR (using raw SAEB score)

foreach x in port math average {

	* Calculating std BY YEAR for the Grade 5
	bysort year: egen score_saeb_`x'_5_std_year = std(score_saeb_`x'_5)

	* Calculating std BY YEAR for the Grade 9
	bysort year: egen score_saeb_`x'_9_std_year = std(score_saeb_`x'_9)

	*  Combining into final variable 
	gen score_saeb_`x'_std_year = .
	replace score_saeb_`x'_std_year = score_saeb_`x'_5_std_year if grade == 5
	replace score_saeb_`x'_std_year = score_saeb_`x'_9_std_year if grade == 9
}



// ORGANIZING

label var id_class 		"Class of the student"
label var ever_dropped	 	"Student already dropped out of school before"
label var ever_repeated 	"Student already repeated a grade"
label var work 			"Student works"
label var like_port		"Student likes portuguese"
label var like_math		"Student likes math"
label var male 			"0. Female 1. Male"
label var white 		"0. Non-white 1. White"
label var socio_eco 		"Students's socioeconomic Index "
label var math_insuf 		"Math level: insufficient"
label var math_basic 		"Math level: basic"
label var math_adequ 		"Math level: adequate"
label var port_insuf 		"Portuguese level: insufficient"
label var port_basic 		"Portuguese level: basic"
label var port_adequ 		"Portuguese level: adequate"
label var performance_insuf 	"Performance: insufficient"
label var performance_basic 	"Performance: basic" 
label var performance_adequ 	"Performance: adequate"
label var like_port 		"Students like portuguese"
label var like_math 		"Students like math"
label var codmunic 		"Municipality ID (7-digit)"
label var codmunic2 		"Municipality ID (6-digit)"
label var teacher_male 		"Share of male teachers"
label var teacher_white 	"Share of white teachers"
label var teacher_college_degree "Share of teachers holding a college degree"
label var teacher_tenure 	"Average teacher tenure"
label var teacher_less_40years 	"Share of teachers aged less than 40"
label var teacher_less3min_wages "Share of teachers earning less than 3 MWs"
label var uf 			"State"
label var operation 		"Operation"
label var ComputerLab 		"School with Computer Lab"
label var ScienceLab 		"School with Science Lab"
label var Library 		"School with Library"
label var InternetAccess 	"School with Internet Access"
label var SportCourt		"School with sport court"
label var OwnBuilding		"School with own building"
label var FilteredWater 	"School with filtered water"
label var WasteCollection	"School with waste collection"
label var MealsForStudents	"School with meals for students"
label var EnergyAccess		"School with energy access"
label var SewerAccess		"School with sewer access"
label var wms_gmi 		"Management Index (WMS)"
label var in_wms 		"School in WMS subsample"
label var infra_index 		"Infrastructure Index"

drop  cfim_letivo cinicio_letivo mes_fim_letivo schoolresources CICLOS dia_fim_letivo 


// Organizing so that some variables are more in line with what we have in PISA

// student characteristics
gen stu_female = (gender == 2)
replace stu_female = . if gender == .
tab skincolor, generate(stu_race_)
tab mother_edu, generate(medu_)

* Renaming to match desired Globals
rename teacher_male tmale_sh
rename teacher_white twhite_sh
rename teacher_college_degree tedu_sh
rename stutch_ratio stratio
rename teacher_tenure ttenure_mean
rename ComputerLab computerlab
rename InternetAccess internetaccess
rename mother_literate mlit
rename father_literate flit

generate lstu = ln(stu)
gen lstu_age = ln(age)
gen stu_white = (stu_race_1 == 1)

*-----------------------------------------------------------------------------
* IMPUTATION OF MISSING
*-----------------------------------------------------------------------------

* List of all variables to impute with 99
local all_vars 	lspendeduc fin_resourses_fed fin_resourses_state fin_resourses_muni ///
				p_male p_age50 p_sen15 p_pededuc p_deg p_wage7plus p_uniquejob ///
				urban stratio lstu computerlab internetaccess infra_index ///
				tmale_sh twhite_sh tedu_sh ttenure_mean ///
				lstu_age stu_female socio_eco stu_white work mlit flit

* Unified Imputation Loop: creating variables "_imp", which contains the original values + 99 for missings
foreach v of local all_vars {
	
	* Creating missing dummy variable 
	gen m_`v' = missing(`v')
	
	* Creating _imp version (copy of original)
	gen `v'_imp = `v'
	
	* Replacing missing values with 99 in the _imp version
	replace `v'_imp = 99 if missing(`v')
}



	
*----------- Creating average of some students and teacher variables at the school-level (for mediator analysis -----------*
	
* Defining variable lists
local stu_class_vars  lstu_age stu_female socio_eco stu_white work mlit flit tmale_sh twhite_sh tedu_sh ttenure_mean

* Generating school averages for student-level and class-level variables
foreach var of local stu_class_vars {
	bysort codschool year: egen `var'_sch_avg = mean(`var')
}


* Handling missing values for all new variables
foreach var of local stu_class_vars {
	* Creating missing indicator
	gen m_`var'_sch_avg = missing(`var'_sch_avg)
	
	* Replacing missing values with 99
	replace `var'_sch_avg = 99 if missing(`var'_sch_avg)
}


* Save 
save "analysis/data/MgmtIndex_ProvaBrasil_StdtYear", replace





*-----------------------------------------*
* BUILD (SCHOOL-GRADE-YEAR LEVEL DATA SET)
*-----------------------------------------*

use "analysis/data/MgmtIndex_ProvaBrasil_StdtYear", clear

keep id_class uf codschool year grade coduf score_saeb_math score_saeb_port ///
	lspendeduc fin_resourses_fed fin_resourses_state fin_resourses_muni  p_male p_age50 ///
	p_sen15 p_pededuc p_deg p_wage7plus p_uniquejob  urban stratio lstu computerlab internetaccess infra_index ///
	tmale_sh twhite_sh tedu_sh ttenure_mean  lstu_age stu_female socio_eco stu_white work mlit flit ///
	MM_a_practices MM_wms_practices MM_pca_practices TS_wms TM_wms TE_wms HH_wms ///
	MM_a_practices_schl MM_wms_practices_schl MM_pca_practices_schl TS_wms_schl TM_wms_schl TE_wms_schl HH_wms_schl ///
	zmgmt zmgmt_a zmgmt_pca TM_wms_std_schl TS_wms_std_schl TE_wms_std_schl HH_wms_std_schl ///
	wms_gmi in_wms
		
		
* ds id_class school muni uf codschool year grade, not // list of variables excluding strings and id variables
ds id_class uf codschool year grade, not // list of variables excluding strings and id variables
collapse (mean)  `r(varlist)', by(codschool grade year)

save "analysis/data/MgmtIndex_ProvaBrasil_SchlGradeYear", replace

*-----------------------------------------*
* ORGANIZING MISSING OBSERVATIONS
*------------------------"----------------*

* List of all variables to impute with 99
local all_vars 	lspendeduc fin_resourses_fed fin_resourses_state fin_resourses_muni ///
				p_male p_age50 p_sen15 p_pededuc p_deg p_wage7plus p_uniquejob infra_index ///
				urban stratio lstu computerlab internetaccess ///
				tmale_sh twhite_sh tedu_sh ttenure_mean ///
				lstu_age stu_female socio_eco stu_white work mlit flit

* Unified Imputation Loop: creating variables "_imp", which contains the original values + 99 for missings
foreach v of local all_vars {
	
	* Creating missing dummy variable 
	gen m_`v' = missing(`v')
	
	* Creating _imp version (copy of original)
	gen `v'_imp = `v'
	
	* Replacing missing values with 99 in the _imp version
	replace `v'_imp = 99 if missing(`v')
}

		
save "analysis/data/MgmtIndex_ProvaBrasil_SchlGradeYear", replace		
		
