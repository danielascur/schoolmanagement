// Purpose: to transform data from PISA 2022 questionnaires from .sas to .dta files

* Set environment

clear all

* Running PISA globals
do "cleaning/aux_pisa0_globals.do"

*-----------------------------------------*
* JOIN ALL DATA SETS AT STUDENT-LEVEL
*-----------------------------------------*

/// student questionnaire

* Unzipping the file and extract the .sas7bdat file to the temp directory
local zipfile "input/PISA2022/STU_QQQ_SAS.zip"

* Extracting the sas7bdat file
unzipfile `zipfile', replace

* Moving the extracted file to the temp directory
copy "CY08MSP_STU_QQQ.SAS7BDAT" "cleaning/tempdata/student.sas7bdat", replace

* Deleting extracted files from the current directory
erase "CY08MSP_STU_QQQ.SAS7BDAT" 
erase "CY08MSP_STU_QQQ.FORMAT.SAS"


import sas "cleaning/tempdata/student.sas7bdat", clear
save "cleaning/tempdata/student.dta", replace




/// teachers

* Unzipping the file and extract the .sas7bdat file to the temp directory
local zipfile "input/PISA2022/TCH_QQQ_SAS.zip"

* Extracting the sas7bdat file
unzipfile `zipfile', replace

* Moving the extracted file to the temp directory
copy "CY08MSP_TCH_QQQ.SAS7BDAT" "cleaning/tempdata/teacher.sas7bdat", replace

* Deleting extracted files from the current directory
erase "CY08MSP_TCH_QQQ.SAS7BDAT" 
erase "CY08MSP_TCH_QQQ.FORMAT.SAS"

import sas "cleaning/tempdata/teacher.sas7bdat", clear
save "cleaning/tempdata/teacher.dta", replace





/// school

* Unzipping the file and extract the .sas7bdat file to the temp directory
local zipfile "input/PISA2022/SCH_QQQ_SAS.zip"

* Extracting the sas7bdat file
unzipfile `zipfile', replace

* Moving the extracted file to the temp directory
copy "CY08MSP_SCH_QQQ.SAS7BDAT" "cleaning/tempdata/school.sas7bdat", replace

* Deleting extracted files from the current directory
erase "CY08MSP_SCH_QQQ.SAS7BDAT" 
erase "CY08MSP_SCH_QQQ.FORMAT.SAS"

import sas "cleaning/tempdata/school.sas7bdat", clear
save "cleaning/tempdata/school.dta", replace



		
*-----------------------------------------*
* JOIN ALL DATA SETS AT STUDENT-LEVEL
*-----------------------------------------*

* Start with student-level data
use "cleaning/tempdata/student.dta", clear
		
* Merge with school level data
merge m:1 CNT NatCen CNTSCHID using "cleaning/tempdata/school.dta", nogen keep(master match)  
	
compress
note: This dataset is at student level
save "cleaning/tempdata/PISA2022.dta", replace

*-----------------------------------------*
* CLEAN STUDENT-LEVEL DATA SET
*-----------------------------------------*

	
* Create year

g year=2022

* Dropping countries without possible values
drop if PV1MATH==.


* Creating school ID unique across countries
tostring CNTSCHID, gen(school_id)
gen uschool_id = CNT + school_id 
drop school_id

* Organize country variable 
	
	g wmscty=(CNT=="BRA" | CNT=="COL" | CNT=="MEX" | CNT=="USA" | CNT=="GBR" | CNT=="CAN" | CNT=="SWE" | CNT=="ITA"| CNT=="DEU")
	label var wmscty "Country included in WMS"
	
* Organize student-level characteristics

	g stu_female = 1 if ST004D01T==1
	replace stu_female=0 if ST004D01T==2
	
	rename IMMIG stu_immi // 1 = native ; 2 = 2nd gen ; 3 = first gen
	
	rename AGE stu_age
	
* Organize school-level characteristics

* Obs.: naming conventions will be set following the relation at:
* https://docs.google.com/spreadsheets/d/15MN21kLA0QopiEEmRx51zRcwTFN5RcKV0-IXXN4xUR4/edit#gid=1150021952

	g schloc = SC001Q01TA
	
	egen students = rsum(SC002Q01TA SC002Q02TA), missing // boys + girls
	g lstu = ln(students)
	
	rename SC016Q01TA govfund
	
	g private = 1 if SC013Q01TA==2
	replace private = 0 if SC013Q01TA==1
	la def private 0 "public" 1 "private"
	la val private private

			
	g rural=. 
	replace rural=1 if SC001Q01TA==1 | SC001Q01TA==2 | SC001Q01TA==3
	replace rural=0 if SC001Q01TA==4 | SC001Q01TA==5
	la def rural 0 "urban" 1 "rural"
	la val rural rural
	
	* New interesteing question re: natural disasters
	g natdisaster = 1 if ST261Q11JA==1 
	replace natdisaster=0 if ST261Q11JA==2 
	
	
* Expansion factors, school ids

* for those two below, the variable equivalent that we have in 2022 is SENWT but which seems to be equal for both student and school (besides summing up to a different value, which I guess shouldn't be much of a trouble)
* Nevertheless, initially it doesn't seem that we use those variables
// 		rename SENWGT_STU stu_fac		
// 		rename SENWGT_SCQ pri_fac
	rename SENWT stu_pri_fac
	
	* new one
	rename CNTSTUID stu_id 
	rename GRADE grade
	rename ESCS escs
	rename STRATIO stratio
	rename CNT cnt





*--------------------------------------------------*
* Encoding Management variables
*--------------------------------------------------*

	*----------------------------------------------*
	* Operations
	*----------------------------------------------*

*- 1) Standardisation of Instructional Processes

	di as error "Q1 - `cty'"

	recode SC187Q01WA (1 = 0) (2 = 0.5) (3 = 1), gen(p1a_1)
	
	* Similar question to 2012, but 2012 was yes/no, this has an additional point
	recode SC037Q11JA (3 = 0) (1 = 0.5) (2 = 1), gen(p1a_3) // 3= no, doesn't exist; 1= yes, mandatory; 2= yes, school initiative

	recode SC189Q03WA (2 = 0) (1 = 1), gen(p1b_2)
	recode SC189Q04WA (2 = 0) (1 = 1), gen(p1b_3)
		
*- 2) Personalization of Instruction and Learning

	di as error "Q2 - `cty'"
	
	recode SC187Q03WA (3 = 0) (2 = 0.5) (1 = 1), gen(p2_br_0) // p2b_1 no longer part of the WMS index, so change the name to broad
	recode SC035Q04TA  (2=0) (1=1), gen(p2_br_1) 
	recode SC035Q04TB  (2=0) (1=1), gen(p2_br_2) 
	recode SC187Q04WA (3 = 0) (2 = 0.5) (1 = 1), gen(p2b_2)


*- 3) Data-Driven Planning and Student Transitions

	di as error "Q3 - `cty'"

	recode SC035Q02TA (2 = 0) (1 = 1), gen(p3a_1)
	recode SC035Q02TB (2 = 0) (1 = 1), gen(p3a_1_td) // new 2022, teacher-developed
	recode SC035Q03TA (2 = 0) (1 = 1), gen(p3a_2)
	recode SC035Q03TB (2 = 0) (1 = 1), gen(p3a_2_td) // new 2022, teacher-developed
	recode SC037Q05NA (3 = 0) (1 = 0.5) (2 = 1), gen(p3b_1) // Similar question to 2012, but 2012 was yes/no, this has an additional point (3= no, doesn't exist;1 = yes, mandatory; 2= yes, school initiative)
	recode SC037Q06NA (3 = 0) (1 = 0.5) (2 = 1),gen(p3b_2) // additional question in 2022, broken up from 2012 (in 2012 p3b_1 and p3b_2 were the same question) -- (3= no, doesn't exist;1 = yes, mandatory; 2= yes, school initiative)
	
	* Variables with means (if you want to use alternative specification)
	egen p3a_1_mean = rmean(p3a_1 p3a_1_td)
	egen p3a_2_mean = rmean(p3a_2 p3a_2_td)

	
*- 4) Adopting Educational Best Practices

	* teacher-developed -- ADDITIONAL QUESTIONS IN 2022
	recode SC035Q08TA (2 = 0) (1 = 1), gen(p4a_1)
	recode SC035Q08TB (2 = 0) (1 = 1), gen(p4a_1_td)
	recode SC037Q08TA (3 = 0) (1 = 0.5) (2 = 1), gen(p4b_2)	// Similar question to 2012, but 2012 was yes/no, this has an additional point
	
	* Variables with means (if you want to use alternative specification)
	egen p4a_1_mean = rmean(p4a_1 p4a_1_td)
	
	
*----------------------------------------------*
* Monitoring
*----------------------------------------------* 

*- 5) Continuous Improvement
				
	recode SC037Q01TA (3 = 0) (1 = 0.5) (2 = 1), gen(p5c_3)	// Similar question to 2012, but 2012 was yes/no, this has an additional point
	recode SC037Q07TA (3 = 0) (1 = 0.5) (2 = 1), gen(p5c_5)	// Similar question to 2012, but 2012 was yes/no, this has an additional point
	
	recode SC037Q02TA (3 = 0) (1 = 0.5) (2 = 1), gen(p5_br_1)	// Similar question to 2012, but 2012 was yes/no, this has an additional point
	recode SC037Q09TA (3 = 0) (1 = 0.5) (2 = 1), gen(p5_br_2)	// Similar question to 2012, but 2012 was yes/no, this has an additional point
			
	
*----------------------------------------------*
* Targets
*----------------------------------------------* 

*- 10) Target Balance

	recode SC035Q05TA  (2 = 0) (1 = 1), gen(p10a_1)
	recode SC035Q05TB  (2 = 0) (1 = 1), gen(p10a_1_td)
	recode SC035Q06TA  (2 = 0) (1 = 1), gen(p10a_2)
	recode SC035Q06TB  (2 = 0) (1 = 1), gen(p10a_2_td)
	recode SC035Q10TA  (2 = 0) (1 = 1), gen(p10a_3)
	recode SC035Q10TB  (2 = 0) (1 = 1), gen(p10a_3_td)
	
	* Variables with means (if you want to use alternative specification)
	egen p10a_1_mean = rmean(p10a_1 p10a_1_td)
	egen p10a_2_mean = rmean(p10a_2 p10a_2_td)
	egen p10a_3_mean = rmean(p10a_3 p10a_3_td)
	
*----------------------------------------------*
* People
*----------------------------------------------*  

*- 15) Rewarding High Performers
	
	recode SC035Q07TA (2 = 0) (1 = 1), gen(p15a_1)
	recode SC035Q07TB (2 = 0) (1 = 1), gen(p15a_1_td)
	
	recode SC193Q01WA (1 = 0) (2 = 0.33) (3 = 0.66) (4 = 1), gen(p15b_1) // Same question, same ordinal rank but slight word difference (change in 2012, impact 2022)
	recode SC193Q02WA (1 = 0) (2 = 0.33) (3 = 0.66) (4 = 1), gen(p15b_2) // Same question, same ordinal rank but slight word difference (change in 2012, impact 2022)
	recode SC193Q05WA (1 = 0) (2 = 0.33) (3 = 0.66) (4 = 1), gen(p15b_3) // Same question, same ordinal rank but slight word difference (change in 2012, impact 2022)	

	* Variables with means (if you want to use alternative specification)
	egen p15a_1_mean = rmean(p15a_1 p15a_1_td)

	
*- 17) Promoting High Performers

	recode SC193Q03WA (1 = 0) (2 = 0.33) (3 = 0.66) (4 = 1), gen(p17b_1) // Same question, same ordinal rank but slight word difference (change in 2012, impact 2022)	
	recode SC193Q04WA (1 = 0) (2 = 0.33) (3 = 0.66) (4 = 1), gen(p17d_1) // Same question, same ordinal rank but slight word difference (change in 2012, impact 2022)	
	recode SC193Q06WA (1 = 0) (2 = 0.33) (3 = 0.66) (4 = 1), gen(p17d_2) // Same question, same ordinal rank but slight word difference (change in 2012, impact 2022)	
	recode SC193Q07WA (1 = 0) (2 = 0.33) (3 = 0.66) (4 = 1), gen(p17d_3) // Same question, same ordinal rank but slight word difference (change in 2012, impact 2022)	
		
	

*- 20) Attracting Talent/ Creating a Distinctive Employee Value Proposition

	rename SC025Q01NA p20b_2
	gen p20b_2t = 0 if p20b_2==0 // generate a temporary variable
	replace p20b_2t = 0.25 if p20b_2>0 & p20b_2<=25
	replace p20b_2t = 0.5 if p20b_2>25 & p20b_2<=50
	replace p20b_2t = 0.75 if p20b_2>50 & p20b_2<=75
	replace p20b_2t = 1 if p20b_2>75 & p20b_2!=.
	replace p20b_2 = p20b_2t
		
	rename SC025Q02NA p20b_3
	gen p20b_3t = 0 if p20b_3==0 // generate a temporary variable
	replace p20b_3t = 0.25 if p20b_3>0 & p20b_3<=25
	replace p20b_3t = 0.5 if p20b_3>25 & p20b_3<=50
	replace p20b_3t = 0.75 if p20b_3>50 & p20b_3<=75
	replace p20b_3t = 1 if p20b_3>75 & p20b_3!=.
	replace p20b_3 = p20b_3t

	
	compress
	keep cnt ${ids} ${scc} ${stu2022} ${sch2022} ${outcomes2022} ${pv_efactors2022} ${efactors2022} ${practices_common2022}
	
	
	

*-----------------------------------------*
* BUILD SCHOOL-LEVEL SCORES
*-----------------------------------------*

// Generate school-level data 

* Computing score by school

generate math = .
generate reading = .
generate science = .

* Number of students per school
egen stu_scho = count(PV1MATH), by(uschool_id)
drop if stu_scho==1

	
levelsof uschool_id, local(schools)
foreach sc of local schools {
	quietly sum stu_scho if uschool_id=="`sc'"
	local test = r(mean)
	display as red "`sc', test result = `test'"
		* Math
			pv, pv(PV*MATH) weight(W_FSTUWT) brr rw(W_FSTURWT*) fays(0.5): reg @pv [aw=@w] if uschool_id=="`sc'"
			matrix T = r(table)
			replace math = T[1,1] if uschool_id=="`sc'"
		
		* Reading
			pv, pv(PV*READ) weight(W_FSTUWT) brr rw(W_FSTURWT*) fays(0.5): reg @pv [aw=@w] if uschool_id=="`sc'"
			matrix T = r(table)
			replace reading = T[1,1] if uschool_id=="`sc'"
			
		* Science
			pv, pv(PV*SCIE) weight(W_FSTUWT) brr rw(W_FSTURWT*) fays(0.5): reg @pv [aw=@w] if uschool_id=="`sc'"
			matrix T = r(table)
			replace science = T[1,1] if uschool_id=="`sc'"
}


* Saving
compress
note: This dataset is at student level
save "cleaning/tempdata/PISA2022_temp.dta", replace	
		
		
	
	


*------------------------------------------------------------*
* CREATING MANAGEMENT INDEX (common questions to 2012)
*------------------------------------------------------------*

use "cleaning/tempdata/PISA2022_temp.dta", clear	

* Looping through countries to build a full PISA2022 dataset
foreach c of global pisacty2022 {
	
	preserve
		display "`c'"
		keep if cnt=="`c'"

		* Collapse dataset at school level
		collapse ${practices_common2022}, by(uschool_id cnt) 
		compress
		
		* Determining the final sample based on number of questions missing
		egen miss = rowmiss(${practices_common2022}) 
		* tab miss 
		drop if miss > 1  // allowing school to only have one missing column in the index
		
		
		*-----------------------------------------*
		* BUILDING MANAGEMENT INDICES
		*-----------------------------------------*
		
		*--------- By practice (making every practice have the same weight, by taking first the mean of the questions by practice)

		dis "Step 1P: build practices"

		egen p1_common = rmean(${p1_common2022})
		egen p2_common = rmean(${p2_common2022})
		egen p3_common = rmean(${p3_common2022})
		egen p4_common = rmean(${p4_common2022})
		egen p5_common = rmean(${p5_common2022})
		egen p10_common = rmean(${p10_common2022})
		egen p15_common = rmean(${p15_common2022})
		egen p17_common = rmean(${p17_common2022})
		egen p20_common = rmean(${p20_common2022})

		dis "Step 2P: standardize the practices"
		global pracs_common "p1_common p2_common p3_common p4_common p5_common p10_common p15_common p17_common p20_common"	

		foreach var of global pracs_common {
			egen z`var' = std(`var') 
		}
		
		global zpracs_common "zp1_common zp2_common zp3_common zp4_common zp5_common zp10_common zp15_common zp17_common zp20_common"
				
		dis "Step 3P: average the standardized practices" 
		egen mgmt_common_practices = rmean(${zpracs_common}) 

		dis "Step 4P: standardize the averages"
		egen zmgmt_common_practices = std(mgmt_common_practices)
		la var mgmt_common_practices "Mgmt (main), common practices"

		* Saving
		save "cleaning/tempdata/PISA2022_`c'_sch_mgmt.dta", replace
	restore
}

* Appending all the country datasets together
clear 
foreach c of global pisacty2022 {
	append using "cleaning/tempdata/PISA2022_`c'_sch_mgmt.dta"
}


save "cleaning/tempdata/PISA2022_indices.dta", replace
	

	
*------------------------------------------------------------------*
* MERGING STUDENT LEVEL DATASET WITH COMMON INDEX
*------------------------------------------------------------------*

merge 1:m uschool_id using "cleaning/tempdata/PISA2022_temp.dta", keep(3) nogenerate


**** Check the match


save "analysis/data/PISA2022_analysis.dta", replace
	
