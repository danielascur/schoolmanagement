
***
* HARMONIZING PROVA BRASIL
***		

*Harmonization of identification variables
*------------------------------------------------------------------------------------------------------------------------*
forvalues year = 2007(2)2017 {
	use "$input_pb/Prova Brasil Questionnaire_`year'.dta", clear
	
	if `year' == 2007 {
		drop 	ST_LINGUA_PORTUGUESA ST_MATEMATICA SIGLA_UF NO_MUNICIPIO NU_QTD_ALUNO
		gen 	year = 2007
		rename (ID_ALUNO-COD_MUNICIPIO ID_TURMA-NU_THETA_M) 		 (id_student grade network location coduf codmunic id_class start_class end_class codschool 			  score_port sd_port score_saeb_port sd_saeb_port sd_math score_saeb_math sd_saeb_math score_math)
	}
	
	if `year' == 2009 {
		drop 	st_lingua_portuguesa st_matematica sigla_uf no_municipio
		gen 	year = 2009
		rename (id_aluno id_turma-nu_sethetat_m) 		    		 (id_student id_class class_time grade codschool network location  coduf codmunic  		   			 	  score_port sd_port score_saeb_port sd_saeb_port score_math sd_math score_saeb_math sd_saeb_math)
		tostring id_class, replace
	}
		
	if `year' == 2011 {
		drop 	in_*
		rename (id_prova_brasil-id_aluno peso-desvio_padrao_mt_saeb) (year coduf codmunic codschool network location id_class class_time grade id_student weight 			  score_port sd_port score_saeb_port sd_saeb_port score_math sd_math score_saeb_math sd_saeb_math)
		tostring id_class, replace
	}
	
	if `year' ==  2013 | `year' == 2015 {
		drop 	in_* tx_* id_bloco* id_caderno* id_regiao id_area estrato_aneb
		rename (id_prova_brasil-desvio_padrao_mt_saeb) 				 (year coduf codmunic codschool network location id_class class_time grade id_student weight_lp weight_mt  score_port sd_port score_saeb_port sd_saeb_port score_math sd_math score_saeb_math sd_saeb_math)
		tostring id_class, replace
	}
	
	if `year' ==  2017 {
		drop 	in_* tx_* id_bloco* id_caderno* id_regiao id_area estrato_aneb
		rename (id_prova_brasil-erro_padrao_mt_saeb) 				 (year coduf codmunic codschool network location id_class class_time grade id_student weight_lp weight_mt  score_port sd_port score_saeb_port sd_saeb_port score_math sd_math score_saeb_math sd_saeb_math)
		tostring id_class, replace
	}
	
	save  "$output_pb/Prova Brasil Questionnaire_`year'.dta", replace
}


*Harmonization of the socioeconomic questionnaire 
*------------------------------------------------------------------------------------------------------------------------*

*5th graders
*--------------------------------------------------------------------------------------------------------------------*
forvalues year = 2007(2)2017 {
	use  "$output_pb/Prova Brasil Questionnaire_`year'.dta" if grade == 4 | grade == 5, clear
	
	if `year' == 2007 {
		rename (Q1 Q2 Q3 Q4 Q5 Q6 Q7 Q8 Q9 Q10 Q12 Q13 Q14 Q16 Q17 Q15 Q18 Q19 Q20 Q21 Q22 Q23 Q24 Q25 Q26 Q27 Q28 Q29 Q30 Q31 Q33 Q34 Q35 Q36 Q37 Q38 Q39 Q40 Q41 Q42 Q43 ) ///
			   (gender skincolor month_birth age number_tv number_radio dvd number_fridge freezer wash_mash number_car computer_internet number_bath number_room n_family_members maid live_mother mother_edu mother_literate mother_reads live_father father_edu father_literate father_reads parents_sch_meetings incentive_study incentive_homework incentive_read incentive_school incentive_talk time_tv_games time_clean_house work enter_school type_school number_repetitions number_dropouts do_homework_port homework_corrected_port do_homework_math homework_corrected_math )
	}
	
	if `year' == 2009 {
		rename (Q1 Q2 Q3 Q4 Q5 Q6 Q7 Q8 Q10 Q11 Q12 Q13 Q14 Q16 Q17 Q15 Q18 Q19 Q20 Q21 Q22 Q23 Q24 Q25 Q26 Q27 Q28 Q29 Q30 Q31 Q33 Q34 Q35 Q36 Q37 Q38 Q39 Q40 Q41 Q42 Q43 ) ///
			   (gender skincolor month_birth age number_tv number_radio dvd number_fridge freezer wash_mash number_car computer_internet number_bath number_room n_family_members maid live_mother mother_edu mother_literate mother_reads live_father father_edu father_literate father_reads parents_sch_meetings incentive_study incentive_homework incentive_read incentive_school incentive_talk time_tv_games time_clean_house work enter_school type_school number_repetitions number_dropouts do_homework_port homework_corrected_port do_homework_math homework_corrected_math )			
	}
	
	if `year' == 2011 {
		rename (Q1 Q2 Q3 Q4 Q5 Q6 Q7 Q8 Q10 Q11 Q12 Q13 Q14 Q16 Q17 Q15 Q18 Q19 Q20 Q21 Q22 Q23 Q24 Q25 Q26 Q27 Q28 Q29 Q30 Q31 Q32 Q33 Q35 Q36 Q37 Q38 Q39 Q43 Q44 Q45 Q46 Q47 Q48 Q49 Q50 Q51 Q52 Q53 Q54 ) ///					
			   (gender skincolor month_birth age number_tv number_radio dvd number_fridge freezer wash_mash number_car computer_internet number_bath number_room n_family_members maid live_mother mother_edu mother_literate mother_reads live_father father_edu father_literate father_reads parents_sch_meetings incentive_study incentive_homework incentive_read incentive_school incentive_talk read_news read_books read_magazines read_cartoons read_internetnews go_library go_movies time_tv_games time_clean_house work enter_school type_school number_repetitions number_dropouts do_homework_port homework_corrected_port do_homework_math homework_corrected_math go_school_library )			
	
	}
	
	if `year' > 2011 {
		rename (Q1 Q2 Q3 Q4 Q5 Q6 Q7 Q8 Q10 Q11 Q12 Q13 Q14 Q15 Q16 Q17 Q18 Q19 Q20 Q21 Q22 Q23 Q24 Q25 Q26 Q27 Q28 Q29 Q30 Q31 Q32 Q33 Q34 Q35 Q36 Q37 Q38 Q39 Q40 Q41 Q42 Q43 Q44 Q45 Q46 Q47 Q48 Q49 Q50 Q51 ) ///
			   (gender skincolor month_birth age number_tv number_radio dvd number_fridge freezer wash_mash number_car computer_internet number_bath number_room n_family_members maid live_mother mother_edu mother_literate mother_reads live_father father_edu father_literate father_reads parents_sch_meetings incentive_study incentive_homework incentive_read incentive_school incentive_talk read_news read_books read_magazines read_cartoons read_internetnews go_library go_movies go_cultural_act time_tv_games time_clean_house work enter_school type_school number_repetitions number_dropouts do_homework_port homework_corrected_port do_homework_math homework_corrected_math go_school_library )			
	
	}	
	drop Q*
	tempfile  5grade_`year'
	save 	 `5grade_`year''
}

*9th graders
*--------------------------------------------------------------------------------------------------------------------*
forvalues year = 2007(2)2017 {
	use  "$output_pb/Prova Brasil Questionnaire_`year'.dta" if grade == 8 | grade == 9, clear
	
	if `year' == 2007 {
		rename (Q1 Q2 Q3 Q4 Q5 Q6 Q7 Q8 Q9 Q10 Q12 Q13 Q14 Q16 Q17 Q15 Q18 Q19 Q20 Q21 Q22 Q23 Q24 Q25 Q26 Q27 Q28 Q29 Q30 Q31 Q33 Q34 Q35 Q36 Q37 Q38 Q39 Q40 Q41 Q42 Q43 Q44 Q45 Q47 ) ///			
			   (gender skincolor month_birth year_birth number_tv number_radio dvd number_fridge freezer wash_mash number_car computer_internet number_bath number_room n_family_members maid live_mother mother_edu mother_literate mother_reads live_father father_edu father_literate father_reads parents_sch_meetings incentive_study incentive_homework incentive_read incentive_school incentive_talk time_tv_games time_clean_house work enter_school type_school number_repetitions number_dropouts like_port do_homework_port homework_corrected_port like_math do_homework_math homework_corrected_math aspiration )			
	}
	
	if `year' == 2009 {
		rename (Q1 Q2 Q3 Q4 Q5 Q6 Q7 Q8 Q10 Q11 Q12 Q13 Q14 Q16 Q17 Q15 Q18 Q19 Q20 Q21 Q22 Q23 Q24 Q25 Q26 Q27 Q28 Q29 Q30 Q31 Q33 Q34 Q35 Q36 Q37 Q38 Q39 Q40 Q41 Q42 Q43 Q44 Q45 Q47 ) ///					   
			   (gender skincolor month_birth year_birth number_tv number_radio dvd number_fridge freezer wash_mash number_car computer_internet number_bath number_room n_family_members maid live_mother mother_edu mother_literate mother_reads live_father father_edu father_literate father_reads parents_sch_meetings incentive_study incentive_homework incentive_read incentive_school incentive_talk time_tv_games time_clean_house work enter_school type_school number_repetitions number_dropouts like_port do_homework_port homework_corrected_port like_math do_homework_math homework_corrected_math aspiration )		
	}
	
	if `year' == 2011 {
		rename	(Q1 Q2 Q3 Q4 Q5 Q6 Q7 Q8 Q10 Q11 Q12 Q13 Q14 Q16 Q17 Q15 Q18 Q19 Q20 Q21 Q22 Q23 Q24 Q25 Q26 Q27 Q28 Q29 Q30 Q31 Q32 Q33 Q34 Q35 Q36 Q37 Q38 Q39 Q40 Q41 Q43 Q44 Q45 Q46 Q47 Q48 Q49 Q50 Q51 Q52 Q53 Q54 Q55 Q56 Q57 Q58 ) ///
				(gender skincolor month_birth year_birth number_tv number_radio dvd number_fridge freezer wash_mash number_car computer_internet number_bath number_room n_family_members maid live_mother mother_edu mother_literate mother_reads live_father father_edu father_literate father_reads parents_sch_meetings incentive_study incentive_homework incentive_read incentive_school incentive_talk read_news read_books_general read_literature read_magazines read_cartoons read_other_magazines read_internetnews go_library go_movies go_cultural_act go_parties_neighbor time_tv_games time_clean_house work enter_school type_school number_repetitions number_dropouts like_port do_homework_port homework_corrected_port like_math do_homework_math homework_corrected_math go_school_library aspiration )
	}
	
	if `year' > 2011 {
		rename 	(Q1 Q2 Q3 Q4 Q5 Q6 Q7 Q8 Q10 Q11 Q12 Q13 Q14 Q15 Q16 Q17 Q18 Q19 Q20 Q21 Q22 Q23 Q24 Q25 Q26 Q27 Q28 Q29 Q30 Q31 Q32 Q33 Q34 Q35 Q36 Q37 Q38 Q39 Q40 Q41 Q42 Q43 Q44 Q45 Q46 Q47 Q48 Q49 Q50 Q51 Q52 Q53 Q54 Q55 Q56 Q57) ///
				(gender skincolor month_birth year_birth number_tv number_radio dvd number_fridge freezer wash_mash number_car computer_internet number_bath number_room n_family_members maid live_mother mother_edu mother_literate mother_reads live_father father_edu father_literate father_reads parents_sch_meetings incentive_study incentive_homework incentive_read incentive_school incentive_talk read_news read_books_general read_literature read_magazines read_cartoons read_other_magazines read_internetnews go_library go_movies go_cultural_act go_parties_neighbor time_tv_games time_clean_house work enter_school type_school number_repetitions number_dropouts like_port do_homework_port homework_corrected_port like_math do_homework_math homework_corrected_math go_school_library aspiration )		
	
	}	
	drop Q*
	tempfile  9grade_`year'
	save 	 `9grade_`year''
}	

*Appending 5th and 9th grades
*--------------------------------------------------------------------------------------------------------------------*
forvalues year = 2007(2)2017 {
	clear
	append using `9grade_`year''
	append using `5grade_`year''
	compress
	save  "$output_pb/Prova Brasil Questionnaire_`year'.dta", replace
} 


*Cleaning
*------------------------------------------------------------------------------------------------------------------------*
forvalues year = 2007(2)2017 {

	use "$output_pb/Prova Brasil Questionnaire_`year'.dta", clear

	if `year' == 2007 {
		destring start_class end_class, replace
		gen 	class_time = 1 if start_class >   650  & start_class < 1200  & !missing(start_class)
		replace class_time = 2 if start_class >=  1200 & start_class < 1800  & !missing(start_class) 
		replace class_time = 3 if start_class >=  1800 				         & !missing(start_class)
		drop 	start_class end_class
	}

	if `year ' == 2007 | `year ' == 2009 {
		order 	year coduf codmunic codschool network location id_class class_time id_student grade month_birth year_birth age score_port-sd_saeb_math
		global 	variables age month_birth year_birth gender-aspiration
	}
	
	if `year ' == 2011 {
		order 	year coduf codmunic codschool network location id_class class_time id_student grade month_birth year_birth age score_port-sd_saeb_math weight
		global 	variables age month_birth year_birth gender-read_books	
	}
	
	if `year ' >  2011 {
		order 	year coduf codmunic codschool network location id_class class_time id_student grade month_birth year_birth age score_port-sd_saeb_math weight_lp weight_mt
		global 	variables age month_birth year_birth gender-read_books
	}
	
	format score* sd_* %12.2fc
		
		
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

	
	*Turno
	*--------------------------------------------------------------------------------------------------------------------*
	label define class_time 1 "Morning" 2 "Afternoon" 3 "Night" 
	label val 	 class_time class_time
		
		
	*Grade
	*--------------------------------------------------------------------------------------------------------------------*
	recode 		 grade (4 = 5) (8 = 9)
	label define grade 5 "5{sub:th} grade" 9 "9{sub:th} grade"
	label val 	 grade grade
	
	
	*Enconding
	*--------------------------------------------------------------------------------------------------------------------*
	foreach var of varlist $variables {
		replace `var' = "" if `var' == "*" | `var' == "."
		encode  `var', gen (`var'2)
		drop 	`var' 
		rename  `var'2 `var'
	}
	
	*Gender
	*--------------------------------------------------------------------------------------------------------------------*
	label   define gender 2 "Female" 1 "Male"
	label   val    gender gender
	
	
	*Skin color
	*--------------------------------------------------------------------------------------------------------------------*
	recode skincolor (6 = .)		//6 = "dont know my color"
	label define skincolor 1 "White" 2 "Brown" 3 "Black" 4 "Yellow" 5 "Indigenous"
	label val	 skincolor skincolor
	
	
	*Age
	*--------------------------------------------------------------------------------------------------------------------*
	*5th graders
	
	recode age (1 = .) (2 = 9) (3 = 10) (4 = 11) (5 = 12) (6 = 13) (7 = 14) (8 = .)  if grade == 5		//1 = 8 or less /// 8 = 15 or more
	
	*9th graders
	label  val month_birth year_birth
	if `year' == 2007 | `year' == 2009 local year_b = 1994												//for 9th graders, instead of asking their age, they ask the year of birth
	if `year' == 2011  				   local year_b = 1999
	if `year' == 2013  				   local year_b = 2001
	if `year' == 2015  				   local year_b = 2003
	if `year' == 2017  				   local year_b = 2005
	
	forvalues i = 1(1)8 { 																				//student has 8 options with years of birth
		replace  year_birth   = `year_b'	 	if grade == 9 & year_birth == `i'						//since the test is applied in the end of the year, I will not make any age adjustment based on the month of birth
		local 	 year_b       = `year_b' - 1 
	}
	
	if `year' == 2007 | `year' == 2009	replace year_birth   = . if year_birth == 1994 | year_birth == 1987	
	if `year' == 2011  				    replace year_birth   = . if year_birth == 1999 | year_birth == 1992	
	if `year' == 2013  				    replace year_birth   = . if year_birth == 2001 | year_birth == 1994
	if `year' == 2015  				    replace year_birth   = . if year_birth == 2003 | year_birth == 1996
	if `year' == 2017  				    replace year_birth   = . if year_birth == 2005 | year_birth == 1998

	replace age  = `year' - year_birth 	  		if grade == 9 & !missing(year_birth)
	drop 	month_birth year_birth	
	
	*Number of tv, radios, fridge, cars, baths, rooms
	*--------------------------------------------------------------------------------------------------------------------*
	label  define number_tv  	    1 "One" 2 "Two"  3 "Three or more" 4 "Don't have"
	label  define number_radio		1 "One" 2 "Two"  3 "Three or more" 4 "Don't have"
	label  define number_car		1 "One" 2 "Two"  3 "Three or more" 4 "Don't have"
	label  define number_bath		1 "One" 2 "Two"  3 "Three or more" 4 "Don't have"
	label  define number_room		1 "One" 2 "Two"  3 "Three or more" 4 "Don't have"
	label  define number_computer	1 "One" 2 "Two"  3 "Three or more" 4 "Don't have"
	label  define number_fridge		1 "One" 2 "Two or more"  		   4 "Don't have"
	label  define computer_internet 1 "Computer + Internet" 2 "Computer, no internet" 3 "Don't have computer"	

	if `year' <= 2011 {
		recode number_bath 		(4 = 3) (5 = 4)	//4 = 4 or more baths/rooms
		recode number_room 		(4 = 3) (5 = 4)
		recode number_fridge 			(3 = 4)
	}
	
	if `year' >= 2013 {
		clonevar number_computer = computer_internet
		replace  computer_internet = . 
		
		foreach var of varlist number_tv number_radio number_car number_bath number_room number_computer {
			tab		`var' 
			recode  `var' 		 (1 = 4) (2 = 1) (3 = 2) (4 5 = 3)
		}
		recode number_fridge 	 (1 = 4) (2 = 1) (3 4 5 = 2) 
		label  val number_computer number_computer
	}
	
	foreach variable in number_tv number_radio number_car number_bath number_room number_fridge computer_internet {
			label val `variable' `variable' 
	}
	
	
	*Yes or no questions
	*--------------------------------------------------------------------------------------------------------------------*
	recode live_mother 			(3 = 1)					//3 = woman responsible for the kid
	recode live_father 			(3 = 1) (4 = .)			//3 = man   responsible for the kid
	recode incentive_talk 		(3 = .)					//3 = error
	recode parents_sch_meetings (1 2 = 1) (3 = 0), gen (incentive_parents_meeting)
	
	foreach var of varlist mother_reads father_reads mother_literate father_literate {
		recode `var'        	(3 = .)					//3 = don't know. 
	}

	foreach item in tv radio car bath room fridge {		 //have or dont have in the house
		gen 	`item' = 0 if number_`item' == 4
		replace `item' = 1 if number_`item' <  4
	}
	
	if `year' <= 2011 {
		recode 	freezer 	  (3 = .)							//3 = dont know
		recode 	maid 		  (2 = 1) (3 = 1) (4 = 2)		
		gen 	computer 	  = 1 if computer_internet  == 1 |  computer_internet == 2
		replace computer 	  = 0 if computer_internet  == 3
	}
	
	if `year' >= 2013 {
		recode  freezer 		(1 = 2) (3 4 5 2 = 1)		
		recode  dvd 			(1 = 2) (3 4 5 2 = 1)
		recode  wash_mash		(1 = 2) (3 4 5 2 = 1)	
		recode  maid 			(1 = 2) (3 4 5 2 = 1)
		gen 	computer = 1 if number_computer == 1 | number_computer == 2 | number_computer == 3
		replace computer = 0 if number_computer == 4
	}

	recode 	number_repetitions 	(1 = 0) (2 = 1) (3 = 2)  
	recode 	number_dropouts		(1 = 0) (2 = 1) (3 = 2)  
	gen 	ever_dropped  		= 1 						if number_dropouts    >= 1 & !missing(number_dropouts)
	replace ever_dropped  		= 0 						if number_dropouts    == 0 
	gen 	ever_repeated 		= 1 						if number_repetitions >= 1 & !missing(number_repetitions)
	replace ever_repeated 		= 0 						if number_repetitions == 0 
	
	label  define yesno 1 "Yes" 0 "No"
	foreach var of varlist tv radio car bath room fridge dvd wash_mash freezer incentive* mother_literate mother_reads father_literate father_reads work live_mother live_father like_port like_math maid ever_dropped ever_repeated computer {
		recode 		`var' (2 = 0) 
		label val 	`var' yesno
	}
	
	label define ever 0 "Zero" 1 "Yes, once" 2 "Twice or more"
	label val number_repetitions ever
	label val number_dropouts  	 ever

	
	*Mother and Father education
	*--------------------------------------------------------------------------------------------------------------------*
	if `year' >= 2011 {
		recode mother_edu (2 = 1) (3 = 2) (4 = 3) (5 = 4) (6 = 5) (7 = 6)					 //to harmonize with 2007 and 2009 waves where options 1 and 2 were together. 
		recode father_edu (2 = 1) (3 = 2) (4 = 3) (5 = 4) (6 = 5) (7 = 6)
	}
	label define parents_edu 1 "Never studied or did not finish primary education" 2 "Elementar Education" 3 "Incomplete High School"  4 "Complete High School" 5 "Higher Education" 6 "Don't know"
	label val mother_edu parents_edu
	label val father_edu parents_edu
	
	
	*Time with tv or cleaning the house
	*--------------------------------------------------------------------------------------------------------------------*
	recode time_tv_games    (1 5 = 1) (2 3 = 2) (4 = 3) 
	recode time_clean_house (1 5 = 1) (2 3 = 2) (4 = 3) 
		
	label define time_tv_games			 1 "Don't watch or less than one hour" 2 "A couple hours" 3 "More than 3 hours" 
	label val 	 time_tv_games time_tv_games

	label define time_clean_house	 	 1 "Don't clean house or less than one" 2 "A couple hours" 3 "More than 3 hours" 
	label val 	 time_clean_house time_clean_house
	
	
	*Number of household members
	*--------------------------------------------------------------------------------------------------------------------*
	if `year' == 2007 | `year' == 2009  recode n_family_members (5 6 = 4)
	if `year' == 2011 					recode n_family_members (2 = 1) (3 = 2) (4 = 3) (5 6 7 = 4) //to harmonize with 2007 and 2009 waves were options 1 and 2 were together. 
	if `year' >  2011 					recode n_family_members (2 = 1) (3 = 2) (4 = 3) (5 6   = 4) 
	label define  n_family_members   1 "1 or 2" 2 "3" 3 "4" 4 "5 or more"
	label val 	  n_family_members n_family_members

	
	*Reading and cultural activities
	*--------------------------------------------------------------------------------------------------------------------*
	label define frequency  		    1 "Always/Often"  2 "Sometimes"  3  "Never/Almost never"

	if `year' > 2009 {
		foreach var of varlist read* go_* {
			label val `var' frequency
		}
		label val go_school_library
		label define go_school_library  1 "Always/Often"  2 "Sometimes"  3  "Never/Almost never"      4 "School doesn't have a library"
		label val go_school_library go_school_library
	}
	label val    parents_sch_meetings	 frequency

	*Other
	*--------------------------------------------------------------------------------------------------------------------*
	label define homework 		        1 "Always/Often"  2 "Sometimes"  3  "Never/Almost never" 	  4 "Don't have homework"
	
	foreach var of varlist  do_homework* homework_corrected* {
		label val `var' homework
	}
	 
	label define enter_school 		    1 "Daycare" 	  2 "Pre-school" 3 "Grade 1" 			   	  4 "After grade 1"
	label val 	 enter_school enter_school
	
	clonevar A = type_school
	replace type_school = .  if year < 2011 & grade == 5
	replace type_school = 1  if year < 2011 & grade == 5 & A == 2 					//only public school
	replace type_school = 1  if year < 2011 & grade == 5 & A == 1 & network <  4	//only public school		
	replace type_school = 2  if year < 2011 & grade == 5 & A == 1 & network == 4 	//current school is private and the student has always studied here. 
	replace type_school = 3  if year < 2011 & grade == 5 & A == 3 & network <  4 	//public and private
	replace type_school = 3  if 			  grade == 9 & A == 2 & network <  4	//there are 9th grade students that answered that only studied in private schools but the current school they are enrolled in is public....
	drop A
	
	label define type_school		    1 "Only public school" 		     2 "Only in private school"   3 "Public and private schools" 		
	label val 	 type_school type_school
	
	label define aspiration 		    1 "Only study" 				     2 "Only work"  			  3 "Study and work" 			4 "Don't know" 
	label val 	 aspiration aspiration
	
	gen 	only_intend_work =		  aspiration == 2 & grade == 9
	replace only_intend_work = . if  (aspiration == 4 & grade == 9) | (grade == 5)
			
	foreach var of varlist gender-ever_repeated {
		tab `var', mis
	}

	*Creating variables
	*--------------------------------------------------------------------------------------------------------------------*
	
	*Generate valid student dummy (score in both PT and MT)
	*--------------------------------------------------------------------------------------------------------------------*
	gen 	byte valid_score = 1
	*********************
	replace 	 valid_score = 0 if (score_port == . | score_math == .) | (score_port  == 0 & score_math == 0) 
	
	*Male, white, parent's education
	*--------------------------------------------------------------------------------------------------------------------*
	recode gender     (1 = 1) (2 = 0)					, gen (male)
	recode skincolor  (1 = 1) (2 3 4 5 = 0)				, gen (white)
	recode mother_edu (1 = 1) (2 3 4 5 = 0)	(6 = .)		, gen (mother_edu_lessprimary)
	recode mother_edu (2 = 1) (1 3 4 5 = 0)	(6 = .)		, gen (mother_edu_primary)
	recode mother_edu (3 = 1) (1 2 4 5 = 0)	(6 = .)		, gen (mother_edu_middleschool)
	recode mother_edu (4 5 = 1) (1 2 3 = 0) (6 = .)		, gen (mother_edu_highschool)	 //high school or more
	recode father_edu (1 = 1) (2 3 4 5 = 0)	(6 = .)		, gen (father_edu_lessprimary)
	recode father_edu (2 = 1) (1 3 4 5 = 0)	(6 = .)		, gen (father_edu_primary)
	recode father_edu (3 = 1) (1 2 4 5 = 0)	(6 = .)		, gen (father_edu_middleschool)
	recode father_edu (4 5 = 1) (1 2 3 = 0) (6 = .)		, gen (father_edu_highschool)	


	*Socioeconomic Index
	*--------------------------------------------------------------------------------------------------------------------*
	egen 	temp1 			    = rowmiss(number_fridge number_tv  number_car  number_bath number_room)
	egen 	socio_eco 	 		= rowmean(number_fridge number_tv  number_car  number_bath number_room)
	replace socio_eco 	 		= . if temp1 > 2
	drop 	temp1
	format socio_eco %4.2fc	
		
	/*
	*Parents effort
	*--------------------------------------------------------------------------------------------------------------------*
	*Parents encourage learning
	local 		incentive incentive_study incentive_homework incentive_read incentive_school incentive_talk
	egen  		temp1 					   	   		= rowmiss(`incentive')
	egen  		parents_effort_learning_mean	  	= rowmean(`incentive')
	gen   		parents_effort_learning_all  	   	= 1
	gen   		parents_effort_learning_some 	   	= 0
	foreach var of varlist `incentive' {
		replace parents_effort_learning_all  		= 0 			if `var' == 0
		replace parents_effort_learning_some 		= 1 			if `var' == 1
	}
	replace 	parents_effort_learning_mean 	 	= . 			if temp1 > 2 | valid_score == 0
	replace 	parents_effort_learning_all      	= . 			if temp1 > 2 | valid_score == 0
	replace 	parents_effort_learning_some     	= . 			if temp1 > 2 | valid_score == 0
	drop 		temp1
	
	*Parents go to school's meetings
	recode 		parents_sch_meetings (1 = 1) (2 3 = 0)  			if valid_score!= 0, gen (parents_sch_meetings_always)
	recode 		parents_sch_meetings (3 = 1) (1 2 = 0)  			if valid_score!= 0, gen (parents_sch_meetings_never)
	*/
	
	*Students effort
	*--------------------------------------------------------------------------------------------------------------------*
	recode 		do_homework_port (1 = 1) (2 3 = 0) (4 = .)  		if valid_score!= 0, gen (do_homework_port_always)
	recode 		do_homework_math (1 = 1) (2 3 = 0) (4 = .)  		if valid_score!= 0, gen (do_homework_math_always)
	*recode 	do_homework_port (3 = 1) (1 2 = 0) (4 = .)  		if valid_score!= 0, gen (do_homework_port_never)
	*recode 	do_homework_math (3 = 1) (1 2 = 0) (4 = .)  		if valid_score!= 0, gen (do_homework_math_never)

	gen     	do_homework_both_always = 1 			    		if valid_score!= 0 & 	 do_homework_port_always 		== 1 & do_homework_math_always 		 == 1
	replace 	do_homework_both_always = 0 			    		if valid_score!= 0 & 	(do_homework_port_always 		== 0 | do_homework_math_always 		 == 0) & !missing(do_homework_port_always) & !missing(do_homework_math_always)
	*gen     	do_homework_both_never  = 1 			    		if valid_score!= 0 &  	 do_homework_port_never  		== 1 & do_homework_math_never  		 == 1
	*replace 	do_homework_both_never  = 0 			    		if valid_score!= 0 & 	(do_homework_port_never  	 	== 0 | do_homework_math_never  		 == 0) & !missing(do_homework_port_never)  & !missing(do_homework_math_never)

	*Teacher's effort
	*--------------------------------------------------------------------------------------------------------------------*
	recode 		homework_corrected_port  (1 = 1) (2 3 = 0) (4 = .) 	if valid_score!= 0, gen (homework_corrected_port_always)
	recode 		homework_corrected_math  (1 = 1) (2 3 = 0) (4 = .) 	if valid_score!= 0, gen (homework_corrected_math_always)
	*recode 	homework_corrected_port  (3 = 1) (1 2 = 0) (4 = .) 	if valid_score!= 0, gen (homework_corrected_port_never)
	*recode 	homework_corrected_math  (3 = 1) (1 2 = 0) (4 = .) 	if valid_score!= 0, gen (homework_corrected_math_never)
	
	gen     	homework_corrected_both_always = 1 			   	 	if valid_score!= 0 &  	 homework_corrected_port_always == 1 & homework_corrected_math_always == 1
	replace 	homework_corrected_both_always = 0 			    	if valid_score!= 0 & 	(homework_corrected_port_always == 0 | homework_corrected_math_always == 0) & !missing(homework_corrected_port_always) & !missing(homework_corrected_math_always)
	*gen     	homework_corrected_both_never = 1 			    	if valid_score!= 0 &  	 homework_corrected_port_never  == 1 & homework_corrected_math_never  == 1
	*replace 	homework_corrected_both_never = 0 			    	if valid_score!= 0 & 	(homework_corrected_port_never  == 0 | homework_corrected_math_never  == 0) & !missing(homework_corrected_port_never) & !missing(homework_corrected_math_never)

	/*
	*Index
	*--------------------------------------------------------------------------------------------------------------------*
	recode homework_corrected_port  (1 = 1) (2 = 0.5) (3 = 0) 		if valid_score!= 0, gen (homework_corrected_port_INDEX)
	recode homework_corrected_math  (1 = 1) (2 = 0.5) (3 = 0) 		if valid_score!= 0, gen (homework_corrected_nath_INDEX)
	recode do_homework_port 		(1 = 1) (2 = 0.5) (3 = 0) 		if valid_score!= 0, gen (do_homework_port_INDEX)
	recode do_homework_math 		(1 = 1) (2 = 0.5) (3 = 0) 		if valid_score!= 0, gen (do_homework_math_INDEX)
	recode parents_sch_meetings 	(1 = 1) (2 = 0.5) (3 = 0) 		if valid_score!= 0, gen (parents_sch_meetings_INDEX)
	recode aspiration				(1 = 1) (2 = 0.5) (3 = 0) 		if valid_score!= 0, gen (aspiration_INDEX)
	
	foreach var of varlist valid_score male white parents_effort_learning_all parents_effort_learning_some *_always *_never mother_edu_* father_edu_* {
		label val `var' yesno
	}
	*/
	compress

	recode type_school  (2 3 = 1) (1    = 0),  gen (private_school)	//student already enrolled in a private school
	recode enter_school (1 2 = 1) (3 4  = 0),  gen (preschool)		//student did preschool
	
	if `year' <  2011  order year-sd_saeb_math valid_score age gender skincolor n_family_members enter_school type_school ever_* work aspiration time* number* radio dvd tv car bath room wash_mash freezer fridge maid computer computer_internet socio_eco incentive* mother* father*
	if `year' >  2009  order year-sd_saeb_math valid_score age gender skincolor n_family_members enter_school type_school ever_* work aspiration time* number* radio dvd tv car bath room wash_mash freezer fridge maid computer computer_internet socio_eco incentive* mother* father* go_* read_* weight*
	save  "$output_pb/Prova Brasil Questionnaire_`year'.dta", replace
}

*Appending years
*------------------------------------------------------------------------------------------------------------------------*
clear
forvalues year = 2007(2)2017 {
	append using   "$output_pb/Prova Brasil Questionnaire_`year'.dta"
	*erase 		   "$output_pb/Prova Brasil Questionnaire_`year'.dta"
}

*Definicao do paper de Chico Soares 2013
/*
gen 	math_insuf = 1 if grade == 5 & score_saeb_math <  175
gen 	math_basic = 1 if grade == 5 & score_saeb_math >= 175	 &  		score_saeb_math < 225
gen 	math_adequ = 1 if grade == 5 & score_saeb_math >= 225 	 & !missing(score_saeb_math)
replace math_insuf = 1 if grade == 9 & score_saeb_math <  225
replace math_basic = 1 if grade == 9 & score_saeb_math >= 225	 & 		    score_saeb_math < 300
replace math_adequ = 1 if grade == 9 & score_saeb_math >= 300	 & !missing(score_saeb_math)
	
gen 	port_insuf = 1 if grade == 5 & score_saeb_port <  150
gen 	port_basic = 1 if grade == 5 & score_saeb_port >= 150	 & 		    score_saeb_port < 200
gen 	port_adequ = 1 if grade == 5 & score_saeb_port >= 200 	 & !missing(score_saeb_port)
replace port_insuf = 1 if grade == 9 & score_saeb_port <  200
replace port_basic = 1 if grade == 9 & score_saeb_port >= 200 	 & 		    score_saeb_port < 275
replace port_adequ = 1 if grade == 9 & score_saeb_port >= 275 	 & !missing(score_saeb_port)
*/

gen 	math_insuf = 1 if grade == 5 & score_saeb_math <  200
gen 	math_basic = 1 if grade == 5 & score_saeb_math >= 200	 &  		score_saeb_math < 275
gen 	math_adequ = 1 if grade == 5 & score_saeb_math >= 275 	 & !missing(score_saeb_math)
replace math_insuf = 1 if grade == 9 & score_saeb_math <  275
replace math_basic = 1 if grade == 9 & score_saeb_math >= 275	 & 		    score_saeb_math < 350
replace math_adequ = 1 if grade == 9 & score_saeb_math >= 350	 & !missing(score_saeb_math)
	
gen 	port_insuf = 1 if grade == 5 & score_saeb_port <  200
gen 	port_basic = 1 if grade == 5 & score_saeb_port >= 200	 & 		    score_saeb_port < 275
gen 	port_adequ = 1 if grade == 5 & score_saeb_port >= 275	 & !missing(score_saeb_port)
replace port_insuf = 1 if grade == 9 & score_saeb_port <  275
replace port_basic = 1 if grade == 9 & score_saeb_port >= 275 	 & 		    score_saeb_port < 350
replace port_adequ = 1 if grade == 9 & score_saeb_port >= 350 	 & !missing(score_saeb_port)


foreach var of varlist math_insuf-math_adequ     {
	replace `var' = 0 if !missing(score_saeb_math) & `var' != 1
}	
	foreach var of varlist port_insuf-port_adequ {
	replace `var' = 0 if !missing(score_saeb_port) & `var' != 1
}	

gen 	performance_insuf =   port_insuf == 1 | math_insuf == 1
gen 	performance_basic =  (port_basic == 1 | math_basic == 1) & performance_insuf == 0
gen 	performance_adequ =  (port_adequ == 1 & math_adequ == 1) 
replace performance_insuf = . if port_insuf  == . & math_insuf == .
replace performance_basic = . if port_basic  == . & math_basic == .
replace performance_adequ = . if port_adequ  == . & math_adequ == .

label variable male								"1 for male and 0, otherwise"
label variable white 							"1 for white and 0, otherwise"
label variable coduf 							"State ID"
label variable codmunic 						"Municipality ID"
label variable codschool 						"School ID"
label variable network 							"School administrative network"
label variable grade 							"Grade"
label variable id_student 						"Student ID"
label variable year 							"Year"
label variable age 								"Student's age"
label variable urban							"1: Urban area. 0: Rural area"
label variable class_time						"1: Morning. 2: Afternoon. 3: Night"
label variable id_class							"Code of the class - you can check students in the same classroom"
label variable gender							"Student's gender"
label variable skincolor   						"Student's skin color"
label variable mother_edu  						"Mother's education (highest degree acquired)"
label variable father_edu  						"Father's education (highest degree acquired)"
label variable parents_sch_meetings 			"Parental attendance to school meetings"
label variable incentive_study 					"1 if parents encourage to study and 0, otherwise"
label variable incentive_homework 				"1 if parents encourage to do the homework and 0, otherwise"
label variable incentive_read 					"1 if parents encourage to read and 0, otherwise"
label variable incentive_school 				"1 if parents encourage to go to school and 0, otherwise"
label variable incentive_talk 					"1 if parents talk about what happens in the school and 0, otherwise"	
label variable time_tv_games					"Leisure time spent on TV, games, internet during on a school day"
label variable time_clean_house 				"Leisure time spent on domestic activities during on a school day"
label variable enter_school 					"When the student started school"
label variable number_repetitions				"Number of repetitions"
label variable number_dropouts					"Number of dropouts"
label variable do_homework_port 				"Frequency that you do your Portuguese homework"
label variable do_homework_math  				"Frequency that you do your Math homework"
label variable homework_corrected_port  		"Frequency that your Portuguese teacher corrects the homework"
label variable homework_corrected_math  		"Frequency that your Math teacher corrects the homework"
label variable aspiration 						"Student aspiration after middle school"
label variable number_tv 						"Number of TVs in the household"
label variable number_radio 					"Number of radios in the household"
label variable dvd 								"1 if the household has a DVD and 0, otherwise"
label variable number_fridge 					"Number of fridges in the household"
label variable wash_mash 						"1 if the household has a washing machine and 0, otherwise"
label variable number_car 						"Number of cars in the household"
label variable computer_internet 				"1: Computer + Internet. 2: Computer and no Internet. 3: Don’t have computer."
label variable number_bath 						"Number of baths in the household"
label variable number_room 						"Number of rooms in the household"
label variable n_family_members 				"Number of family members"
label variable maid 							"1 if the household has a maid and 0, otherwise"
label variable live_mother 						"1 if lives with mother (or legal responsible) and 0, otherwise"
label variable mother_literate 					"1 if mother knows how to read and write and 0, otherwise"
label variable mother_reads 					"1 if see the mother reading and 0, otherwise"
label variable live_father 						"1 if lives with father (or legal responsible) and 0, otherwise"
label variable father_literate 					"1 if father knows how to read and write and 0, otherwise"
label variable father_reads 					"1 if see the father reading and 0, otherwise"
label variable read_news 						"Frequency: student reads newspapers"
label variable read_magazines 					"Frequency: student reads maganizes"
label variable read_cartoons 					"Frequency: student reads cartoons"
label variable read_other_magazines 			"Frequency: student reads other magazines"
label variable read_internetnews 				"Frequency: student reads news on the internet"
label variable go_library 						"Frequency: student goes to the library"
label variable go_movies 						"Frequency: student goes to the movies"
label variable go_cultural_act 					"Frequency: student goes to theater, museums, musicals"
label variable tv 								"1 if the household has a TV and 0, otherwise"
label variable radio 							"1 if the household has a radio and 0, otherwise"
label variable car								"1 if the household has a car and 0, otherwise"
label variable bath 							"1 if the household has a bath and 0, otherwise"
label variable room 							"1 if the household has a room and 0, otherwise"
label variable fridge 							"1 if the household has a fridge and 0, otherwise"
label variable computer 						"1 if the household has a computer and 0, otherwise"
label variable ever_dropped 					"1 if the student has ever dropped and 0, otherwise"
label variable ever_repeated 					"1 if the student has ever repeated and 0, otherwise"
label variable valid_score 						"1 if the student has performance data for Portuguese and Math"
label variable socio_eco 						"Socioeconomic Indicador for Household"
label variable sd_port 							"Standard deviation of portuguese score (mean = 0, sd = 1)"
label variable sd_saeb_port 					"Standard deviation of portuguese score (SAEB scale)"
label variable sd_math 							"Standard deviation of math score (mean = 0, sd = 1)"
label variable sd_saeb_math 					"Standard deviation of math score (SAEB scale)"
label variable score_port 						"Portuguese score (mean = 0, sd = 1)"
label variable score_saeb_port 					"Portuguese score (SAEB scale)"
label variable score_math 						"Math score (mean = 0, sd = 1)"
label variable score_saeb_math 					"Math score (SAEB scale)"
label variable weight_lp 						"Student's weight - Portuguese. Starting in 2013"
label variable weight_mt 						"Student's weight - Math. Starting in 2013"
label variable weight							"Student's weight. Available only in 2011."
label variable mother_edu_lessprimary 			"1 if student's mother has less than primary and 0, otherwise"
label variable mother_edu_primary 				"1 if student's mother finished primary  and 0, otherwise"
label variable mother_edu_middleschool 			"1 if student's mother finished  middle school and 0, otherwise"
label variable number_computer 					"Number of computers in the household. Starting at 2013"
label variable freezer 							"1 if the household has freezer and 0, otherwise"
label variable read_books_general 				"Frequency: student reads books in general, 9th graders"
label variable read_literature 					"Frequency: student literature books, 9th graders"
label variable read_books 						"Frequency: student reads books, 5th graders"
label variable go_parties_neighbor 				"1 if the student goes to parties in the neighboorhood and 0, otherwise"
label variable go_school_library 				"1 if the student goes to the school's library and 0, otherwise"
label variable work 							"1 if the student work and 0, otherwise"
label variable type_school 						"Type of school since 1st/grade for 5th/graders, and since 6th/grade for 9th"
label variable like_port 						"1 if the student likes portuguese and 0, otherwise"
label variable like_math 						"1 if the student likes math and 0, otherwise"
label variable mother_edu_highschool 			"1 if student's mother finished high school and 0, otherwise"
label variable father_edu_lessprimary 			"1 if student's father has less than primary and 0, otherwise"
label variable father_edu_primary 				"1 if student's father finished primary  and 0, otherwise"
label variable father_edu_middleschool 			"1 if student's father finished  middle school and 0, otherwise"
label variable father_edu_highschool 			"1 if student's father finished high school and 0, otherwise"
label variable incentive_parents_meeting		"1 if parents go to parent's meeting"
label variable only_intend_work					"Children only intend to work after 9th grade"
label variable only_intend_work					"Children only intend to work after 9th grade"
label variable do_homework_port_always 			"Children always finish the homework"
label variable do_homework_math_always 			"Children always finish the homework"
label variable do_homework_both_always 			"Children always finish the homework"
label variable homework_corrected_port_always   "Teacher always corrects the homework"
label variable homework_corrected_math_always 	"Teacher always corrects the homework"
label variable homework_corrected_both_always 	"Teacher always corrects the homework"
label variable private_school 					"Already attended Private School"
label variable preschool						"Children did preschool"
			/*
label variable parents_effort_learning_mean 	"Mean of parent's effort (encourage study/homework/go school/read/talk)"
label variable parents_effort_learning_all 		"1 if the parent's support 100% and 0, otherwise"
label variable parents_effort_learning_some 	"1 if the student has some parent support and 0, otherwise"
label variable do_homework_both_always 			"1 if the student ALWAYS does the Portuguese and Math homework"
label variable do_homework_both_never 			"1 if the student NEVER does the Portuguese and Math homework"
label variable homework_corrected_both_always 	"1 if the teacher ALWAYS corrects the Portuguese and Math homework"
label variable homework_corrected_both_never 	"1 if the teacher NEVER corrects the Portuguese and Math homework"
label variable parents_sch_meetings_always 		"1 if parents ALWAYS go to school meetings and 0, otherwise"
label variable parents_sch_meetings_never 		"1 if parents NEVER go to school meetings and 0, otherwise"
label variable do_homework_port_always 			"1 if the student ALWAYS does the Portuguese homework"
label variable do_homework_math_always 			"1 if the student ALWAYS does the Math homework"
label variable do_homework_port_never 			"1 if the student NEVER does the Portuguese homework"
label variable do_homework_math_never 			"1 if the student NEVER does the Math homework"
label variable homework_corrected_port_always 	"1 if the teacher ALWAYS corrects the Portuguese homework"
label variable homework_corrected_math_always 	"1 if the teacher ALWAYS corrects the Math homework"
label variable homework_corrected_port_never 	"1 if the teacher NEVER corrects the Portuguese homework"
label variable homework_corrected_math_never 	"1 if the teacher NEVER corrects the Math homework"
label variable homework_corrected_port_INDEX 	"Port homework corrected. 1: Always/Often. 0.5: Sometimes. 0: Never/Almost never"
label variable homework_corrected_nath_INDEX 	"Math homework corrected. 1: Always/Often. 0.5: Sometimes. 0: Never/Almost never"
label variable do_homework_port_INDEX 			"Port homework done. 1: Always/Often. 0.5: Sometimes. 0: Never/Almost never"
label variable do_homework_math_INDEX 			"Math homeworkdone. 1: Always/Often. 0.5: Sometimes. 0: Never/Almost never"
label variable parents_sch_meetings_INDEX 		"Parents school meetings. 1: Always/Often. 0.5: Sometimes. 0: Never/Almost never"
label variable aspiration_INDEX 				"Aspiration after middle school. 1: Only study. 0.5: study and work. 0: Only work"
*/

save "$output_pb/Students.dta", replace

**Variables for Renata
foreach var of varlist incentive* { 
	tab year `var' if valid_score, mis
}

foreach var of varlist do_homework_port homework_corrected_port do_homework_math homework_corrected_math{ 
	tab year `var' if valid_score, mis
}

			
		
		
