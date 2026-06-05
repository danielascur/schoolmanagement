*------------------------------------------------------
* Management and school functioning (PISA)
*------------------------------------------------------	
	
* Student-level PISA dataset
use "analysis/data/PISA2012_analysis.dta", clear

// Collapsing at the school-level
collapse stu_female w_fschwt grade escs stu_immi1 stu_immi2 stu_immi3 stu_immi ///
	pri_fac private schloc1 schloc2 schloc3 schloc4 schloc5  schloc ///
	stratio lstu compweb govfund ///
	whh_wms_std wts_wms_std wtm_wms_std wte_wms_std mgmt_wms_practices_std [w=stu_fac], ///
	by(cnt uschool_id)
	

	
// Creating auxiliary and missing indicators 
	
* Numerical variable for country
egen c = group(cnt)

* We need variable schoolid to exist for using repest command
gen schoolid = substr(uschool_id, 4, .)

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



* Defining samples
egen depmiss = rmiss(wts_wms wtm_wms wte_wms whh_wms)
	
cap drop sample
reg wts_wms_std $c_main $c_full i.c [pw=w_fschwt] if private == 0 & depmiss == 0, cluster(uschool_id)
generate sample=e(sample)
	
	
* Running regressions and saving results

eststo clear

eststo short_o: reg wts_wms_std mgmt_wms_practices_std i.c [pw=w_fschwt] ///
	if private==0 & sample==1, cluster(uschool_id)
estadd scalar obs = e(N) 
estadd scalar rsqu = e(r2_a)
estadd local countryfe "Y"
estadd local schoolcontrols " "
estadd local studentcontrols " "
	
eststo sat_o: reg wtm_wms_std mgmt_wms_practices_std i.c [pw=w_fschwt] ///
	if private==0 & sample==1, cluster(uschool_id)
estadd scalar obs = e(N) 
estadd scalar rsqu = e(r2_a)
estadd local countryfe "Y"
estadd local schoolcontrols " "
estadd local studentcontrols " "

eststo effort_ot: reg wte_wms_std mgmt_wms_practices_std i.c [pw=w_fschwt] ///
	if private==0 & sample==1, cluster(uschool_id)
estadd scalar obs = e(N) 
estadd scalar rsqu = e(r2_a)
estadd local countryfe "Y"
estadd local schctrl " "
estadd local stuctrl " "

eststo effort_hh: reg whh_wms_std mgmt_wms_practices_std i.c [pw=w_fschwt] ///
	if private==0 &  sample==1, cluster(uschool_id)
estadd scalar obs = e(N) 
estadd scalar rsqu = e(r2_a)
estadd local countryfe "Y"
estadd local schctrl " "
estadd local stuctrl " "

eststo short_op: reg wts_wms_std mgmt_wms_practices_std $c_main $c_full i.c [pw=w_fschwt] ///
	if private==0 & sample==1, cluster(uschool_id)
estadd scalar obs = e(N) 
estadd scalar rsqu = e(r2_a)
estadd local countryfe "Y"
estadd local schctrl "Y"
estadd local stuctrl "Y"

eststo sat_op: reg wtm_wms_std mgmt_wms_practices_std $c_main $c_full i.c [pw=w_fschwt] ///
	if private==0 & sample==1, cluster(uschool_id)
estadd scalar obs = e(N) 
estadd scalar rsqu = e(r2_a)
estadd local countryfe "Y"
estadd local schctrl "Y"
estadd local stuctrl "Y"

eststo effort_otp: reg wte_wms_std mgmt_wms_practices_std $c_main $c_full i.c [pw=w_fschwt] ///
	if private==0 &  sample==1, cluster(uschool_id)
estadd scalar obs = e(N) 
estadd scalar rsqu = e(r2_a)
estadd local countryfe "Y"
estadd local schctrl "Y"
estadd local stuctrl "Y"

eststo effort_hhp: reg whh_wms_std mgmt_wms_practices_std $c_main $c_full i.c [pw=w_fschwt] ///
	if private==0 &  sample==1, cluster(uschool_id)
estadd scalar obs = e(N) 
estadd scalar rsqu = e(r2_a)
estadd local countryfe "Y"
estadd local schctrl "Y"
estadd local stuctrl "Y"

* Creating LaTeX Table
esttab short_o short_op sat_o sat_op effort_ot effort_otp effort_hh effort_hhp ///
	using "analysis/results/table_2.tex", tex ///
	replace frag compress noconstant nogap collabels(none) ///
	mgroups("Teacher shortage" "Teacher motivation" "Teacher effort" "Household effort" , pattern(1 0 1 0 1 0 1 0) ///
	prefix(\multicolumn{@span}{c}{) suffix(}) span erepeat(\cmidrule(lr){@span})) ///
	keep(mgmt_wms_practices_std) cells(b(star fmt(3)) se(par fmt(3))) starlevels(* 0.1 ** 0.05 *** 0.01)  ///
	coeflabels(mgmt_wms_practices_std "Management Index") ///
	stats(rsqu obs countryfe schctrl stuctrl, fmt(3 %9.0fc 0 0 0) ///
	label("\\ R-Squared" "\\ \# Schools" "\midrule \textbf{Controls} \\ Country FE" "School" "Student")) ///
	obslast nolines	nomtitles

	
	
