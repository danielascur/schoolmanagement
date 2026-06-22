
* Set environment

clear all
clear matrix
set more off


* Running PISA globals
do "cleaning/aux_pisa0_globals.do"



* PISA 2012: Converting raw files (.txt) to .dta
do "cleaning/aux_pisa1_build_cog_score.do"
do "cleaning/aux_pisa2_build_cog_item.do"
do "cleaning/aux_pisa3_build_parent.do"
do "cleaning/aux_pisa4_build_school.do"
do "cleaning/aux_pisa5_build_student.do"

display "End of PISA 2012 raw extracting part"

* Output from these files: student.dta, cognitive.dta, cognitive_score.dta, parent.dta, school.dta

*-----------------------------------------*
* JOIN ALL DATA SETS AT STUDENT-LEVEL
*-----------------------------------------*

use "cleaning/tempdata/student.dta", clear // start at student level
sort cnt nc schoolid stidstd // sort by key IDs
	
merge 1:1 cnt nc schoolid stidstd using "cleaning/tempdata/cognitive.dta", nogen 	// merge cognitive data
merge 1:1 cnt nc schoolid stidstd  using "cleaning/tempdata/cognitive_score.dta", nogen // merge cognitive_score data
merge 1:1 cnt nc schoolid stidstd using "cleaning/tempdata/parent.dta", nogen 	  	// merge parents data
merge m:1 cnt nc schoolid using "cleaning/tempdata/school.dta", nogen			// merge schools/principal data
	
compress
note: This dataset is at student level
save "cleaning/tempdata/PISA2012.dta", replace		

*-----------------------------------------*
* CLEAN STUDENT-LEVEL DATA SET
*-----------------------------------------*

* Create year
g year=2012
	
* Dropping students without outcome variables
drop if pv1math==.	
	
* Generating school indicator (for all countries)
gen uschool_id = cnt + schoolid 
	
* Indicator for whether a country is in the WMS
g wmscty=(cnt=="BRA" | cnt=="COL" | cnt=="MEX" | cnt=="USA" | cnt=="GBR" | cnt=="CAN" | cnt=="SWE" | cnt=="ITA"| cnt=="DEU") 
label var wmscty "Country included in WMS"
		
* Rename student-level characteristics
rename st04q01 stu_female
rename immig stu_immi
rename age stu_age
label values stu_age
		
* Clean school-level characteristics
rename sc03q01 schloc
		
* Number of students
egen students = rsum(sc07q01 sc07q02)
g lstu = ln(students) // implicitly drops any schools with 0 students

rename sc02q01 govfund
		
g private = (sc01q01==2)
replace private=. if sc01q01==.

label define private 0 "public" 1 "private"
label values private private

rename sc01q01 sector
		
g rural=.
replace rural=1 if schloc==2
replace rural=0 if schloc==3 | schloc==4 | schloc==5
label define rural 0 "urban" 1 "rural"
		
* Expansion factors, school ids
rename senwgt_stu stu_fac		
rename senwgt_scq pri_fac	

* Indicators for regressions
g ctyctrl = 1
egen c = group(cnt)
tab stu_immi, generate(stu_immi)
tab schloc, generate(schloc)

* Creating variables for missing observations
forvalues i=1/5 {
	gen schloc`i'_imp = schloc`i'
	replace schloc`i'_imp = -99 if schloc`i' == .
}

forvalues i=1/3 {
	gen stu_immi`i'_imp = stu_immi
	replace stu_immi`i'_imp = -99 if stu_immi`i' == .
}

foreach var in stratio lstu compweb govfund grade escs schloc stu_immi {
	gen `var'_imp = `var'
	replace `var'_imp = -99 if `var' == .	
	gen `var'_m = (`var' == .)
	label var `var'_m "`var'==missing"
}




*--------------------------------------------------*
* Encoding Management variables
*--------------------------------------------------*

	*----------------------------------------------*
	* Operations
	*----------------------------------------------*
	
		*- 1) Standardisation of Instructional Processes
			recode sc40q01 (2 = 0) (1 = 1), gen(p1b_1) // no longer included in any index, describes a policy		
			recode sc15q01 (1 = 0) (2 = 0.5) (3 = 1), gen(p1a_1) // wms mgmt
			recode sc15q02 (1 = 0) (2 = 0.5) (3 = 1), gen(p1a_2) // broad mgmt
			recode sc39q10 (1 = 1) (2 = 0), gen(p1a_3) // wms mgmt			
			recode sc40q02 (1 = 1) (2 = 0), gen(p1b_2) // wms mgmt
			recode sc40q03 (1 = 1) (2 = 0), gen(p1b_3) // wms mgmt
			recode sc34q20 (1 = 0) (2 = 0.2) (3 = 0.4) (4 = 0.6) (5 = 0.8) (6 = 1), gen(p1d_1) // wms mgmt
											
		*- 2) Personalization of Instruction and Learning			
			recode sc18q03 (1 = 1) (2 = 0), gen(p2a_1) // broad mgmt
			recode sc15q03 (1 = 1) (2 = 0.5) (3 = 0), gen(p2b_1)  // broad mgmt ---> Felipe: fixed
			recode sc15q04 (1 = 1) (2 = 0.5) (3 = 0), gen(p2b_2) // wms mgmt ---> Felipe: fixed
				
		*- 3) Data-Driven Planning and Student Transitions	
			recode sc18q01 (1 = 1) (2 = 0), gen(p3a_1) // wms mgmt
			recode sc18q02 (1 = 1) (2 = 0), gen(p3a_2) // wms mgmt
			recode sc39q03 (1 = 1) (2 = 0), gen(p3b_1) // wms mgmt
			
		*- 4) Adopting Educational Best Practices			
			recode sc18q07 (1 = 1) (2 = 0), gen(p4a_1) // wms mgmt
			recode sc34q05 (1 = 0) (2 = 0.2) (3 = 0.4) (4 = 0.6) (5 = 0.8) (6 = 1), gen(p4a_2) // wms mgmt
			recode sc34q18 (1 = 0) (2 = 0.2) (3 = 0.4) (4 = 0.6) (5 = 0.8) (6 = 1), gen(p4b_1) // wms mgmt
			recode sc39q08 (1 = 1) (2 = 0), gen(p4b_2) // wms mgmt
			recode sc34q17 (1 = 0) (2 = 0.2) (3 = 0.4) (4 = 0.6) (5 = 0.8) (6 = 1), gen(p4b_3) // wms mgmt
			
	*----------------------------------------------*
	* Monitoring
	*----------------------------------------------* 	
	
		*- 5) Continuous Improvement			
			recode sc34q07 (1 = 0) (2 = 0.2) (3 = 0.4) (4 = 0.6) (5 = 0.8) (6 = 1), gen(p5a_1) // wms mgmt
			recode sc34q11 (1 = 0) (2 = 0.2) (3 = 0.4) (4 = 0.6) (5 = 0.8) (6 = 1), gen(p5c_1) // wms mgmt
			recode sc34q19 (1 = 0) (2 = 0.2) (3 = 0.4) (4 = 0.6) (5 = 0.8) (6 = 1), gen(p5c_2) // wms mgmt
			recode sc34q10 (1 = 0) (2 = 0.2) (3 = 0.4) (4 = 0.6) (5 = 0.8) (6 = 1), gen(p5d_1) // wms mgmt
			recode sc39q05 (1 = 1) (2 = 0), gen(p5c_3) // wms mgmt
			recode sc39q06 (1 = 1) (2 = 0), gen(p5c_4) // broad mgmt
			recode sc39q07 (1 = 1) (2 = 0), gen(p5c_5) // wms mgmt
			recode sc39q09 (1 = 1) (2 = 0), gen(p5c_6) // wms mgmt
			
		*- 7) Performance Review
			recode sc30q01 (1 = 1) (2 = 0), gen(p7a_1) // wms mgmt
			recode sc30q02 (1 = 1) (2 = 0), gen(p7a_2) // wms mgmt
			recode sc30q03 (1 = 1) (2 = 0), gen(p7a_3) // wms mgmt
			recode sc30q04 (1 = 1) (2 = 0), gen(p7a_4) // wms mgmt
			recode sc34q22 (1 = 0) (2 = 0.2) (3 = 0.4) (4 = 0.6) (5 = 0.8) (6 = 1), gen(p7a_5) // wms mgmt

		*- 8) Performance Dialogue		
			recode sc34q12 (1 = 0) (2 = 0.2) (3 = 0.4) (4 = 0.6) (5 = 0.8) (6 = 1), gen(p8a_1) // wms mgmt
			recode sc34q13 (1 = 0) (2 = 0.2) (3 = 0.4) (4 = 0.6) (5 = 0.8) (6 = 1), gen(p8a_2) // wms mgmt
			recode sc34q16 (1 = 0) (2 = 0.2) (3 = 0.4) (4 = 0.6) (5 = 0.8) (6 = 1), gen(p8a_3) // wms mgmt
						
			
	*----------------------------------------------*
	* Targets
	*----------------------------------------------* 
		
		*- 10) Target Balance		
			recode sc18q04 (1 = 1) (2 = 0), gen(p10a_1) // wms mgmt
			recode sc18q05 (1 = 1) (2 = 0), gen(p10a_2) // wms mgmt
			recode sc18q08 (1 = 1) (2 = 0), gen(p10a_3) // wms mgmt
			recode sc34q03 (1 = 0) (2 = 0.2) (3 = 0.4) (4 = 0.6) (5 = 0.8) (6 = 1), gen(p10a_4) // wms mgmt
	
		*- 11) Target Inter-Connection		
			recode sc34q14 (1 = 0) (2 = 0.2) (3 = 0.4) (4 = 0.6) (5 = 0.8) (6 = 1), gen(p11a_1) // wms mgmt
			
		*- 13) Target Stretch		
			recode sc34q02 (1 = 0) (2 = 0.2) (3 = 0.4) (4 = 0.6) (5 = 0.8) (6 = 1), gen(p13a_1) // wms mgmt
			
		*- 14) Clarity and Comparability of Targets		
			
			rename sc34q04 p14a_1		
			rename sc34q08 p14a_2
			rename sc34q15 p14a_3	
			rename sc39q01 p14a_4	
			rename sc39q02 p14a_5
			
			rename sc19q01 p14c_1	
			rename sc19q02 p14c_2	
			
			global p14all "p14a_1 p14a_2 p14a_3 p14a_4 p14a_5 p14c_1 p14c_2"
			
			replace p14a_1 = 0 if p14a_1==1
			replace p14a_1 = 0.2 if p14a_1==2
			replace p14a_1 = 0.4 if p14a_1==3
			replace p14a_1 = 0.6 if p14a_1==4
			replace p14a_1 = 0.8 if p14a_1==5 
			replace p14a_1 = 1 if p14a_1==6
						
			replace p14a_2 = 0 if p14a_2==1
			replace p14a_2 = 0.2 if p14a_2==2
			replace p14a_2 = 0.4 if p14a_2==3
			replace p14a_2 = 0.6 if p14a_2==4
			replace p14a_2 = 0.8 if p14a_2==5 
			replace p14a_2 = 1 if p14a_2==6
							
			replace p14a_3 = 0 if p14a_3==1
			replace p14a_3 = 0.2 if p14a_3==2
			replace p14a_3 = 0.4 if p14a_3==3
			replace p14a_3 = 0.6 if p14a_3==4
			replace p14a_3 = 0.8 if p14a_3==5 
			replace p14a_3 = 1 if p14a_3==6
			di as error "Q14 - `cty', finished assigining values to p14a_3"
						
			egen p14mean=rmean(${p14all})
			di as error "Q14 - `cty', did the p14mean"
			replace p14a_3=p14mean if p14a_3==. & cnt=="NLD"
			drop p14mean
						
			replace p14a_4 = 0 if p14a_4==2
			replace p14a_4 = 1 if p14a_4==1
						
			replace p14a_5 = 0 if p14a_5==2
			replace p14a_5 = 1 if p14a_5==1
						
			replace p14c_1 = 0 if p14c_1==2
			replace p14c_1 = 1 if p14c_1==1
							
			replace p14c_2 = 0 if p14c_2==2
			replace p14c_2 = 1 if p14c_2==1	
			
				
		
	*----------------------------------------------*
	* People
	*----------------------------------------------*  
		
		*- 15) Rewarding High Performers			
			recode sc18q06 (1 = 1) (2 = 0), gen(p15a_1) // wms mgmt
			recode sc31q01 (1 = 0) (2 = 0.33) (3 = 0.66) (4 = 1), gen(p15b_1) // wms mgmt
			recode sc31q02 (1 = 0) (2 = 0.33) (3 = 0.66) (4 = 1), gen(p15b_2) // wms mgmt
			recode sc31q05 (1 = 0) (2 = 0.33) (3 = 0.66) (4 = 1), gen(p15b_3) // wms mgmt
			recode sc34q06 (1 = 0) (2 = 0.2) (3 = 0.4) (4 = 0.6) (5 = 0.8) (6 = 1), gen(p15b_4) // wms mgmt

		*- 17) Promoting High Performers		
			recode sc31q03 (1 = 0) (2 = 0.33) (3 = 0.66) (4 = 1), gen(p17b_1) // wms mgmt
			recode sc31q04 (1 = 0) (2 = 0.33) (3 = 0.66) (4 = 1), gen(p17d_1) // wms mgmt
			recode sc31q06 (1 = 0) (2 = 0.33) (3 = 0.66) (4 = 1), gen(p17c_1) // wms mgmt
			recode sc31q07 (1 = 0) (2 = 0.33) (3 = 0.66) (4 = 1), gen(p17c_2) // wms mgmt

		*- 20) Attracting Talent/ Creating a Distinctive Employee Value Proposition		
			recode sc34q01 (1 = 0) (2 = 0.2) (3 = 0.4) (4 = 0.6) (5 = 0.8) (6 = 1), gen(p20b_1) // wms mgmt
			gen p20b_2 = 0 if sc35q01==0
			replace p20b_2 = 0.25 if sc35q01>0 & sc35q01<=25
			replace p20b_2 = 0.5 if sc35q01>25 & sc35q01<=50
			replace p20b_2 = 0.75 if sc35q01>50 & sc35q01<=75
			replace p20b_2 = 1 if sc35q01>75 & sc35q01!=.
				
			gen p20b_3 = 0 if sc35q02==0
			replace p20b_3 = 0.25 if sc35q02>0 & sc35q02<=25
			replace p20b_3 = 0.5 if sc35q02>25 & sc35q02<=50
			replace p20b_3 = 0.75 if sc35q02>50 & sc35q02<=75
			replace p20b_3 = 1 if sc35q02>75 & sc35q02!=.
		
		
		* Global for all variables that were created above (they start with a p followed by a number)
	
		* Loop through all variables  starting with "p" followed by a number in the dataset 
		local all_practices

		foreach var of varlist p* {
		    * Checking if the variable name matches "p" followed by a number
		    if regexm("`var'", "p[0-9]+") {
			* If it matches, add it to the local macro
			local all_practices `all_practices' `var'
		    }
		}
		global all_practices `all_practices'
		display "`all_practices'"

*--------------------------------------------------*
* Intermediate outcomes: 
*--------------------------------------------------*
	
* Teacher shortages
		
	rename sc14q01 ts_1
	rename sc14q02 ts_2
	rename sc14q03 ts_3
	rename sc14q04 ts_4
	
*- Teacher motivation
		
	rename sc22q13 tm_1
	rename sc22q14 tm_2
	rename sc25q02 tm_3
	rename sc25q04 tm_4
	rename sc26q01 tm_5
	rename sc26q02 tm_6
	rename sc26q03 tm_7
	rename sc26q04 tm_8
	rename sc27q01 tm_9
	rename sc27q02 tm_10
	rename sc28q01 tm_11
	rename sc28q02 tm_12
	rename sc29q01 tm_13
	rename sc29q02 tm_14

	foreach var in tm_1 tm_2 tm_5 tm_6 tm_7 tm_8 tm_9 tm_10 tm_11 tm_12 tm_13 tm_14 {
		recode `var' (1 = 4) (2 = 3) (3 = 2) (4 = 1)		
	}
			
* Teacher effort
		
	rename sc22q11 te_1
	rename sc22q15 te_2
	rename sc22q17 te_3
	rename sc22q18 te_4

	foreach var in te_1 te_2 te_3 te_4 {
		recode `var' (1 = 4) (2 = 3) (3 = 2) (4 = 1)		
	}
		
* Student attention

	rename sc22q01 sa_1
	rename sc22q02 sa_2
	rename sc22q03 sa_3
	rename sc22q04 sa_4
	rename sc22q05 sa_5
	rename sc22q06 sa_6
	rename sc22q08 sa_7
	rename sc22q10 sa_8
	
	foreach var in sa_1 sa_2 sa_3 sa_4 sa_5 sa_6 sa_7 sa_8 {
		recode `var' (1 = 4) (2 = 3) (3 = 2) (4 = 1)		
	}
	
* Parent effort
	
	recode sc24q01 (1 = 3) (2 = 2) (3 = 1), gen(pe_1)
	rename sc25q01 pe_2
	rename sc25q03 pe_3
	rename sc25q05 pe_4
	rename sc25q06 pe_5
	rename sc25q07 pe_6
	rename sc25q08 pe_7
	rename sc25q09 pe_8
	rename sc25q10 pe_9
	rename sc25q11 pe_10
	rename sc25q12 pe_11
		
	egen pe_mean=rmean(pe_1 pe_2 pe_3 pe_4 pe_5 pe_6 pe_7 pe_8 pe_9 pe_10 pe_11)
	
	* Replacing variables entirely missing from some countries so we keep the country
	replace pe_7=pe_mean if (cnt=="GRC" | cnt=="HRV" | cnt=="ITA" ) & pe_7==.
	replace pe_11=pe_mean if (cnt=="MNE"|cnt=="CZE"| cnt=="HRV" | cnt=="ITA" | cnt=="JPN" | cnt=="POL") & pe_11==.
	drop pe_mean
		
		
		
*----------------------------------------------*
* Policy questions 
*----------------------------------------------*  			

	* Recoding will always be yes or no (policy/ no policy)
	recode sc13q01 (1 = 0) (2 = 1) (3 = 1) (4 = 1) (5 = 1), gen(policy01) // <10%, 10-25%, 26-50%, 51-75%, >75%
	recode sc13q02 (1 = 0) (2 = 1) (3 = 1) (4 = 1) (5 = 1), gen(policy02) // <10%, 10-25%, 26-50%, 51-75%, >75%
	recode sc13q03 (1 = 0) (2 = 1) (3 = 1) (4 = 1) (5 = 1), gen(policy03) // <10%, 10-25%, 26-50%, 51-75%, >75%
	
	recode sc20q01 (2 = 0) (1 = 1), gen(policy04) // yes/no
	
	recode sc32q01 (1 = 0) (2 = 1) (3 = 1), gen(policy05) // never, sometimes, always
	recode sc32q03 (1 = 0) (2 = 1) (3 = 1), gen(policy06) // never, sometimes, always
	recode sc32q04 (1 = 0) (2 = 1) (3 = 1), gen(policy07) // never, sometimes, always
	recode sc32q05 (1 = 0) (2 = 1) (3 = 1), gen(policy08) // never, sometimes, always
	recode sc32q06 (1 = 0) (2 = 1) (3 = 1), gen(policy09) // never, sometimes, always
	recode sc32q07 (1 = 0) (2 = 1) (3 = 1), gen(policy10) // never, sometimes, always
	recode sc32q08 (1 = 0) (2 = 1) (3 = 1), gen(policy11) // never, sometimes, always
	
	*recode sc39q01 (2 = 0) (1 = 1), gen(policy12) // yes/no
	*recode sc39q02 (2 = 0) (1 = 1), gen(policy13) // yes/no
	gen policy12 = p14a_4
	gen policy13 = p14a_5
	
	recode sc40q01 (2 = 0) (1 = 1), gen(policy14) // yes/no
		
	global policy  "policy01 policy02 policy03 policy04 policy05 policy06 policy07 policy08 policy09 policy10 policy11 policy12 policy13 policy14" 
					

*----------------------------------------------*
* Autonomy questions (sc33q01a-sc33q12e)
*----------------------------------------------*  			
	
	* Defining ordered list of autonomy variables
	local aut_vars sc33q01a sc33q01b sc33q01c sc33q01d sc33q01e ///
	sc33q02a sc33q02b sc33q02c sc33q02d sc33q02e sc33q03a sc33q03b sc33q03c sc33q03d sc33q03e ///
	sc33q04a sc33q04b sc33q04c sc33q04d sc33q04e sc33q05a sc33q05b sc33q05c sc33q05d sc33q05e ///
	sc33q06a sc33q06b sc33q06c sc33q06d sc33q06e sc33q07a sc33q07b sc33q07c sc33q07d sc33q07e ///
	sc33q08a sc33q08b sc33q08c sc33q08d sc33q08e sc33q09a sc33q09b sc33q09c sc33q09d sc33q09e ///
	sc33q10a sc33q10b sc33q10c sc33q10d sc33q10e sc33q11a sc33q11b sc33q11c sc33q11d sc33q11e ///
	sc33q12a sc33q12b sc33q12c sc33q12d sc33q12e

	* Iterating through list, recoding as 1 or 0 and creating aut_1 to aut_60
	local i = 1
	foreach var of local aut_vars {
		recode `var' (2 = 0) (1 = 1), gen(aut_`i')
		local ++i
	}	

	global autonomy "aut_1 aut_2 aut_3 aut_4 aut_5 aut_6 aut_7 aut_8 aut_9 aut_10 aut_11 aut_12 aut_13 aut_14 aut_15 aut_16 aut_17 aut_18 aut_19 aut_20 aut_21 aut_22 aut_23 aut_24 aut_25 aut_26 aut_27 aut_28 aut_29 aut_30 aut_31 aut_32 aut_33 aut_34 aut_35 aut_36 aut_37 aut_38 aut_39 aut_40 aut_41 aut_42 aut_43 aut_44 aut_45 aut_46 aut_47 aut_48 aut_49 aut_50 aut_51 aut_52 aut_53 aut_54 aut_55 aut_56 aut_57 aut_58 aut_59 aut_60"
						
		
	compress
	keep ${ids} ${scc} ${stu} ${sch} ${outcomes} ${pv_efactors} ${efactors} ${practices} ${practices_wms} ${practices_broad} ${boutcomes} ${policy} ${autonomy}
	

save "cleaning/tempdata/PISA2012_intermediate.dta", replace


*use "cleaning/tempdata/PISA2012_intermediate.dta", clear


*-----------------------------------------*
* BUILD SCHOOL-LEVEL SCORES
*-----------------------------------------*

* Computing scores using pv
tempfile pisa2012_full school_scores
tempname score_post
save `pisa2012_full', replace

keep cnt uschool_id pv*math pv*read pv*scie w_fstuwt w_fstr*

* Number of students per school taking the test
egen stu_scho = count(pv1math), by(uschool_id)

qui levelsof uschool_id, local(schools)

postfile `score_post' str3 cnt str20 uschool_id double math reading science stu_scho using `school_scores', replace

* Building student test scores from plausible values
foreach sc of local schools {
	display as red "`sc'"
	
	preserve
	keep if uschool_id=="`sc'"
	local school_cnt = cnt[1]
	qui su stu_scho
	local test = r(mean)
	
	if `test'>1 {
		
		* Math
		pv, pv(pv*math) weight(w_fstuwt) brr rw(w_fstr*) fays(0.5): reg @pv [aw=@w]
		matrix T = r(table)
		local math_score = T[1,1]
			
		* Reading
		pv, pv(pv*read) weight(w_fstuwt) brr rw(w_fstr*) fays(0.5): reg @pv [aw=@w]
		matrix T = r(table)
		local reading_score = T[1,1]
				
		* Science
		pv, pv(pv*scie) weight(w_fstuwt) brr rw(w_fstr*) fays(0.5): reg @pv [aw=@w]
		matrix T = r(table)
		local science_score = T[1,1]
		}
		
	else {
		* Math
		pv, pv(pv*math) weight(w_fstuwt) brr rw(w_fstr*) fays(0.5): mean @pv [aw=@w]
		matrix T = r(table)
		local math_score = T[1,1]
		
		* Reading
		pv, pv(pv*read) weight(w_fstuwt) brr rw(w_fstr*) fays(0.5): mean @pv [aw=@w]
		matrix T = r(table)
		local reading_score = T[1,1]
				
		* Science
		pv, pv(pv*scie) weight(w_fstuwt) brr rw(w_fstr*) fays(0.5): mean @pv [aw=@w]
		matrix T = r(table)
		local science_score = T[1,1]
	}
	
	post `score_post' ("`school_cnt'") ("`sc'") (`math_score') (`reading_score') (`science_score') (`test')
	restore
	}
	
postclose `score_post'

use `pisa2012_full', clear
merge m:1 cnt uschool_id using `school_scores', nogen 
		
	
* Saving
compress
note: This dataset is at student level
save "cleaning/tempdata/PISA2012_temp.dta", replace	


	
*------------------------------------------------------------*
* CREATING MANAGEMENT INDICES (and Intermediate outcomes indices)
*------------------------------------------------------------*

use "cleaning/tempdata/PISA2012_temp.dta", clear	

* Here, the code will first loop through the types of indexes that we have, creating means and the index for each one, according to the globals defined at a_pisa0_globals.do. Then, it will loop through countries. In the end, it compiles all country datsets into one. 

* Looping through countries and collapsing at school-level to build country specific management indices
levelsof cnt, local(cty)
foreach c of local cty {
	
	preserve
	
		display "`c'"
		keep if cnt=="`c'"

		* Collapse dataset at school level
		collapse ${practices_broad} ${boutcomes} ${policy} ${autonomy} [w=stu_fac], by(uschool_id cnt) 
		compress

		* Determining the final sample based on number of questions missing
		egen miss = rowmiss(${practices_broad})
		* tab miss 
		drop if miss > 1  // allowing school to only have one missing column in the index
		
		*-----------------------------------------*
		* Intermediate outcomes indices
		*-----------------------------------------*
		
		* Standardizing every intermediate outcomes
		foreach var of global boutcomes {
			egen `var'_z = std(`var') 
		}	

		* Intermediate outcomes indices
		egen wts_wms = rowmean(${ts_z})
		egen wtm_wms = rowmean(${tm_z})
		egen wte_wms = rowmean(${te_z})
		egen whh_wms = rowmean(${sa_z} ${pe_z})
			
		* Defining indicesindices to be made
		global indices "wms broad common"

		foreach i of global indices {
			

			*-----------------------------------------*
			* BUILDING MANAGEMENT INDICES: PREFERRED
			*-----------------------------------------*
			
			*--------- By practice (making every practice have the same weight, by taking first the mean of the questions by practice)

			dis "Step 1P: build practices"
			
			* If `i' is wms or broad
			if inlist("`i'", "wms", "broad") {
				egen p1_`i' = rmean(${p1_`i'})
				egen p2_`i' = rmean(${p2_`i'})
				egen p3_`i' = rmean(${p3_`i'})
				egen p4_`i' = rmean(${p4_`i'})
				egen p5_`i' = rmean(${p5_`i'})
				egen p7_`i' = rmean(${p7_`i'})
				egen p8_`i' = rmean(${p8_`i'})
				egen p10_`i' = rmean(${p10_`i'})
				egen p11_`i' = rmean(${p11_`i'})
				egen p13_`i' = rmean(${p13_`i'})
				egen p14_`i' = rmean(${p14_`i'})
				egen p15_`i' = rmean(${p15_`i'})
				egen p17_`i' = rmean(${p17_`i'})
				egen p20_`i' = rmean(${p20_`i'})
			
				dis "Step 2P: standardize the practices"
				global pracs_`i' "p1_`i' p2_`i' p3_`i' p4_`i' p5_`i' p7_`i' p8_`i' p10_`i' p11_`i' p13_`i' p14_`i' p15_`i' p17_`i' p20_`i'"	

				foreach var of global pracs_`i' {
					egen z`var' = std(`var') 
				}
				
				global zpracs_`i' "zp1_`i' zp2_`i' zp3_`i' zp4_`i' zp5_`i' zp7_`i' zp8_`i' zp10_`i' zp11_`i' zp13_`i' zp14_`i' zp15_`i' zp17_`i' zp20_`i'"
			} 
			else{ // else (`i' is common)
				egen p1_`i' = rmean(${p1_`i'})
				egen p2_`i' = rmean(${p2_`i'})
				egen p3_`i' = rmean(${p3_`i'})
				egen p4_`i' = rmean(${p4_`i'})
				egen p5_`i' = rmean(${p5_`i'})
				egen p10_`i' = rmean(${p10_`i'})
				egen p15_`i' = rmean(${p15_`i'})
				egen p17_`i' = rmean(${p17_`i'})
				egen p20_`i' = rmean(${p20_`i'})
			
				dis "Step 2P: standardize the practices"
				global pracs_`i' "p1_`i' p2_`i' p3_`i' p4_`i' p5_`i' p10_`i' p15_`i' p17_`i' p20_`i'"	

				foreach var of global pracs_`i' {
					egen z`var' = std(`var') 
				}
				
				global zpracs_`i' "zp1_`i' zp2_`i' zp3_`i' zp4_`i' zp5_`i' zp10_`i' zp15_`i' zp17_`i' zp20_`i'"
			}
					
			dis "Step 3P: average the standardized practices" 
			egen mgmt_`i'_practices = rmean(${zpracs_`i'}) 
			la var mgmt_`i'_practices "Mgmt `i' index, avg of standardized practices"

			dis "Step 4P: standardize the averages WITHIN countries" 
			egen zmgmt_`i'_practices = std(mgmt_`i'_practices)
			la var zmgmt_`i'_practices "Mgmt `i' index, standardized within countries"	

		}
			
		
		*-----------------------------------------*
		* BUILDING EQUAL WEIGHTS WMS INDEX
		*-----------------------------------------*

		foreach var of global practices_wms {
			cap drop z`var'
			egen z`var' = std(`var') 
		}
				
		egen mgmt_wms_equalweight = rmean(${zpractices_wms}) 
		la var mgmt_wms_equalweight "Mgmt wms equal weights index, avg of standardized questions"

		egen zmgmt_wms_equalweight = std(mgmt_wms_equalweight)
		la var zmgmt_wms_equalweight "Mgmt wms equal weights index, standardized within countries"
		
		*-----------------------------------------*
		* BUILDING MANAGEMENT WMS + AUTONOMY INDEX
		*-----------------------------------------*
		
		egen auto_pract = rmean(${autonomy})
		egen zauto_pract = std(auto_pract) 
	 
		egen mgmt_wms_autonomy = rmean(${zpracs_wms} zauto_pract) 
		la var mgmt_wms_autonomy "Mgmt wms + autonomy index, avg of standardized practices"

		egen zmgmt_wms_autonomy = std(mgmt_wms_autonomy)
		la var zmgmt_wms_autonomy "Mgmt wms + autonomy index, standardized within countries"

	
		*-----------------------------------------*
		* BUILDING WMS + POLICY INDEX
		*-----------------------------------------*
		
		egen policy_pract = rmean(${policy})
		egen zpolicy_pract = std(policy_pract) 
	 
		egen mgmt_wms_policy = rmean(${zpracs_wms} zpolicy_pract) 
		la var mgmt_wms_policy "Mgmt wms + policy index, avg of standardized practices"

		egen zmgmt_wms_policy = std(mgmt_wms_policy)
		la var zmgmt_wms_policy "Mgmt wms + policy index, standardized within countries"
		

		*-----------------------------------------*
		* ANDERSON APPROACH -- USING WMS PRACTICES
		*-----------------------------------------*	
		
		* Making Anderson (2008) using icw_index package
		icw_index $zpracs_wms, generate(zmgmt_wms_and)
		label var zmgmt_wms_and "Mgmt Anderson (2008) Index"
		
			
		*-----------------------------------------*
		* PCA -- USING WMS PRACTICES
		*-----------------------------------------*
		pca $zpracs_wms
		predict pc1, score
		rename pc1 zmgmt_wms_pca
		label var zmgmt_wms_pca "Mgmt PCA index"


		*-----------------------------------------*
		* EXPLORATORY FACTOR ANALYSIS -- 6 FACTORS 
		*-----------------------------------------*		
		
		* These countries are missing many autonomy variables and thus dropping out of the analysis
		* So we exclude autonomy from their inclusive indices
		if "`c'"=="ARG" | "`c'"=="DEU" | "`c'"=="HKG" | "`c'"=="NZL" | "`c'"=="SGP"{
			
			** checking factors
			factor $practices_broad $policy, pf factors(6)
			rotate, varimax
			est store rotated

			*screeplot
		
			pca $practices_broad $policy, components(6) 
			predict efa_f1 efa_f2 efa_f3 efa_f4 efa_f5 efa_f6 , score

			label var efa_f1 "EFA index factor 1"
			label var efa_f2 "EFA index factor 2"
			label var efa_f3 "EFA index factor 3"
			label var efa_f4 "EFA index factor 4"
			label var efa_f5 "EFA index factor 5"
			label var efa_f6 "EFA index factor 6"		
		} 
		else {
			** checking factors
			factor $practices_broad $autonomy $policy, pf factors(6)
			rotate, varimax
			est store rotated

			*screeplot
			
			pca $practices_broad $autonomy $policy, components(6) 
			predict efa_f1 efa_f2 efa_f3 efa_f4 efa_f5 efa_f6 , score

			label var efa_f1 "EFA index factor 1"
			label var efa_f2 "EFA index factor 2"
			label var efa_f3 "EFA index factor 3"
			label var efa_f4 "EFA index factor 4"
			label var efa_f5 "EFA index factor 5"
			label var efa_f6 "EFA index factor 6"	
		}

		* Saving
		save "cleaning/tempdata/PISA2012_`c'_sch_mgmt.dta", replace
	restore
}
		
* Appending all the country datasets together
clear 
foreach c of global pisacty {
	append using "cleaning/tempdata/PISA2012_`c'_sch_mgmt.dta"
	erase "cleaning/tempdata/PISA2012_`c'_sch_mgmt.dta"
}
	
* Keeping only necessary variables
keep uschool_id cnt mgmt_* zmgmt_* efa_* wts_wms wtm_wms wte_wms whh_wms
		
* Calculating the standardized WMS index across all countries of PISA 2012
foreach index of varlist mgmt_* zmgmt_wms_and zmgmt_wms_pca wts_wms wtm_wms wte_wms whh_wms {
    egen `index'_std = std(`index')
}

sort uschool_id	


save "cleaning/tempdata/PISA2012_indices.dta", replace 

*------------------------------------------------------------------*
* MERGING STUDENT LEVEL DATASET WITH WMS INDEX AND BEHAVIOUR INDICES
*------------------------------------------------------------------*

merge 1:m uschool_id using "cleaning/tempdata/PISA2012_temp.dta"

/*
    Result                      Number of obs
    -----------------------------------------
    Not matched                        68,912 /// Schools that have too many missings, so indices are not calculated for them
        from master                         0  
        from using                     68,912  

    Matched                           411,262  
    -----------------------------------------
*/

keep if _merge == 3 // keeping only schools with indices
drop _merge

* Numerical variable for country
egen c = group(cnt)

* We need variable schoolid to exist for using repest command
gen schoolid = substr(uschool_id, 4, .)

* Control variables
tab stu_immi, generate(stu_immi)
tab schloc, generate(schloc)

* creating variables for missing observations
forvalues i=1/5 {
	replace schloc`i' = 0 if schloc`i' == .
}
replace schloc = 99 if schloc == .
generate schloc_m = (schloc == 99)

forvalues i=1/3 {
	replace stu_immi`i' = 0 if stu_immi`i' == .
}
replace stu_immi = 99 if stu_immi == .
generate stu_immi_m = (stu_immi == 99)

foreach var in stratio lstu compweb govfund grade escs {
	generate `var'_m = (`var' == .)
	label var `var'_m "`var'==missing"
	gen `var'_imp = `var'
	replace `var'_imp = 99 if `var' == .	
}

compress
sort uschool_id

save "analysis/data/PISA2012_analysis.dta", replace










*------------------------------------------------------------*
* EXTRA: Creating indices fir Leave-one-out (LOO) analysis
*------------------------------------------------------------*

* Opening student-leve dataset
use "cleaning/tempdata/PISA2012_temp.dta", clear	

* Looping through countries and collapsing at school-level to build country specific management indices
levelsof cnt, local(cty)
foreach c of local cty {

	preserve
	
		display "`c'"
		keep if cnt=="`c'"

		* Collapse dataset at school level
		collapse ${practices_broad} ${boutcomes} ${policy} ${autonomy} [w=stu_fac], by(uschool_id cnt) 
		compress

		* Determining the final sample based on number of questions missing
		egen miss = rowmiss(${practices_broad})
		drop if miss > 1 
	
		*-----------------------------------------*
		* BUILDING MANAGEMENT INDICES
		*-----------------------------------------*
		
		*--------- By practice (making every practice have the same weight, by taking first the mean of the questions by practice)
		
		egen p1_wms = rmean(${p1_wms})
		egen p2_wms = rmean(${p2_wms})
		egen p3_wms = rmean(${p3_wms})
		egen p4_wms = rmean(${p4_wms})
		egen p5_wms = rmean(${p5_wms})
		egen p7_wms = rmean(${p7_wms})
		egen p8_wms = rmean(${p8_wms})
		egen p10_wms = rmean(${p10_wms})
		egen p11_wms = rmean(${p11_wms})
		egen p13_wms = rmean(${p13_wms})
		egen p14_wms = rmean(${p14_wms})
		egen p15_wms = rmean(${p15_wms})
		egen p17_wms = rmean(${p17_wms})
		egen p20_wms = rmean(${p20_wms})
	
		dis "Step 2P: standardize the practices"
		global pracs_wms "p1_wms p2_wms p3_wms p4_wms p5_wms p7_wms p8_wms p10_wms p11_wms p13_wms p14_wms p15_wms p17_wms p20_wms"	

		foreach var of global pracs_wms {
			egen z`var' = std(`var') 
		}
		
		global zpracs_wms "zp1_wms zp2_wms zp3_wms zp4_wms zp5_wms zp7_wms zp8_wms zp10_wms zp11_wms zp13_wms zp14_wms zp15_wms zp17_wms zp20_wms"
	 			
		dis "Step 3P: average the standardized practices" 
		egen mgmt_wms_practices = rmean(${zpracs_wms}) 
		la var mgmt_wms_practices "Mgmt `i' index, avg of standardized practices"

		dis "Step 4P: standardize the averages WITHIN countries" 
		egen zmgmt_wms_practices = std(mgmt_wms_practices)
		la var zmgmt_wms_practices "Mgmt `i' index, standardized within countries"
			
			
		*-----------------------------------------*
		* NEW: BUILDING LEAVE-ONE-PRACTICE-OUT (LOPO) INDICES
		*-----------------------------------------*
		dis "Step 5P: build Leave-One-Practice-Out indices"

		// First, copy the GLOBAL list of z-practices into a LOCAL macro
		local zpracs_wms_local "${zpracs_wms}"
		
		// Looping over the *base* practice mean names (p1_wms, p2_wms, etc.)
		foreach p_to_leave_out of global pracs_wms {
			
			// Identifying the standardized practice name to leave out (e.g., "zp1_wms")
			local z_to_leave_out "z`p_to_leave_out'"
			
			// Creating a new list of z-practices that *excludes* the one to be left out
			// Using macro list subtraction on the *local* copy
			local zpracs_loo : list zpracs_wms_local - z_to_leave_out
			
			// Step 3P (LOO version): averaging the *remaining* standardized practices
			egen mgmt_wms_loo_`p_to_leave_out' = rmean(`zpracs_loo')
		
			// Adding a label
			la var mgmt_wms_loo_`p_to_leave_out' "Mgmt (main), LOO `p_to_leave_out'"
		}

		* Saving
		save "cleaning/tempdata/PISA2012_`c'_sch_mgmt_LOO.dta", replace
	restore
}
		
* Appending all the country datasets together
clear 
foreach c of global pisacty {
	append using "cleaning/tempdata/PISA2012_`c'_sch_mgmt_LOO.dta"
	erase "cleaning/tempdata/PISA2012_`c'_sch_mgmt_LOO.dta"
}
	
* Keeping only necessary variables
keep uschool_id cnt mgmt_*
		
* Calculating the standardized WMS index within across all countries of PISA 2012
foreach index of varlist mgmt_* {
    egen `index'_std = std(`index')
}

sort uschool_id	

*------------------------------------------------------------------*
* MERGING STUDENT LEVEL DATASET WITH WMS INDEX AND BEHAVIOUR INDICES
*------------------------------------------------------------------*

merge 1:m uschool_id using "cleaning/tempdata/PISA2012_temp.dta"


keep if _merge == 3 // keeping only schools with indices
drop _merge

* Numerical variable for country
egen c = group(cnt)

* We need variable schoolid to exist for using repest command
gen schoolid = substr(uschool_id, 4, .)

* Control variables
tab stu_immi, generate(stu_immi)
tab schloc, generate(schloc)

* creating variables for missing observations
forvalues i=1/5 {
	replace schloc`i' = 0 if schloc`i' == .
}
replace schloc = 99 if schloc == .
generate schloc_m = (schloc == 99)

forvalues i=1/3 {
	replace stu_immi`i' = 0 if stu_immi`i' == .
}
replace stu_immi = 99 if stu_immi == .
generate stu_immi_m = (stu_immi == 99)

foreach var in stratio lstu compweb govfund grade escs {
	generate `var'_m = (`var' == .)
	label var `var'_m "`var'==missing"
	gen `var'_imp = `var'
	replace `var'_imp = 99 if `var' == .	
}

compress
sort uschool_id

* Saving
save "analysis/data/PISA2012_LOO.dta", replace







	
