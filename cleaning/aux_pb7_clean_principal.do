***
*1*IMPORTING PROVA BRASIL MICRODATA AT PRINCIPAL LEVEL*
***
	
	*------------------------------------------------------------------------------------------------------------------------*
	*2007*
	*------------------------------------------------------------------------------------------------------------------------*
	*------------------------------------------------------------------------------------------------------------------------*
		clear
		#delimit;
			infix
				str PK_COD_ENTIDADE 	   1-8
				str ID_DEPENDENCIA_ADM 	   9-9
				str ID_LOCALIZACAO 		   10-10
				str SIGLA_UF 			   11-12
				str COD_UF 				   13-14
				str NO_MUNICIPIO 		   15-64
				str COD_MUNICIPIO 		   65-71
				str Q1 72-72
				str Q2 73-73
				str Q3 74-74
				str Q4 75-75
				str Q5 76-76
				str Q6 77-77
				str Q7 78-78
				str Q8 79-79
				str Q9 80-80
				str Q10 81-81
				str Q11 82-82
				str Q12 83-83
				str Q13 84-84
				str Q14 85-85
				str Q15 86-86
				str Q16 87-87
				str Q17 88-88
				str Q18 89-89
				str Q19 90-90
				str Q20 91-91
				str Q21 92-92
				str Q22 93-93
				str Q23 94-94
				str Q24 95-95
				str Q25 96-96
				str Q26 97-97
				str Q27 98-98
				str Q28 99-99
				str Q29 100-100
				str Q30 101-101
				str Q31 102-102
				str Q32 103-103
				str Q33 104-104
				str Q34 105-105
				str Q35 106-106
				str Q36 107-107
				str Q37 108-108
				str Q38 109-109
				str Q39 110-110
				str Q40 111-111
				str Q41 112-112
				str Q42 113-113
				str Q43 114-114
				str Q44 115-115
				str Q45 116-116
				str Q46 117-117
				str Q47 118-118
				str Q48 119-119
				str Q49 120-120
				str Q50 121-121
				str Q51 122-122
				str Q52 123-123
				str Q53 124-124
				str Q54 125-125
				str Q55 126-126
				str Q56 127-127
				str Q57 128-128
				str Q58 129-129
				str Q59 130-130
				str Q60 131-131
				str Q61 132-132
				str Q62 133-133
				str Q63 134-134
				str Q64 135-135
				str Q65 136-136
				str Q66 137-137
				str Q67 138-138
				str Q68 139-139
				str Q69 140-140
				str Q70 141-141
				str Q71 142-142
				str Q72 143-143
				str Q73 144-144
				str Q74 145-145
				str Q75 146-146
				str Q76 147-147
				str Q77 148-148
				str Q78 149-149
				str Q79 150-150
				str Q80 151-151
				str Q81 152-152
				str Q82 153-153
				str Q83 154-154
				str Q84 155-155
				str Q85 156-156
				str Q86 157-157
				str Q87 158-158
				str Q88 159-159
				str Q89 160-160
				str Q90 161-161
				str Q91 162-162
				str Q92 163-163
				str Q93 164-164
				str Q94 165-165
				str Q95 166-166
				str Q96 167-167
				str Q97 168-168
				str Q98 169-169
				str Q99 170-170
				str Q100 171-171
				str Q101 172-172
				str Q102 173-173
				str Q103 174-174
				str Q104 175-175
				str Q105 176-176
				str Q106 177-177
				str Q107 178-178
				str Q108 179-179
				str Q109 180-180
				str Q110 181-181
				str Q111 182-182
				str Q112 183-183
				str Q113 184-184
				str Q114 185-185
				str Q115 186-186
				str Q116 187-187
				str Q117 188-188
				str Q118 189-189
				str Q119 190-190
				str Q120 191-191
				str Q121 192-192
				str Q122 193-193
				str Q123 194-194
				str Q124 195-195
				str Q125 196-196
				str Q126 197-197
				str Q127 198-198
				str Q128 199-199
				str Q129 200-200
				str Q130 201-201
				str Q131 202-202
				str Q132 203-203
				str Q133 204-204
				str Q134 205-205
				str Q135 206-206
				str Q136 207-207
				str Q137 208-208
				str Q138 209-209
				str Q139 210-210
				str Q140 211-211
				str Q141 212-212
				str Q142 213-213
				str Q143 214-214
				str Q144 215-215
				str Q145 216-216
				str Q146 217-217
				str Q147 218-218
				str Q148 219-219
				str Q149 220-220
				str Q150 221-221
				str Q151 222-222
				str Q152 223-223
				str Q153 224-224
				str Q154 225-225
				str Q155 226-226
				str Q156 227-227
				str Q157 228-228
				str Q158 229-229
				str Q159 230-230
				str Q160 231-231
				str Q161 232-232
			using "$input_pb/2007/DADOS/TS_QUEST_DIRETOR.TXT";
			save  "$output_pb/Principals_2007.dta", replace;
			*clear;	
		#delimit cr	

		
	*------------------------------------------------------------------------------------------------------------------------*
	*2009*
	*------------------------------------------------------------------------------------------------------------------------*
	*------------------------------------------------------------------------------------------------------------------------*
		clear
		insheet using "$input_pb/2009/DADOS/TS_QUEST_DIRETOR.txt", names delimiter(";")
			forvalues i = 1/146 {
				gen Q`i' = substr(tx_resp_questionario,`i',1)
			}
			drop tx_resp_questionario
			save  "$output_pb/Principals_2009.dta", replace
			
			
	*------------------------------------------------------------------------------------------------------------------------*
	*2011*
	*------------------------------------------------------------------------------------------------------------------------*
	*------------------------------------------------------------------------------------------------------------------------*
		import delimited "$input_pb/2011/DADOS/TS_QUEST_DIRETOR.csv", delimiter(";") clear 
			forvalues i = 1/9 {
				rename tx_resp_q00`i'  Q`i'
			}
			forvalues i = 10/99 {
				rename tx_resp_q0`i'   Q`i'
			}
			forvalues i = 100/212 {
				rename tx_resp_q`i'    Q`i'
			}			
			save  "$output_pb/Principals_2011.dta", replace

						
	*------------------------------------------------------------------------------------------------------------------------*
	*2013, 2015, 2017*
	*------------------------------------------------------------------------------------------------------------------------*
	*------------------------------------------------------------------------------------------------------------------------*
		foreach year in 2013 2015 2017 {
			import delimited "$input_pb/`year'/DADOS/TS_DIRETOR.csv", delimiter(",") clear 
				forvalues i = 1/9 {
					rename tx_resp_q00`i'  Q`i'
				}
				forvalues i = 10/99 {
					rename tx_resp_q0`i'   Q`i'
				}
				forvalues i = 100/111 {
					rename tx_resp_q`i'    Q`i'
				}		
			save  "$output_pb/Principals_`year'.dta", replace
		}
		
		
***
*2*HARMONIZING PROVA BRASIL
***	

	*------------------------------------------------------------------------------------------------------------------------*
		forvalues year = 2007(2)2017 {
			use "$output_pb/Principals_`year'.dta", clear
			
				if `year' == 2007 {
					gen 	 year = 2007
					drop 	 NO_MUNICIPIO SIGLA_UF 
					rename  (PK_COD_ENTIDADE-COD_MUNICIPIO) (codschool network location coduf codmunic)
					rename  (Q1 Q2 Q3 Q4 Q5 Q6 Q8 Q9 Q10 Q14 Q16 Q15 Q20 Q21 Q18 Q19 Q17 Q11 Q22 Q23 Q35 Q24 Q25 Q26 Q27 Q28 Q29 Q30 Q31 Q32 Q33 Q34 Q36 Q37 Q43 Q38 Q39 Q40 Q41 Q42 Q44 Q45 Q46 Q47 Q48 Q49 Q50 Q51 Q52 Q53 Q54 Q55 Q56 Q57 Q91 Q92 Q93 Q94 Q95 Q96 Q98 Q143 Q146 Q155 Q158 ) ///					(principal_gender principal_age_range principal_skincolor principal_edu_level principal_years_graduation type_university type_education postgrad area_postgrad principal_wage principal_other_job total_principal_wage principal_workhours_school principal_selection_work experience_asprincipal_total experience_asprincipal_school principal_exp_eductraining_last2years org_training teachers_training teachers_tenure meetings_school_council school_council_teachers school_council_students school_council_staff school_council_parents meetings_class_council pedagogic_plan students_admission school_offering criteria_classrooms criteria_teacher_classrooms prog_reduce_dropout prog_reduce_repetition prog_increase_learning absenteeism_talk_students absenteeism_talk_parents absenteeism_parents_meeting absenteeism_parents_inperson absenteeism_send_someone lack_finantial_resources lack_teachers lack_adm_staff lack_pedago_staff lack_pedago_resources interruption_school absenteeism_teachers absenteeism_students teachers_turnover student_bad_behavior interference_external_agents support_secretary_edu exchange_information support_community finantial_resourses_federal finantial_resourses_state finantial_resources_municipal books_since_beg_year lack_books books_received violence_students_teachers violence_between_students violence_lifethreat violence_student_threat violence_theft violence_robb violence_students_alcohol violence_students_drugs violence_students_knife violence_students_gun )
							(principal_gender principal_age_range principal_skincolor principal_edu_level principal_years_graduation type_university type_education postgrad area_postgrad principal_wage principal_other_job total_principal_wage principal_workhours_school principal_selection_work experience_asprincipal_total experience_asprincipal_school principal_exp_educ training_last2years org_training teachers_training teachers_tenure meetings_school_council school_council_teachers school_council_students school_council_staff school_council_parents meetings_class_council pedagogic_plan students_admission school_offering criteria_classrooms criteria_teacher_classrooms prog_reduce_dropout prog_reduce_repetition prog_increase_learning absenteeism_talk_students absenteeism_talk_parents absenteeism_parents_meeting absenteeism_parents_inperson absenteeism_send_someone lack_finantial_resources lack_teachers lack_adm_staff lack_pedago_staff lack_pedago_resources interruption_school absenteeism_teachers absenteeism_students teachers_turnover student_bad_behavior interference_external_agents support_secretary_edu exchange_information support_community finantial_resourses_federal finantial_resourses_state finantial_resources_municipal book_choice books_since_beg_year lack_books books_received agressao_prof1 agressao_prof2 agressao_func1 agressao_func2 )
				}
				
				if `year' == 2009 {
					drop 	 no_municipio sigla_uf
					gen 	 year = 2009
					rename  (pk_cod_entidade-cod_municipio)(codschool network location coduf codmunic)
					rename  (Q1 Q2 Q3 Q4 Q5 Q6 Q8 Q9 Q10 Q14 Q16 Q15 Q20 Q21 Q18 Q19 Q17 Q11 Q22 Q23 Q35 Q24 Q25 Q26 Q27 Q28 Q29 Q30 Q31 Q32 Q33 Q34 Q36 Q37 Q43 Q38 Q39 Q40 Q41 Q42 Q46 Q47 Q48 Q49 Q50 Q51 Q52 Q53 Q54 Q55 Q56 Q57 Q58 Q59 Q94 Q95 Q96 Q97 Q98 Q99 Q101 Q127 Q130 Q139 Q142 ) ///					
							(principal_gender principal_age_range principal_skincolor principal_edu_level principal_years_graduation type_university type_education postgrad area_postgrad principal_wage principal_other_job total_principal_wage principal_workhours_school principal_selection_work experience_asprincipal_total experience_asprincipal_school principal_exp_educ training_last2years org_training teachers_training teachers_tenure meetings_school_council school_council_teachers school_council_students school_council_staff school_council_parents meetings_class_council pedagogic_plan students_admission school_offering criteria_classrooms criteria_teacher_classrooms prog_reduce_dropout prog_reduce_repetition prog_increase_learning absenteeism_talk_students absenteeism_talk_parents absenteeism_parents_meeting absenteeism_parents_inperson absenteeism_send_someone lack_finantial_resources lack_teachers lack_adm_staff lack_pedago_staff lack_pedago_resources interruption_school absenteeism_teachers absenteeism_students teachers_turnover student_bad_behavior interference_external_agents support_secretary_edu exchange_information support_community finantial_resourses_federal finantial_resourses_state finantial_resources_municipal book_choice books_since_beg_year lack_books books_received agressao_prof1 agressao_prof2 agressao_func1 agressao_func2 )					
					}
				
				if `year' == 2011 					rename (id_prova_brasil-in_preenchimento) 			   (year coduf codmunic codschool network location valid_questionnaire)
				
				if `year' >	 2011					rename (id_prova_brasil-in_preenchimento_questionario) (year coduf codmunic codschool network location valid_questionnaire)
				
				if `year' == 2011 {
					rename  (Q1 Q2 Q3 Q4 Q5 Q6 Q8 Q9 Q10 Q14 Q16 Q15 Q20 Q21 Q18 Q19 Q17 Q11 Q22 Q23 Q35 Q24 Q25 Q26 Q27 Q28 Q29 Q30 Q31 Q32 Q33 Q34 Q36 Q37 Q43 Q38 Q39 Q40 Q41 Q42 Q46 Q47 Q48 Q55 Q56 Q57 Q58 Q59 Q60 Q61 Q62 Q63 Q64 Q65 Q66 Q67 Q68 Q125 Q126 Q127 Q128 Q129 Q130 Q132 Q197 Q198 Q199 Q200 Q201 Q202 Q203 Q204 Q205 Q179 Q180 Q183 Q184 ) ///				
							(principal_gender principal_age_range principal_skincolor principal_edu_level principal_years_graduation type_university type_education postgrad area_postgrad principal_wage principal_other_job total_principal_wage principal_workhours_school principal_selection_work experience_asprincipal_total experience_asprincipal_school principal_exp_educ training_last2years org_training teachers_training teachers_tenure meetings_school_council school_council_teachers school_council_students school_council_staff school_council_parents meetings_class_council pedagogic_plan students_admission school_offering criteria_classrooms criteria_teacher_classrooms prog_reduce_dropout prog_reduce_repetition prog_increase_learning absenteeism_talk_students absenteeism_talk_parents absenteeism_parents_meeting absenteeism_parents_inperson absenteeism_send_someone food_finantial_resources food_amount food_quality lack_finantial_resources lack_teachers lack_adm_staff lack_pedago_staff lack_pedago_resources interruption_school absenteeism_teachers absenteeism_students teachers_turnover student_bad_behavior interference_external_agents support_secretary_edu exchange_information support_community finantial_resourses_federal finantial_resourses_state finantial_resources_municipal book_choice books_since_beg_year lack_books books_received prog_violence prog_drug prog_racism prog_homophobia proj_bullying proj_teen_pregnancy prog_inequality prog_div_religious prog_environment agressao_prof1 agressao_prof2 agressao_func1 agressao_func2 )				
				}

				if `year' >  2011 {
					rename  (Q1 Q2 Q3 Q4 Q5 Q6 Q7 Q8 Q9 Q10 Q11 Q12 Q13 Q14 Q15 Q16 Q17 Q18 Q19 Q26 Q27 Q28 Q29 Q30 Q31 Q32 Q37 Q38 Q39 Q40 Q41 Q42 Q43 Q45 Q46 Q47 Q48 Q49 Q62 Q63 Q64 Q67 Q68 Q69 Q70 Q71 Q72 Q73 Q74 Q75 Q76 Q77 Q78 Q79 Q80 Q81 Q82 Q83 Q86 Q87 Q88 Q89 Q90 Q91 Q92 Q93 Q94 Q95 Q96 Q97 Q98 Q99 Q100 Q101 Q102 Q103 Q104 Q105 Q106 Q107 Q108 ) ///				
							(principal_gender principal_age_range principal_skincolor principal_edu_level principal_years_graduation type_university type_education postgrad area_postgrad principal_wage principal_other_job total_principal_wage principal_workhours_school principal_selection_work principal_experience_asteacher experience_asprincipal_total experience_asprincipal_school principal_exp_educ training_last2years org_training teachers_training teachers_tenure meetings_school_council school_council meetings_class_council pedagogic_plan students_admission school_offering criteria_classrooms criteria_teacher_classrooms prog_reduce_dropout prog_reduce_repetition prog_increase_learning absenteeism_talk_students absenteeism_talk_parents absenteeism_parents_meeting absenteeism_parents_inperson absenteeism_send_someone food_finantial_resources food_amount food_quality lack_finantial_resources lack_teachers lack_adm_staff lack_pedago_staff lack_pedago_resources interruption_school absenteeism_teachers absenteeism_students teachers_turnover student_bad_behavior interference_external_agents support_secretary_edu exchange_information support_community finantial_resourses_federal finantial_resourses_state finantial_resources_municipal book_choice books_since_beg_year lack_books books_received violence_students_teachers violence_between_students violence_lifethreat violence_student_threat violence_theft violence_robb violence_students_alcohol violence_students_drugs violence_students_knife violence_students_gun prog_violence prog_drug prog_racism prog_homophobia proj_bullying proj_teen_pregnancy prog_inequality prog_div_religious prog_environment )				
									
				}
				drop Q*
				destring codschool network location coduf codmunic, replace
				tempfile `year'
				save 	``year''
				compress
		erase "$output_pb/Principals_`year'.dta"
		}
		clear 		
		forvalues year = 2007(2)2017 {
			append using ``year''
		}
		order year coduf codmunic codschool  network location valid* 
		
		
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


		*Enconding
		*--------------------------------------------------------------------------------------------------------------------*
		foreach var of varlist  principal_gender-violence_students_gun {
			replace `var' = "" if `var' == "*" | `var' == "."
			encode  `var', gen (`var'2)
			drop 	`var' 
			rename  `var'2 `var'
		}
		
		*principal_gender
		*--------------------------------------------------------------------------------------------------------------------*
		label   define principal_gender    2 "Female" 1 "Male"
		label   val    principal_gender principal_gender
		
		
		*Age
		*--------------------------------------------------------------------------------------------------------------------*
		label 	define principal_age_range 1 "Up to 24 years old" 2 "Between 25-29 years old" 3 "Between 30 and 39 years old" 4 "Between 40 and 49 years old"  5 "Between 50 and 54 years old"  6 "More than 55 years old"
		label 	val    principal_age_range principal_age_range
		
		
		*Skin color
		*--------------------------------------------------------------------------------------------------------------------*
		recode 		   principal_skincolor (6 7 = .)		//6 = "dont know my color"
		label 	define principal_skincolor 1 "White" 2 "Brown" 3 "Black" 4 "Yellow" 5 "Indigenous"
		label 	val	   principal_skincolor principal_skincolor
		
		
		*Principal ducation
		*--------------------------------------------------------------------------------------------------------------------*
		label  	define principal_edu_level  				1 "Less than high school"   2 "High school"  		3 "Undergraduate/Pedagogy"  4 "Undergraduate/Math"   5 "Undergraduate/Portuguese" 6 "Undergraude/others"
		label  	define principal_years_graduation  	1 "Less than 2 years" 		2 "Between 3-7 years" 	3 "Between 8-14 yars" 		4 "Betweeen 15-20 years" 5 "More than 20 years" 
		label  	define postgrad   				1 "No grad. certificate"    2 "Short Course" 		3 "Specialization" 			4 "Masters" 			 5 "Phd"
		label 	define type_university 			1 "Federal"				    2 "State" 				3 "Municipal" 				4 "Private" 
		label 	define type_education 			1 "Face to Face"  		    2 "Face/Distance" 		3 "Distance Learning"  
		label 	define area_postgrad 			1 "Education" 			    0 "Other field" 
		recode 	principal_edu_level 			(1 = 1) (2 3 = 2) (4 = 3) (5 = 4) (6 = 5) (7 8 = 6)   	if year <  2013
		recode 	principal_edu_level 			(1 = 1) (2 3 = 2) (4 = 3) (6 = 4) (7 = 5) (5 8 9 = 6) 	if year >= 2013
		recode 	postgrad 			(5 = 1) (1   = 2) (2 = 3) (3 = 4) (4 = 5)   		  	if year <  2013
		recode  type_university 	(5 = .) 								  		 		if year <  2013
		recode 	type_university 	(1 = .) (2   = 4) (3 = 1) (4 = 2) (5 = 3) 				if year >= 2013
		recode 	type_education	 	(4 = .) 												if year <  2013
		recode 	type_education 		(1 = .) (2   = 1) (3 = 2) (4 = 3) 						if year >= 2013
		recode 	area_postgrad 		(1 2 3   = 1) (4 = 0) (5 = .) 							if year <  2011
		recode 	area_postgrad 		(1 2 3 4 = 1) (5 = 0) 		   							if year == 2011
		recode 	area_postgrad 		(2 3 4 5 = 1) (6 = 0) (1 = .) 							if year >  2011
		label  	val principal_years_graduation principal_years_graduation
		label  	val principal_edu_level principal_edu_level
		label  	val postgrad postgrad
		label 	val type_university type_university
		label   val type_education type_education
		label   val area_postgrad area_postgrad
		
				
		*Principal Experience
		*--------------------------------------------------------------------------------------------------------------------*
		label  	define principal_experience_asteacher 1 "Never worked as teacher" 2 "Less than one year" 3 "1-2 years"  4 "3-5 years"   5 "6-10 years" 6 "11-15 years" 7 "16-20" 8 "More than 20 years"
		label  	define experience 		  	1 "Less than 2 years"    	2 "3-5 years"     	   3"6-10 years"  4 "11-15 years" 5 "More than 15 years"

		foreach var of varlist experience_asprincipal_total experience_asprincipal_school principal_exp_educ{
			recode `var' (1 2 = 1) (3 = 2) (4 5 = 3) (6 = 4) (7 8 = 5) if year == 2011
			recode `var' (1 2 = 1) (3 = 2) (4   = 3) (5 = 4) (6 7 = 5) if year >  2011
			label  val `var' experience
		}
		label val principal_experience_asteacher principal_experience_asteacher
		

		*principal_wage, hours worked
		*--------------------------------------------------------------------------------------------------------------------*
		label 	define hours_worked 	1 "More than 40 hours" 						2 "40 hours" 					3  "Between 20-39 hours" 		 4 "Less than 20 hours" 
		label 	define principal_wage 	1 "Up to one minimum principal_wage" 	  	2 "Between 1-1.5 minimum principal_wage"  3  "Between 1.5-2 minimum principal_wages" 4 "Between 2-2.5 minimum principal_wages" ///
										5 "Between 2.5-3 minimum principal_wages"   6 "Between 3-3.5 minimum principal_wages" 7  "Between 3.5-4 minimum principal_wages" 8 "Between 4-5 minimum principal_wages"   ///
										9 "Between 5-7 minimum principal_wages"     10 "Between 7-10 minimum principal_wages" 11 "More than 10 minimum ages"
		label   define principal_other_job		1 "Yes, in education area"		2 "Yes, in other field"			3  "Don't have another job"
		
		
		replace principal_wage 		= . if year == 2007
		replace total_principal_wage	= . if year == 2007
		recode  principal_workhours_school (4 = 1) (3 = 2) (2 = 3) (1 = 4) if year < 2013
		label   val principal_workhours_school hours_worked
		label   val principal_wage 	   principal_wage
		label   val total_principal_wage principal_wage
		label   val principal_other_job principal_other_job
		
		
		*Other
		*--------------------------------------------------------------------------------------------------------------------*
		label  define  yesno 							1 "Yes" 							0 "No"
		label  define  meetings  						1 "Once" 							2 "Twice"   										3 "Three times or more"  				  			4 "None"  		   										5 "No school council"
		label  define  principal_selection_work 		1 "Election" 						2 "Election involving additional process"   		3 "Selection/civil servant" 						4 "Appointments"     									5 "Other process"
		label  define  teachers_tenure 					1 "25% or less"						2 "Between 26-50%"									3 "Between 51-75%" 						  			4 "Between 76%-90%"  									5 "More than 91%"
		label  define  students_admission				1 "Selection test"					2 "Lottery" 										3 "Household Address" 					  			4 "Order of arrival" 									5 "Other criteria" 						6 "No criteria"   
		label  define  school_offering					1 "More vacancies than enrollments" 2 "All vacancies were filles"						3 "Demand > vacancies offered"			  			4 "Demand much higher than vacancies offered"
		label  define  criteria_classrooms				1 "Similar ages"				    2 "Similar student's performance"					3 "Heterogeneity in age"  				  			4 "Heterogeneity in performance"  						5 "No criteria"
		label  define  criteria_teacher_classrooms	    1 "Teacher's choice" 				2 "More experienced teachers with high performers"  3 "More experienced teachers with low performers" 	4 "Keeping teachers with the same last year's students" 5 "Change of teachers between grades"   6 "Lottery"    7 "Other criteria" 8 "No criteria"  9 "Don't have 1st/5th grade"
		label  define  programa 						0 "No, even having the problem" 	1 "Yes"												2 "We don't have this problem"
		label  define  food 							2 "We don't serve meals"			2 "Bad" 											3 "Ok" 												4 "Good" 												5 "Excelent" 
		label  define  problem                          0 "Not an issue" 					1 "Small" 											2 "A moderate/big issue"
		label  define  teachers_training 				0 "No training" 					1 "Only a few"  									2 "A bit less than half"						    3 "More than half"
		label  define  book_choice 						1 "External agent" 					2 "Few people or someone alone" 					3 "Group choice"
		label  define  pedagogic_plan  					1 "No pedag. project" 				2 "Modelo pronto, sem discussão da equipe"			///
		3  "Modelo pronto com algumas modificações/modelo próprio mas sem teacher's active involvement" 4 "With active teacher's involvement"
		
		recode criteria_classrooms						(5 = .) (6 = 5) if year > 2011
		recode principal_selection_work  							(2 = 1) 	(3 = 2) 		(1     = 3) 	(4 5 6 = 4) (7 = 5)	 								if year <  2013
		recode principal_selection_work  							(2 = 1) 	(5 = 2) 		(1 4 6 = 3) 	(3     = 4) (7 = 5) 								if year >= 2013
		recode meetings_school_council  				(3 = 1) 	(4 = 2) 		(5 = 3) 		(2 = 4) 	(1 = 5)  											if year >= 2013
		recode meetings_class_council  					(3 = 1) 	(4 = 2) 		(5 = 3) 		(2 = 4) 	(1 = 5)  											if year >= 2013
		recode pedagogic_plan 							(6 7 = .) (8 = 1) (1 = 2) (2   = 3) (3 4 5    = 4)				 											if year <  2011
		recode pedagogic_plan 							(7 8 = .) (9 = 1) (1 = 2) (2   = 3) (3 4 5 6  = 4)				 											if year == 2011
		recode pedagogic_plan 							(1   = .) (2 = 1) (3 = 2) (5 7 = 3) (4 6 8    = 4)				 											if year >  2011
		recode criteria_teacher_classrooms  			(2   = 1) 	(3 = 2)  		(4 = 3)  		(5 = 4)  	(6 = 5)  (7 = 6) (8   = 7) (9  = 8) (1 = 9)  		if year <  2013
		recode criteria_teacher_classrooms  			(1 2 = 1) 	(3 = 2)  		(4 = 3)  		(5 = 4)  	(6 = 5)  (7 = 6) (8 9 = 7) (10 = 8) 		  		if year >= 2013		
		recode book_choice								(5 = 1) (3 4 = 2) (1 2 = 3) (6   = .)																		if year <  2013
		recode book_choice								(4 = 1) (3   = 2) (2   = 3) (1 5 = .)																		if year >= 2013
		
		label  val meetings_school_council 				meetings
		label  val meetings_class_council  				meetings
		label  val principal_selection_work 		   				principal_selection_work
		label  val teachers_tenure 		   				teachers_tenure
		label  val students_admission      				students_admission
		label  val school_offering		   				school_offering
		label  val criteria_classrooms	   				criteria_classrooms
		label  val criteria_teacher_classrooms 			criteria_teacher_classrooms 
		label  val pedagogic_plan						pedagogic_plan
		label  val book_choice							book_choice
		
		foreach var of varlist prog_reduce_dropout prog_reduce_repetition {
			recode 		`var' (3 = 0) (1 2   = 1) (4 = 2) if year <  2013
			recode 		`var' (1 = 0) (3 4 5 = 1) (2 = 2) if year >= 2013
			label val 	`var' programa
		}
		
		foreach var of varlist lack_finantial_resources-student_bad_behavior {
			recode		`var' (1 = 0) (2   = 1) (3 4 = 2) if year >= 2013
			recode 		`var' (1 = 0) (2   = 1) (3   = 2) if year <  2013
			label val   `var' problem
		}
		
		foreach var of varlist food* {
			label val 	`var' food
		}
		
		foreach var of varlist absenteeism_talk_students absenteeism_talk_parents absenteeism_parents_meeting absenteeism_parents_inperson absenteeism_send_someone {
			recode 		`var' (1 = 0) (2 3 4 = 1) if year >= 2013
			recode 		`var' (1 = 1) (2     = 0) if year <  2013
			label val   `var' yesno
		}
		
		foreach var of varlist  prog_violence-prog_environment finantial_resourses_federal finantial_resourses_state finantial_resources_municipal books_since_beg_year lack_books books_received {
			recode 	  	`var' (1 = 1) (2 = 0) (3 = .)
			label val 	`var' yesno
		}
		
		foreach var of varlist violence_students_teachers-violence_students_gun {
			recode 		`var' (1   = 1) (2   = 0) if year >= 2013
			label val 	`var' yesno
		}
		
		replace 	 violence_students_teachers = 0 if 				year < 2013
		foreach var of varlist agressao_prof1 agressao_prof2 agressao_func1 agressao_func2 {
			replace  violence_students_teachers = 1 if `var' == 1 & year < 2013
			drop 	`var'
		}

		foreach var of varlist org_training training_last2years prog_increase_learning {
			recode 		`var' (2 = 0) 		 	if year <  2013
			recode 		`var' (1 = 0) (2 = 1) 	if year >= 2013
			label val   `var' yesno
		}

		foreach var of varlist interference_external_agents support_secretary_edu exchange_information support_community {
			recode 		`var' (1 = 1) (2 = 0)
			label val 	`var' yesno
		}
	
		foreach var of varlist school_council_teachers school_council_students school_council_staff school_council_parents {
			recode 	    `var' (2 = 0) if year < 2013
			label val   `var' yesno
		}
		
		recode   teachers_training 		  (1 = 0) (2    = 1) (3 = 2) (4 5 = 3)  		if  year >= 2013
		recode   teachers_training 		  		  (1  2 = 1) (3 = 2) (4   = 3) (5 = .) 	if  year <  2013
		replace  teachers_training 		  = 0  							    			if  year <  2013 & org_training == 0
		
		label    val teachers_training teachers_training
		
		replace  school_council_teachers  = 1	if school_council >= 2 & school_council <= 6
		replace  school_council_teachers  = 0	if school_council == 1 | school_council == 7
		replace  school_council_students  = 1	if inlist(school_council, 2, 4, 5)
		replace  school_council_students  = 0	if inlist(school_council, 1, 3, 6, 7)
		replace  school_council_staff 	  = 1	if inlist(school_council, 2, 3, 5)
		replace  school_council_staff 	  = 0	if inlist(school_council, 1, 4, 6, 7)
		replace  school_council_parents   = 1	if inlist(school_council, 2, 3, 4, 6)
		replace  school_council_parents   = 0	if inlist(school_council, 1, 5, 7)
		drop 	 school_council
		 
		 
		*Defining new variables
		*--------------------------------------------------------------------------------------------------------------------*	
		**
		*Males, whites and college degree
		**
		recode principal_gender     (1 = 1) (2 = 0)					, gen (male)
		recode principal_skincolor  (1 = 1) (2 3 4 5 = 0)				, gen (white)
		recode principal_edu_level  (3 4 5 6 = 1) (2 1 = 0)			, gen (principal_college_degree)
		label  val male   yesno
		label  val white  yesno
		label  val principal_college_degree yesno
		
		**
		*External support
		**

		egen temp1 						 = rowmiss(interference_external_agents support_secretary_edu exchange_information support_community)
		egen external_support_mean 		 = rowmean(interference_external_agents support_secretary_edu exchange_information support_community)

		gen external_support_all 		 = 1
		foreach var of varlist 					  interference_external_agents support_secretary_edu exchange_information support_community {
			replace external_support_all = 0 if `var' == 0
		}
		replace external_support_mean    =.  if temp1 > 1
		replace external_support_all     =.  if temp1 > 1
		drop 	temp1
		
		**
		*Principal effort - implementation of projects to increase learning and reduce dropout/repetition
		**
		egen temp1 					 	 	    = rowmiss(prog_reduce_dropout prog_reduce_repetition prog_increase_learning)
		egen implementation_projects_mean	    = rowmean(prog_reduce_dropout prog_reduce_repetition prog_increase_learning)

		gen  implementation_projects_all        = 1
		foreach var of varlist 						   prog_reduce_dropout prog_reduce_repetition prog_increase_learning {
			replace implementation_projects_all = 0 if `var' == 0
		}
		replace implementation_projects_all  =. if temp1 > 1
		replace implementation_projects_mean =. if temp1 > 1
		drop 	temp1
		
		label val implementation_projects_all yesno
		label val external_support_all 		  yesno
		
		**
		*Student effort from principal's perspective
		foreach 		var of varlist  absenteeism_students student_bad_behavior {
						recode `var' (0=1) (1=0.5) (2=0), gen(II_`var')
		}
			
		egen 			student_effort_principal = rowmean(II_*) if  !missing(absenteeism_students) &!missing(student_bad_behavior)
		drop 			II_* 
			
		**
		*Teachers effort from principal's perspectiva
		foreach 		var of varlist  absenteeism_teachers teachers_turnover {
						recode `var' (0=1) (1=0.5) (2=0), gen(II_`var')
		}
			
		egen 			teacher_effort_principal = rowmean(II_*) if  !missing(absenteeism_teachers) &!missing(teachers_turnover)
		drop 			II_* 		
		
		format  		implementation* external* student_effort* teacher_effort* %4.2fc

		**
		*
		**
		tab teachers_training, 			gen(teachers_training)
		tab principal_selection_work, 	gen(principal_selection_work)
		tab absenteeism_teachers, 		gen(absenteeism_teachers)
		tab absenteeism_students, 		gen(absenteeism_students)
		tab teachers_turnover, 			gen(teachers_turnover)


		label variable student_effort_principal 		"Student effort - principal's view"
		label variable teacher_effort_principal			"Teacher effort - principal's view"
		label variable implementation_projects_mean  	"Mean principal effort - projects to reduce dropout/repetition and increase learning"
		label variable implementation_projects_all   	"Full principal effort - projects to reduce dropout/repetition and increase learning"
		label variable external_support_mean 		 	"Mean external stakeholder's suppport - principal's view"
		label variable external_support_all  		  	"Full external stakeholder's suppport - principal's view"
		label variable male								"1 for males and 0, otherwise"
		label variable white							"1 if teacher is white and 0, otherwise" 
		label variable principal_age_range				"Principal's age range"
		label variable principal_years_graduation		"Years since graduation"
		label variable type_university					"1: Federal. 2: State. 3: Municipal. 4: Private"
		label variable type_education					"1: Face to face. 2: Face to face/distance. 3: Distance learning"
		label variable principal_edu_level 				"Principal's education"
		label variable postgrad  						"Principal's graduate certificate"
		label variable meetings_class_council  			"Number of class council meetings"
		label variable meetings_school_council  		"Number of student council meetings"
		label variable pedagogic_plan 					"Development of the pedagogical plan"
		label variable coduf 							"State ID"
		label variable codmunic 						"Municipality ID"
		label variable codschool 						"School ID"
		label variable network 							"School administrative network"
		label variable year 							"Year"
		label variable urban							"1: Urban area. 0: Rural area"
		label variable valid_questionnaire				"1 for vali questionnaire and 0, otherwise"
		label variable principal_gender					"Principal's principal_gender"
		label variable principal_skincolor   			"Principal's skin color"
		label variable area_postgrad 					"Area of Graduate School"
		label variable principal_other_job 				"Do you have another job?"
		label variable principal_wage 					"Gross principal_wage as principal"
		label variable total_principal_wage 			"Gross principal_wage consideral all jobs the principal has"
		label variable principal_exp_educ				"Principal's experience working in education"
		label variable experience_asprincipal_total 	"Total experience as principal"
		label variable experience_asprincipal_school 	"Experience as principal in this school"
		label variable principal_experience_asteacher	"Previous experience as teacher"
		label variable principal_workhours_school 		"Weekly hours of work in this school"
		label variable violence_lifethreat  			"1 if you have ever had your life threatened in this school and 0, otherwise"
		label variable violence_student_threat  		"1 if you already had a student threatening your life in school and 0, otherwise" 
		label variable violence_theft  					"1 if you were already victim of theft in school? (no violence) and 0, otherwise"
		label variable violence_robb  					"1 if you were already victim of theft in school? (with iolence) and 0, otherwise"
		label variable violence_students_alcohol  		"1 if you already had a student in class under infl. alcohol and 0, othewise"
		label variable violence_students_drugs  		"1 if you already had a student in class under infl. drugs and 0, othewise"
		label variable violence_students_knife  		"1 if you already had a student in class with a knife and 0, othewise"
		label variable violence_students_gun 			"1 if you already had a student in class with a gun and 0, othewise"
		label variable school_council_teachers 			"1 if teachers participate of the school council and 0, otherwise"
		label variable school_council_students 			"1 if students participate of the school council and 0, otherwise"
		label variable school_council_staff				"1 if school staff participate of the school council and 0, otherwise"
		label variable school_council_parents			"1 if parents participate of the school council and 0, otherwise"
		label variable students_admission 				"Criteria for student's enrollment in the school"
		label variable school_offering 					"Demand and supply of vacancies"
		label variable criteria_classrooms 				"Criteria for student's allocation into classrooms"
		label variable criteria_teacher_classrooms		"Criteria for teacher's allocation into classrooms"
		label variable principal_selection_work 		"How principal was selected for the position"
		label variable org_training 					"1 if principal has organized teacher's training last two years and 0, otherwise"
		label variable teachers_training			 	"Teachers training. 1: no training. 2: only a few. 3: less half. 4: more than half"
		label variable training_last2years				"1 if principal has participated of some training last two years and 0, otherwise"
		label variable teachers_tenure 					"Share of teachers with tenure (civil servants)"
		label variable prog_reduce_dropout 				"0: no program reduce dropout but needs it/1: has a program/2: Does not need"
		label variable prog_reduce_repetition 			"0: no program reduce repetition but needs it/1: has a program/2: Does not need"
		label variable absenteeism_talk_students 		"1 if teachers talk to students to avoid their absenteeism and 0, otherwise"
		label variable absenteeism_talk_parents 		"1 if teachers communicate parents about student's absenteeism and 0, otherwise"
		label variable absenteeism_parents_inperson 	"1 if teachers invite parents to talk about student's absenteeism and 0, otherwise"
		label variable absenteeism_send_someone 		"1 if school sends someone to student's home talk about absenteeim and 0, otherwise"
		label variable absenteeism_parents_meeting 		"1 if teachers talk about student's absenteeism in parent's meeting and 0, otherwise"
		label variable prog_increase_learning 			"0: no program increase learning but needs it/1: has a program/2: Does not need"
		label variable absenteeism_teachers 			"Teacher's absenteeism. 0: not an issue. 1: Small/moderate. 2: Big issue"
		label variable teachers_turnover				"Teacher's turnover. 0: not an issue. 1: Small/moderate. 2: Big issue"
		label variable lack_finantial_resources 		"Lack of finantial resources. 0: not an issue. 1: Small/moderate. 2: Big issue"
		label variable lack_teachers 					"Lack of teachers. 0: not an issue. 1: Small/moderate. 2: Big issue"
		label variable lack_adm_staff 					"Lack of adm staff. 0: not an issue. 1: Small/moderate. 2: Big issue"
		label variable lack_pedago_staff 				"Lack of pegago staff. 0: not an issue. 1: Small/moderate. 2: Big issue"
		label variable lack_pedago_resources 			"Lack of pedago resources. 0: not an issue. 1: Small/moderate. 2: Big issue"
		label variable interruption_school 				"Interruption of classes. 0: not an issue. 1: Small/moderate. 2: Big issue"
		label variable absenteeism_students 			"Absenteism of students. 0: not an issue. 1: Small/moderate. 2: Big issue"
		label variable student_bad_behavior 			"Student's bad behaviour 0: not an issue. 1: Small/moderate. 2: Big issue"
		label variable interference_external_agents 	"1: interference of external agents in the principals management and 0, otherwise"
		label variable support_secretary_edu 			"1 if principal has the support from the secretary of education and 0, otherwise"
		label variable exchange_information 			"1 if principal exchange informations with other principals and 0, otherwise"
		label variable support_community 				"1 if principal has the support of the community 0, otherwise"
		label variable finantial_resourses_federal 		"1 if school receives finantial resources from Federal Gov and 0, otherwise"
		label variable finantial_resourses_state 		"1 if school receives finantial resources from State Gov and 0, otherwise"
		label variable finantial_resources_municipal 	"1 if school receives finantial resources from Municipal Gov and 0, otherwise"
		label variable books_since_beg_year 			"1 if textbooks arrived in the begginning of the school year and 0, otherwise"
		label variable lack_books 						"1 if there is lack of textbooks and 0, otherwise"
		label variable books_received 					"1 if textbooks arrived in the school and 0, otherwise"
		label variable violence_students_teachers 		"1 if there was physical/verbal disagrement between student/teachers and 0, otherwise"
		label variable violence_between_students 		"1 if there was physical/verbal disagrement between students and 0, otherwise"
		label variable food_finantial_resources 		"Finantial resources for food. 1: Does not have. 2: Bad. 3: Ok. 4: Good. 5: Great"
		label variable food_amount 						"Amoung of food. 1: Does not have. 2: Bad. 3: Ok. 4: Good. 5: Great"
		label variable food_quality 					"Quality of the food. 1: Does not have. 2: Bad. 3: Ok. 4: Good. 5: Great"
		label variable prog_violence 					"1 if school has projects about violence and 0, otherwise"
		label variable prog_drug 						"1 if school has projects about drugs and 0, otherwise"
		label variable prog_racism 						"1 if school has projects about racism and 0, otherwise"
		label variable prog_homophobia 					"1 if school has projects about homophobia and 0, otherwise"
		label variable proj_bullying 					"1 if school has projects about bullying d 0, otherwise"
		label variable proj_teen_pregnancy 				"1 if school has projects about teen pregnacy and 0, otherwise"
		label variable prog_inequality 					"1 if school has projects about inequality and 0, otherwise"
		label variable prog_div_religious				"1 if school has projects about religious diversity and 0, otherwise"
		label variable prog_environment 				"1 if school has projects about environment and 0, otherwise"
		label variable principal_college_degree			"1 if principal has a college degree and 0, otherwise"
		label variable book_choice						"1: principal does not know. 2: external choice. 3: internal choice"
		compress
		save "$output_pb/Principals.dta", replace
		
		
		**Variables for Renata
		foreach var of varlist org_training	teachers_training	meetings_school_council	meetings_class_council	pedagogic_plan	criteria_teacher_classrooms	prog_reduce_dropout	prog_reduce_repetition	prog_increase_learning	absenteeism_talk_students	absenteeism_talk_parents	absenteeism_parents_meeting	absenteeism_parents_inperson	absenteeism_send_someone	lack_teachers	lack_pedago_staff	lack_pedago_resources	absenteeism_teachers	student_bad_behavior	book_choice	violence_students_teachers{
			tab year `var', mis
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
