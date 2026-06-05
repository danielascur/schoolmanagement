// Management in Schools
// Created by: Fabiano Dal-Ri
// (fabianodr@al.insper.edu.br)
// Date created: March 2022

// Purpose: Replication code for Table 1: PISA regression results 

*------------------------------------------------------
* PISA regression results
*------------------------------------------------------	

* Student-level PISA dataset
use "analysis/data/PISA2012_analysis.dta", clear


// Run regressions and save results

eststo clear

* Creating tag for observations that we have all variables (keep same sample in the table)
egen miss = rowmiss(pv1math pv2math pv3math pv4math pv5math pv1read pv2read pv3read pv4read pv5read pv1scie pv2scie pv3scie pv4scie pv5scie mgmt_wms_practices_std c private ${c_main} ${c_full} uschool_id)

gen no_miss = (miss == 0)



// PANEL A: ALL COUNTRIES WITH PUBLIC/PRIVATE DUMMMY IN EQUATION

foreach sub in read math scie {

	// Getting mean of dependent variable
	repest PISA, estimate(stata: reg pv@`sub' if no_miss == 1, cluster(uschool_id)) results(combine(ymean: _b[_cons]))
	local ymean = _b[ymean]

	dis "col1"
	eststo col1_`sub': repest PISA, estimate(stata: reg pv@`sub' mgmt_wms_practices_std i.c if no_miss == 1, cluster(uschool_id)) results(add(r2 N N_clust) combine(months_learn: _b[mgmt_wms_practices_std]/40*12)) 
	// months_learn = coeff * 40 / 12--> 40 points on the PISA scale is equivalent to one year of learning 
	estadd scalar obs = _b[e_N]
	estadd scalar rsqr = _b[e_r2]
	estadd scalar cluster = _b[e_N_clust]
	estadd scalar ymean = `ymean'
	estadd scalar months_learn = _b[months_learn]
	estadd local countryfe Y

	dis "col2"
	eststo col2_`sub': repest PISA, estimate(stata: reg pv@`sub' mgmt_wms_practices_std i.c private ${c_main} if no_miss == 1, cluster(uschool_id)) results(add(r2 N N_clust) combine(months_learn: _b[mgmt_wms_practices_std]/40*12))
	estadd scalar obs = _b[e_N]
	estadd scalar rsqr = _b[e_r2]
	estadd scalar cluster =  _b[e_N_clust]
	estadd scalar ymean = `ymean'
	estadd scalar months_learn = _b[months_learn]
	estadd local countryfe Y
	estadd local schoolcontrols Y

	dis "col3"
	eststo col3_`sub': repest PISA, estimate(stata: reg pv@`sub' mgmt_wms_practices_std i.c private ${c_main} ${c_full} if no_miss == 1, cluster(uschool_id)) results(add(r2 N N_clust) combine(months_learn: _b[mgmt_wms_practices_std]/40*12))
	estadd scalar obs = _b[e_N]
	estadd scalar rsqr = _b[e_r2]
	estadd scalar cluster =  _b[e_N_clust]
	estadd scalar ymean = `ymean'
	estadd scalar months_learn = _b[months_learn]
	estadd local countryfe Y
	estadd local schoolcontrols Y 
	estadd local studentcontrols Y

}

// creating LaTeX Table	
esttab col1_read col2_read col3_read col1_math col2_math col3_math col1_scie col2_scie col3_scie ///
	using "analysis/results/table_1.tex", tex  ///
	replace frag compress noconstant nomtitle nogap collabels(none)   ///
	mgroups("Reading PISA Points" "Math PISA Points" "Science PISA Points", pattern(1 0 0 1 0 0 1 0 0) ///
	prefix(\multicolumn{@span}{c}{) suffix(}) span erepeat(\cmidrule(lr){@span})) ///
	keep(mgmt_wms_practices_std) ///
	cells(b(star fmt(3)) se(par fmt(3))) starlevels(* 0.1 ** 0.05 *** 0.01) ///
	coeflabels(mgmt_wms_practices_std "\hline \textbf{All Schools} \\ Management Index") /// 
	stats(rsqr obs cluster ymean months_learn countryfe schoolcontrols studentcontrols, fmt(3 %9.0fc %9.0fc 1 2 0 0 0) ///
	label("\\ R-Squared" "\\ \# Students" "\# Schools"  "\\ Mean dep var" ///
	"Mfx (in months of learning)" ///
	"\midrule \textbf{Controls} \\ Country FE" "School" "Student" )) ///
	obslast nolines
	
	
	
	
	
	
	
	
	
	/*
	
	
	
	
// PANEL B: BRAZIL 

foreach sub in read math scie {

	dis "col1"
	eststo col1_`sub': repest PISA, estimate(stata: reg pv@`sub' mgmt_wms_practices_std if country=="BRA", cluster(uschool_id)) results(add(r2 N N_clust))
	estadd scalar obs = _b[e_N]
	estadd scalar rsqr = _b[e_r2]
	estadd scalar cluster = _b[e_N_clust]
	estadd local countryfe Y 

	dis "col2"
	eststo col2_`sub': repest PISA, estimate(stata: reg pv@`sub' mgmt_wms_practices_std private ${c_main}  if country=="BRA", cluster(uschool_id)) results(add(r2 N N_clust))
	estadd scalar obs = _b[e_N]
	estadd scalar rsqr = _b[e_r2]
	estadd scalar cluster = _b[e_N_clust]
	estadd local countryfe Y 
	estadd local schoolcontrols Y

	dis "col3"
	eststo col3_`sub': repest PISA, estimate(stata: reg pv@`sub' mgmt_wms_practices_std private  ${c_main} ${c_full}  if country=="BRA" , cluster(uschool_id)) results(add(r2 N N_clust))
	estadd scalar obs = _b[e_N]
	estadd scalar rsqr = _b[e_r2]
	estadd scalar cluster = _b[e_N_clust]
	estadd local countryfe Y 
	estadd local schoolcontrols Y 
	estadd local studentcontrols Y	

}

// creating LaTeX Table	
esttab col1_read col2_read col3_read col1_math col2_math col3_math col1_scie col2_scie col3_scie ///
	using "output/results/Table_1b.tex", tex ///
	replace frag compress noconstant nomtitle nogap collabels(none)  ///
	keep(mgmt_wms_practices_std private) cells(b(star fmt(3)) se(par fmt(3))) starlevels(* 0.1 ** 0.05 *** 0.01) ///
	coeflabels(mgmt_wms_practices_std "\\ \hline \textbf{Brazil} \\ Management Index" private "Private=1" ) /// 
	stats(obs cluster rsqr countryfe schoolcontrols studentcontrols, fmt(0 0 3 0 0 0) ///
	label("\\ Students" "Schools" "R-Squared" "\\ Country FE" "School Controls" "Student Controls")) ///
	obslast nolines nodepvars noeqli nonumber eqlabels(none)	


