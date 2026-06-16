***
* HARMONIZING PROVA BRASIL
***	

	*------------------------------------------------------------------------------------------------------------------------*
		forvalues year = 2007(2)2017 {
			use "$input_pb/Teachers_`year'.dta", clear
			
				if `year' == 2007 {
					gen 	 year = 2007
					drop 	 NO_MUNICIPIO SIGLA_UF  DS_DISCIPLINA
					rename  (PK_COD_ENTIDADE-ID_SERIE) (codschool network location coduf codmunic id_class grade)
					rename (Q1 Q2 Q3 Q4 Q5 Q6 Q8 Q9 Q10 Q16 Q15 Q17 Q18 Q19 Q23 Q20 Q21 Q22 Q47 Q49 Q52 Q53 Q54 Q77 Q78 Q79 Q73 Q76 Q80 Q74 Q82 Q83 Q59 Q60 Q63 Q64 Q66 Q67 Q68 Q69 Q72 Q71 Q65 Q94 Q114 Q115 Q118 Q119 Q120 Q121 Q122 Q123 Q56 Q57 Q58 Q130 Q126 Q127 Q131 Q55 ) ///
					 	   (teacher_gender teacher_age_range teacher_skincolor teacher_edu teacher_years_graduation type_university type_education postgrad area_postgrad teacher_wage teacher_other_job experience_asteacher teacher_exp_school teacher_exp_grade teacher_work_contract teacher_workhours_school nu_schools_work teacher_workhours_total use_news use_literature_books use_copy_machine pedagogic_plan meetings_class_council principal_learning principal_norms principal_maintenance principal_motivation principal_innovation principal_respect principal_trust work_decisions my_ideas def_schoolinfra def_curricula def_cover_curricula def_2muchwork def_teacher_insatisfaction def_student_socioback def_parents_culturalback def_noparents_support def_low_selfesteem def_student_loweffort def_bad_behavior def_absenteeism violence_lifethreat violence_student_threat violence_theft violence_robb violence_students_alcohol violence_students_drugs violence_students_knife violence_students_gun expec_finish_grade9 expec_finish_grade12 expec_get_college received_book students_books books_since_beg_year quality_books share_curricula )
				}
				
				if `year' == 2009 {
					drop 	 no_municipio sigla_uf
					gen 	 year = 2009
					rename  (pk_cod_entidade-id_serie)(codschool network location coduf codmunic id_class grade)
					rename  (Q1 Q2 Q3 Q4 Q5 Q6 Q8 Q9 Q10 Q16 Q15 Q17 Q18 Q19 Q23 Q20 Q21 Q22 Q47 Q50 Q54 Q55 Q56 Q81 Q82 Q83 Q77 Q80 Q84 Q78 Q86 Q87 Q63 Q66 Q67 Q68 Q69 Q70 Q71 Q72 Q74 Q75 Q76 Q98 Q118 Q119 Q122 Q123 Q124 Q125 Q126 Q127 Q60 Q61 Q62 Q134 Q130 Q131 Q135 Q59 ) ///
							(teacher_gender teacher_age_range teacher_skincolor teacher_edu teacher_years_graduation type_university type_education postgrad area_postgrad teacher_wage teacher_other_job experience_asteacher teacher_exp_school teacher_exp_grade teacher_work_contract teacher_workhours_school nu_schools_work teacher_workhours_total use_news use_literature_books use_copy_machine pedagogic_plan meetings_class_council principal_learning principal_norms principal_maintenance principal_motivation principal_innovation principal_respect principal_trust work_decisions my_ideas def_schoolinfra def_curricula def_cover_curricula def_2muchwork def_teacher_insatisfaction def_student_socioback def_parents_culturalback def_noparents_support def_low_selfesteem def_student_loweffort def_bad_behavior def_absenteeism violence_lifethreat violence_student_threat violence_theft violence_robb violence_students_alcohol violence_students_drugs violence_students_knife violence_students_gun expec_finish_grade9 expec_finish_grade12 expec_get_college received_book students_books books_since_beg_year quality_books share_curricula )
					}
				
				if `year' == 2011 					rename (id_prova_brasil-in_preenchimento) 			   (year coduf codmunic codschool network location id_class			  grade valid_questionnaire)
				
				if `year' == 2013 | `year' == 2015  rename (id_prova_brasil-in_preenchimento_questionario) (year coduf codmunic codschool network location id_class			  grade valid_questionnaire)
				
				if `year' == 2017					rename (id_prova_brasil-in_preenchimento_questionario) (year coduf codmunic codschool network location id_class id_teacher grade valid_questionnaire)

				if `year' == 2011 {
					rename  (Q1 Q2 Q3 Q4 Q5 Q6 Q8 Q9 Q10 Q16 Q15 Q17 Q18 Q19 Q23 Q20 Q21 Q22 Q37 Q38 Q41 Q42 Q43 Q64 Q65 Q66 Q60 Q63 Q67 Q61 Q69 Q70 Q46 Q49 Q50 Q51 Q52 Q53 Q54 Q55 Q57 Q58 Q59 Q81 Q101 Q102 Q105 Q106 Q107 Q108 Q109 Q110 Q123 Q124 Q125 Q128 Q126 Q127 Q129 Q121 ) ///
					(teacher_gender teacher_age_range teacher_skincolor teacher_edu teacher_years_graduation type_university type_education postgrad area_postgrad teacher_wage teacher_other_job experience_asteacher teacher_exp_school teacher_exp_grade teacher_work_contract teacher_workhours_school nu_schools_work teacher_workhours_total use_news use_literature_books use_copy_machine pedagogic_plan meetings_class_council principal_learning principal_norms principal_maintenance principal_motivation principal_innovation principal_respect principal_trust work_decisions my_ideas def_schoolinfra def_curricula def_cover_curricula def_2muchwork def_teacher_insatisfaction def_student_socioback def_parents_culturalback def_noparents_support def_low_selfesteem def_student_loweffort def_bad_behavior def_absenteeism violence_lifethreat violence_student_threat violence_theft violence_robb violence_students_alcohol violence_students_drugs violence_students_knife violence_students_gun expec_finish_grade9 expec_finish_grade12 expec_get_college received_book students_books books_since_beg_year quality_books share_curricula )				
				}

				if `year' >  2011 {
					rename (Q1 Q2 Q3 Q4 Q5 Q6 Q7 Q8 Q9 Q10 Q11 Q13 Q14 Q15 Q16 Q17 Q18 Q19 Q44 Q45 Q48 Q51 Q52 Q61 Q62 Q63 Q64 Q65 Q66 Q67 Q68 Q69 Q70 Q72 Q73 Q74 Q75 Q76 Q77 Q78 Q79 Q80 Q81 Q82 Q85 Q86 Q87 Q88 Q89 Q90 Q91 Q92 Q94 Q95 Q96 Q98 Q99 Q100 Q101 Q106 ) ///
						   (teacher_gender teacher_age_range teacher_skincolor teacher_edu teacher_years_graduation type_university type_education postgrad area_postgrad teacher_wage teacher_other_job experience_asteacher teacher_exp_school teacher_exp_grade teacher_work_contract teacher_workhours_school nu_schools_work teacher_workhours_total use_news use_literature_books use_copy_machine pedagogic_plan meetings_class_council principal_learning principal_norms principal_maintenance principal_motivation principal_innovation principal_respect principal_trust work_decisions my_ideas def_schoolinfra def_curricula def_cover_curricula def_2muchwork def_teacher_insatisfaction def_student_socioback def_parents_culturalback def_noparents_support def_low_selfesteem def_student_loweffort def_bad_behavior def_absenteeism violence_lifethreat violence_student_threat violence_theft violence_robb violence_students_alcohol violence_students_drugs violence_students_knife violence_students_gun expec_finish_grade9 expec_finish_grade12 expec_get_college received_book students_books books_since_beg_year quality_books share_curricula )
				}
				if `year' > 2007 tostring id_class, replace
				drop Q*
				destring codschool network location coduf codmunic grade, replace
				tempfile `year'
				save 	``year''
				compress
				*erase "$output_pb/Teachers_`year'.dta"
		}
		clear 		
		forvalues year = 2007(2)2017 {
			append using ``year''
		}
		order year coduf codmunic codschool  network location valid* id_teacher id_class grade
		

		*Network
		*--------------------------------------------------------------------------------------------------------------------*
		label define network 1 "Federal" 2 "State" 3 "Municipal" 4 "Private"
		label val 	 network network
		
		
		*Urban/rural
		*--------------------------------------------------------------------------------------------------------------------*
		recode location (2 = 0)
		rename location urban
		label  define   urban 1 "Urban" 0 "Rural"
		label  val 	    urban urban
		
		
		*State
		*--------------------------------------------------------------------------------------------------------------------*
		label define state 11 "RO" 12 "AC" 13 "AM" 14 "RR" 15 "PA" 16 "AP" 17 "TO"  					///
						   21 "MA" 22 "PI" 23 "CE" 24 "RN" 25 "PB" 26 "PE" 27 "AL" 28 "SE" 29 "BA" 		///
						   31 "MG" 32 "ES" 33 "RJ" 35 "SP" 												///
						   41 "PR" 42 "SC" 43 "RS" 														///
						   50 "MS" 51 "MT" 52 "GO" 53 "DF"
		label val coduf state

		
		*Grade
		*--------------------------------------------------------------------------------------------------------------------*
		recode 		 grade (4 = 5) (8 = 9) (13 =12)
		label define grade 5 "5{sub:th} grade" 9 "9{sub:th} grade" 12 "Last year of high school"
		label val 	 grade grade
		
		
		*Enconding
		*--------------------------------------------------------------------------------------------------------------------*
		foreach var of varlist  teacher_gender-quality_books {
			replace `var' = "" if `var' == "*" | `var' == "."
			encode  `var', gen (`var'2)
			drop 	`var' 
			rename  `var'2 `var'
		}
		
		*teacher_gender
		*--------------------------------------------------------------------------------------------------------------------*
		label   define teacher_gender    2 "Feteacher_male" 1 "teacher_male"
		label   val    teacher_gender teacher_gender
		
		
		*Age
		*--------------------------------------------------------------------------------------------------------------------*
		label 	define teacher_age_range 1 "Up to 24 years old" 2 "Between 25-29 years old" 3 "Between 30 and 39 years old" 4 "Between 40 and 49 years old"  5 "Between 50 and 54 years old"  6 "More than 55 years old"
		label 	val    teacher_age_range teacher_age_range
		
		
		*Skin color
		*--------------------------------------------------------------------------------------------------------------------*
		recode 		   teacher_skincolor (6 7 = .)		//6 = "dont know my color"
		label 	define teacher_skincolor 1 "teacher_white" 2 "Brown" 3 "Black" 4 "Yellow" 5 "Indigenous"
		label 	val	   teacher_skincolor teacher_skincolor
		
		
		*Teacher Education
		*--------------------------------------------------------------------------------------------------------------------*
		label  	define teacher_edu  				1 "Less than high school"   2 "High school"  		3 "Undergraduate/Pedagogy"  4 "Undergraduate/Math"   5 "Undergraduate/Portuguese" 6 "Undergraude/others"
		label  	define teacher_years_graduation  	1 "Less than 2 years" 		2 "Between 3-7 years" 	3 "Between 8-14 yars" 		4 "Betweeen 15-20 years" 5 "More than 20 years" 
		label  	define postgrad   				1 "No grad. certificate"    2 "Short Course" 		3 "Specialization" 			4 "Masters" 			 5 "Phd"
		label 	define type_university 			1 "Federal"				    2 "State" 				3 "Municipal" 				4 "Private" 
		label 	define type_education 			1 "Face to Face"  		    2 "Face/Distance" 		3 "Distance Learning"  
		label 	define area_postgrad 			1 "Education" 			    0 "Other field" 
		recode 	teacher_edu 			(1 = 1) (2 3 = 2) (4 = 3) (5 = 4) (6 = 5) (7 8 = 6)   	if year <  2013
		recode 	teacher_edu 			(1 = 1) (2 3 = 2) (4 = 3) (6 = 4) (7 = 5) (5 8 9 = 6) 	if year >= 2013
		recode 	postgrad 			(5 = 1) (1   = 2) (2 = 3) (3 = 4) (4 = 5)   		  	if year <  2013
		recode  type_university 	(5 = .) 								  		 		if year <  2013
		recode 	type_university 	(1 = .) (2   = 4) (3 = 1) (4 = 2) (5 = 3) 				if year >= 2013
		recode 	type_education	 	(4 = .) 												if year <  2013
		recode 	type_education 		(1 = .) (2   = 1) (3 = 2) (4 = 3) 						if year >= 2013
		recode 	area_postgrad 		(1 2 3   = 1) (4 = 0) (5 = .) 							if year <  2011
		recode 	area_postgrad 		(1 2 3 4 = 1) (5 = 0) 		   							if year == 2011
		recode 	area_postgrad 		(2 3 4 5 = 1) (6 = 0) (1 = .) 							if year >  2011
		label  	val teacher_years_graduation teacher_years_graduation
		label  	val teacher_edu teacher_edu
		label  	val postgrad postgrad
		label 	val type_university type_university
		label   val type_education type_education
		label   val area_postgrad area_postgrad

				
		*Teacher Experience
		*--------------------------------------------------------------------------------------------------------------------*
		label  	define experience 		  1 "First year"    2 "1-2 years"     3 "3-5 years"         4 "6-10 years" 5 "11-15 years" 6 "16-20 years" 7 "More than 20 years"
		label  	define teacher_exp_grade   1 "Up to 2 years" 2 "Between 3-6 years" 3 "More than 6 years" 
		recode 	experience_asteacher 	(4 5 = 4) (6   = 5) (7 = 6) (8 = 7) if year == 2011
		recode 	teacher_exp_school    	(4 5 = 4) (6   = 5) (7 = 6) (8 = 7) if year == 2011
		recode 	teacher_exp_grade 		(1   = 1) (2 3 = 2) (4 5     = 3) 	if year <  2013
		recode 	teacher_exp_grade 		(1 2 = 1) (3   = 2) (4 5 6 7 = 3)   if year >= 2013
		label   val teacher_exp_grade teacher_exp_grade
		label   val experience_asteacher experience  
		label   val teacher_exp_school    experience 

		
		*Type of contract/teacher_wage
		*--------------------------------------------------------------------------------------------------------------------*
		label 	define teacher_work_contract 	4 "No contract"				 	5 "Other" 						3  "Temporary contract" 		 2 "CLT" 				1 "Tenure (estatutário)" 
		label 	define hours_worked 			1 "More than 40 hours" 			2 "40 hours" 					3  "Between 20-39 hours" 		 4 "Less than 20 hours" 
		
		label 	define teacher_wage 			1 "Up to one minimum teacher_wage" 	  	2 "Between 1-1.5 minimum teacher_wage"  3  "Between 1.5-2 minimum teacher_wages" 4 "Between 2-2.5 minimum teacher_wages" ///
												5 "Between 2.5-3 minimum teacher_wages" 6 "Between 3-3.5 minimum teacher_wages" 7  "Between 3.5-4 minimum teacher_wages" 8 "Between 4-5 minimum teacher_wages"   ///
												9 "Between 5-7 minimum teacher_wages"   10 "Between 7-10 minimum teacher_wages" 11 "More than 10 minimum ages"
		label   define nu_schools_work  		1 "One school" 					2 "Two schools" 				3  "Three schools"				 4 "Four schools or more" 
		label   define teacher_other_job		1 "Yes, in education area"		2 "Yes, in other field"			3  "Don't have another job"
		
		
		replace teacher_wage = . if year == 2007
		recode  teacher_workhours_school (1 2 = 4) (3 4 5 6 7 8 9 = 3) (10 = 2) (11    = 1)  if year == 2007  
		recode  teacher_workhours_school (1   = 4) (2 3 4 5 6 7   = 3) (8  = 2) (9     = 1)  if year == 2009 | year == 2011  
		recode  teacher_workhours_total  (1 2 = 4) (3 4 5 6 7 8 9 = 3) (10 = 2) (11 12 = 1)  if year == 2007  
		recode  teacher_workhours_total  (1   = 4) (2 3 4 5 6 7   = 3) (8  = 2) (9  	  = 1)  if year == 2009 | year == 2011  
		label   val teacher_workhours_school hours_worked
		label   val teacher_workhours_total  hours_worked
		label   val teacher_work_contract teacher_work_contract
		label   val teacher_wage teacher_wage
		label   val nu_schools_work nu_schools_work
		label   val teacher_other_job teacher_other_job
		
		
		*Teacher uses in the class
		*--------------------------------------------------------------------------------------------------------------------*
		label   define use 0 "No/Never" 1 "Yes" 2 "School does not have"
		recode  use_news 			 (2 = 0) (3 = 2) 			 if year <   2013
		recode  use_literature_books (2 = 0) (3 = 2) 			 if year <   2013
		recode  use_copy_machine	 (2 = 0) (3 = 2) 			 if year <   2013
		recode  use_news 			 (1 = 2) (2 = 0) (3 4 = 1)   if year >=  2013
		recode  use_literature_books (1 = 2) (2 = 0) (3 4 = 1)   if year >=  2013
		recode  use_copy_machine	 (1 = 2) (2 = 0) (3 4 = 1)   if year >=  2013
		label   val use_news 			 use
		label   val use_literature_books use
		label   val use_copy_machine 	 use		
		label 	define  share_curricula 1 "Less than 40%" 2 "Between 40-60%" 3 "Between 60-80%" 4 "More than 80%"
		recode  		share_curricula (1 2 = 1) (3 = 2) (4 = 3) (5 = 4) if year >= 2013
		label 	val  	share_curricula share_curricula


		*Other
		*--------------------------------------------------------------------------------------------------------------------*
		label  define  yesno 							1 "Yes" 						0 "No"
		label  define  meetings_class_council  			1 "Once" 						2 "Twice"   								3 "Three times or more"  				  4 "None"  				5 "No school council"
		
		label  define  pedagogic_plan  					1 "No pedag. project" 				2 "Modelo pronto, sem discussão da equipe"			///
		3  "Modelo pronto com algumas modificações/modelo próprio mas sem teacher's active involvement" 4 "With active teacher's involvement"

		
		label  define  frequency				 		1 "Never" 						2 "Sometimes" 								3 "Often" 								  4 "Always"
		label  define  expectations 					1 "Few students" 				2 "Little less than half of the students" 	3 "Little more than half of the students" 4 "Almost all students"
		label  define  students_books				 	1 "No textbooks" 				2 "Less than half" 							3 "Half" 								  4 "Most of them" 			5 "All"
		label  define  quality_books 					1 "Bad" 						2 "Ok"						 				3 "Good" 								  4 "Great" 
		recode meetings_class_council 		(3     = 1) (4 = 2) 		(5 = 3) (2 = 4) (1 = 5)  		if year >= 2013
		recode pedagogic_plan 				(8 = 1) (1 = 2 ) (2   = 3) (3 4 5 = 4) (6 7 = .)			if year <  2013
		recode pedagogic_plan 				(2 = 1) (3 = 2 ) (5 7 = 3) (4 6 8 = 4) (1   = .) 			if year >= 2013
		
		recode students_books 				(5 = 1) 	(4 = 2) 		(3 = 3) (2 = 4) (1 = 5) 		if year <  2013
		recode quality_books 				(5 = .) 	(4 = 1) 		(3 = 2) (2 = 3) (1 = 4) 		if year <  2013
		recode quality_books 				(1 = .) 	(2 = 1) 		(3 = 2) (4 = 3) (5 = 4) 		if year >= 2013


		foreach var of varlist principal_* work_decisions my_ideas* {
			recode 		`var' (4 5 = 1) (3 = 2) (2 = 3) (1 = 4) 		if year < 2013
			label val 	`var' frequency
		}
		
		foreach var of varlist expec_* {
			recode 		`var' (4 = 1) (3 = 2) (2 = 3) (1 = 4) (5 = .) 	if year < 2013
			label  val 	`var' expectations
		}

		foreach var of varlist valid_questionnaire  {
			label  val `var' yesno
		}
		
		foreach var of varlist def_schoolinfra def_schoolinfra-def_low_selfesteem violence* received_book books_since_beg_year    {
			recode 	  `var' (1 = 1) (2 = 0) (3 = .)
			label val `var' yesno 
		}
		
		label   define  problem   0 "Not an issue" 					1 "Small" 											2 "A moderate/big issue"
		recode	def_absenteeism (1 = 0) (2   = 1) (3 4 = 2) if year >= 2013
		recode 	def_absenteeism (1 = 0) (2   = 1) (3   = 2) if year <  2013
		label 	val def_absenteeism  problem
		
		
		
		label val students_books students_books
		label val pedagogic_plan pedagogic_plan
		label val meetings_class_council meetings_class_council
		label val quality_books quality_books
		
		*Defining new variables
		*--------------------------------------------------------------------------------------------------------------------*	
		**
		*teacher_males, teacher_whites and college degree
		**
		recode teacher_gender     	  (1 = 1) (2 = 0)					, gen (teacher_male)
		recode teacher_skincolor  	  (1 = 1) (2 3 4 5 = 0)				, gen (teacher_white)
		recode teacher_edu 			  (3 4 5 6 = 1) (2 1 = 0)			, gen (teacher_college_degree)
		recode teacher_work_contract  (1 = 1) (2 3 4 5 = 0)				, gen (teacher_tenure) 
		recode teacher_age_range	  (1 2 3 = 1) (4 5 6 = 0)			, gen (teacher_less_40years)
		recode teacher_wage			  (1/5 = 1) (6/11 = 0)				, gen (teacher_less3min_wages)
		recode experience_asteacher   (1/4 = 0) (5/7  = 1)				, gen (teacher_more10yearsexp)
		
		label  val teacher_male   				  yesno
		label  val teacher_white  				  yesno
		label  val teacher_tenure 				  yesno
		label  val teacher_less_40years   yesno
		label  val teacher_college_degree yesno
		

		**
		*Principal effort according to teacher's perspective
		**
		egen temp1 = rowmiss(principal_motivation-my_ideas)
		foreach var of varlist principal_motivation-my_ideas{
			recode `var' (1=0) (2=0.33) (3=0.66) (4=1), gen(II_`var')
		}
		egen principal_effort_teacher   = rowmean(II_*) if temp1 < 4
		drop II_* temp1
		
						
		*
		*Parent's effort
		**
		recode def_noparents_support (1 = 0) (0 = 1), gen(parents_effort_index)  

		**
		*Students' effort
		**
		egen 	temp1 = 			    rowmiss(def_student_loweffort def_absenteeism def_bad_behavior)
		foreach var of varlist 					def_student_loweffort 				  def_bad_behavior {
			recode `var'				 (0 = 1) (1 = 0), gen (I_`var')
		}
			recode def_absenteeism		 (0 = 1) (1 = 0.5) (2 = 0), gen (I_def_absenteeism)
			
		egen 	student_effort_teacher  = rowmean(I_def_student_loweffort I_def_absenteeism I_def_bad_behavior)
		replace student_effort_teacher = . if temp1 > 1
		drop I_* temp1
		

		**
		*Teacher's effort ???????????????????????????? -> Segui o Do file do Thomaz
		**
		gen teacher_effort_index      = use_literature_books + use_news/2  if !missing(use_literature_books) & !missing(use_literature_books)
		
		
		**
		*Violence in the school
		**
		egen 	temp1 = 		 	    rowmiss(violence_lifethreat-violence_students_gun)
		egen 	violence_index 		  = rowmean(violence_lifethreat-violence_students_gun)
		replace violence_index 		  = . if temp1 > 3
		drop 	temp1
	
		
		**
		*Teacher's expectations with their students
		**
		recode expec_finish_grade9  (1 2 3 = 0) (4 = 1), gen (almost_all_finish_grade9)
		recode expec_finish_grade12 (1 2 3 = 0) (4 = 1), gen (almost_all_finish_highschool)
		recode expec_get_college    (1 2 3 = 0) (4 = 1), gen (almost_all_get_college)
		label  val almost_all_finish_grade9 	    yesno
		label  val almost_all_finish_highschool 	yesno
		label  val almost_all_get_college	   		yesno
		
		format *index* %4.2fc
		
		**
		*Other variables
		**
		tab share_curricula, gen(covered_curricula) 
		tab	work_decisions , gen(participation_decisions)
		tab students_books , gen(share_students_books)
		tab quality_books  , gen(quality_books)
		
		*Labels
		*--------------------------------------------------------------------------------------------------------------------*
		label variable principal_effort_teacher		"Principal's effort from teacher's perspective"
		label variable teacher_effort_index 		"Teacher's effort based on the use of news and literature books" 	
		label variable parents_effort_index 		"1 if parents support children (from teacher's perspective) and 0, otherwise"
		label variable student_effort_teacher		"Student's effort from teacher's perspective"
		label variable violence_index			"Index for the violence the teacher faces in the school"
		label variable almost_all_finish_grade9		"1:teacher expects that almost all students will finish 9th grade and 0, otherwise"
		label variable almost_all_finish_highschool	"1:teacher expects that almost all students will finish high school and 0, otherwise"
		label variable almost_all_get_college 		"1:teacher expects that almost all students will get to college and 0, otherwise"
		label variable teacher_college_degree		"1 if teacher finished the undergraduate and 0, otherwise"
		label variable teacher_male			"1 for teacher_males and 0, otherwise"
		label variable teacher_white			"1 if teacher is teacher_white and 0, otherwise" 
		label variable teacher_age_range		"Teacher's age range"
		label variable teacher_years_graduation		"Years since graduation"
		label variable type_university			"1: Federal. 2: State. 3: Municipal. 4: Private"
		label variable type_education			"1: Face to face. 2: Face to face/distance. 3: Distance learning"
		label variable def_schoolinfra			"Deficit in student learning is due to: poor school infra/pedagogic"
		label variable def_curricula			"Deficit in student learning is due to: no adequate curricula"
		label variable def_cover_curricula		"Deficit in student learning is due to: not covering the curricula"
		label variable def_2muchwork			"Deficit in student learning is due to: teachers don't have time to plan"
		label variable def_teacher_insatisfaction	"Deficit in student learning is due to: teachers insatisfaction with teacher_wages"
		label variable def_student_socioback		"Deficit in student learning is due to: socioeconomic background"
		label variable def_parents_culturalback		"Deficit in student learning is due to: cultural background of the parents"
		label variable def_noparents_support		"Deficit in student learning is due to: no parents support"
		label variable def_low_selfesteem		"Deficit in student learning is due to: student's low self esteem"
		label variable def_student_loweffort		"Deficit in student learning is due to:	student's low effort"
		label variable def_bad_behavior			"Deficit in student learning is due to: student's bad behavior"
		label variable def_absenteeism			"Deficit in student learning is due to: student missing the classes"
		label variable violence_lifethreat  		"1 if you have ever had your life threatened in this school and 0, otherwise"
		label variable violence_student_threat  	"1 if you already had a student threatening your life in school and 0, otherwise" 
		label variable violence_theft  			"1 if you were already victim of theft in school? (no violence) and 0, otherwise"
		label variable violence_robb  			"1 if you were already victim of theft in school? (with iolence) and 0, otherwise"
		label variable violence_students_alcohol  	"1 if you already had a student in class under infl. alcohol and 0, othewise"
		label variable violence_students_drugs  	"1 if you already had a student in class under infl. drugs and 0, othewise"
		label variable violence_students_knife  	"1 if you already had a student in class with a knife and 0, othewise"
		label variable violence_students_gun 		"1 if you already had a student in class with a gun and 0, othewise"
		label variable expec_finish_grade9  		"How many students do you think will finish the 9th grade?"
		label variable expec_finish_grade12 		"How many students do you think will finish the high school?"
		label variable expec_get_college 		"How many students do you think will get to college?"
		label variable teacher_edu 			"Teacher's education"
		label variable postgrad  			"Teacher's graduate certificate"
		label variable experience_asteacher 		"Teacher's experience (overall)"
		label variable teacher_exp_school		"Teacher's experience (in school)"
		label variable teacher_exp_grade 		"Teacher's experience (in the grade he/she is currently teaching)"
		label variable teacher_work_contract 		"Teacher's contract type"
		label variable use_news 			"Teacher uses news/magazines as pedag. material"
		label variable use_copy_machine 		"Teacher uses copy machines as pedag. material"
		label variable use_literature_books 		"Teacher uses literature books as pedag. material"
		label variable meetings_class_council  		"Number of class council meetings"
		label variable pedagogic_plan 			"Development of the pedagogical plan"
		label variable coduf 				"State ID"
		label variable codmunic 			"Municipality ID"
		label variable codschool 			"School ID"
		label variable network 				"School administrative network"
		label variable grade 				"Grade teacher is in charge of"
		label variable year 				"Year"
		label variable urban				"1: Urban area. 0: Rural area"
		label variable valid_questionnaire		"1 for valid questionnaire and 0, otherwise"
		label variable id_teacher 			"Teacher ID"
		label variable id_class				"Code of the class teacher is in charge of"
		label variable teacher_gender			"Teacher's gender"
		label variable teacher_skincolor   		"Teacher's skin color"
		label variable principal_learning 		"Frequency that the principal: pays attention to students' learning"
		label variable principal_norms 			"Frequency that the principal: pays attention to administrative norms"
		label variable principal_maintenance 		"Frequency that the principal: pays attention to school maintenance"
		label variable principal_motivation 		"Frequency that the principal: motivates me"
		label variable principal_innovation 		"Frequency that the principal: encourages innovative activities"
		label variable principal_respect 		"Frequency that the principal: makes me feel respected"
		label variable principal_trust 			"Frequency that: I trust the principal as a professional"
		label variable work_decisions 			"Frequency that I participate in decisions related with my work"
		label variable my_ideas 			"Frequency that the teacher team takes my ideas into consideration"
		label variable area_postgrad 			"Area of Graduate School"
		label variable teacher_other_job 		"Do you have another job?"
		label variable teacher_wage 			"Gross teacher_wage as teacher (in all schools that teacher works)"
		label variable teacher_workhours_school 	"Weekly hours of work in this school"
		label variable nu_schools_work 			"Number of school the teacher works"
		label variable teacher_workhours_total 		"Weekly hours of work as teacher in all schools"
		label variable share_curricula 			"Amount of the school curricula teacher was able to cover"	
		label variable students_books 			"Students with textbooks" 
		label variable books_since_beg_year		"Did the students receive the book in the beggining of the school year?"
		label variable received_book 			"Did the school receive the textbooks?"
		label variable quality_books			"What is the quality of the book received"
		compress
		save "$output_pb/Teachers.dta", replace
		
		**Variables for Renata
		foreach var of varlist use_news	use_literature_books	use_copy_machine	pedagogic_plan	meetings_class_council	principal_learning	principal_norms	principal_motivation	principal_innovation	principal_respect	principal_trust	work_decisions	my_ideas	def_curricula	def_cover_curricula	def_2muchwork	def_teacher_insatisfaction	def_noparents_support	def_student_loweffort	def_bad_behavior	def_absenteeism	students_books	share_curricula { 
			tab year `var' , mis
		}


		
		
