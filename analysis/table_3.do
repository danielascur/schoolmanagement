* Student-level PISA dataset
use "analysis/data/PISA2012_analysis.dta", clear


* Renaming for manking easier
rename mgmt_wms_practices_std   mgmt_wms
rename mgmt_broad_practices_std	mgmt_broad
rename mgmt_wms_autonomy_std	mgmt_auto
rename mgmt_wms_policy_std 	mgmt_policy
rename mgmt_wms_equalweight_std mgmt_wms_ew
rename zmgmt_wms_pca_std	mgmt_pca
rename zmgmt_wms_and_std	mgmt_ander

* Running regressions and save results, for each index, for each subject	
foreach sub in read math scie {
	
	* WMS index
	eststo reg_mgmt_wms_`sub': 	repest PISA, estimate(stata: reg pv@`sub' mgmt_wms i.c private ${c_main} ${c_full}, cluster(uschool_id)) results(add(r2 N N_clust))
	estadd scalar obs = _b[e_N]
	estadd scalar rsqr = _b[e_r2]
	estadd scalar cluster =  _b[e_N_clust]
	estadd local countryfe Y
	estadd local schoolcontrols Y 
	estadd local studentcontrols Y
	estadd local index  "WMS core"
	estadd local nodes  "all"
	estadd local method "Avg Practice"

	* Broad
	eststo reg_mgmt_broad_`sub': 	repest PISA, estimate(stata: reg pv@`sub' mgmt_broad i.c private ${c_main} ${c_full}, cluster(uschool_id)) results(add(r2 N N_clust))
	estadd scalar obs = _b[e_N]
	estadd scalar rsqr = _b[e_r2]
	estadd scalar cluster =  _b[e_N_clust]
	estadd local countryfe Y
	estadd local schoolcontrols Y 
	estadd local studentcontrols Y
	estadd local index  "+ mgmt broad"
	estadd local nodes  "1,2,3"
	estadd local method "Avg Practice"

	* WMS + autonomy
	eststo reg_mgmt_auto_`sub': 	repest PISA, estimate(stata: reg pv@`sub' mgmt_auto i.c private ${c_main} ${c_full}, cluster(uschool_id)) results(add(r2 N N_clust))
	estadd scalar obs = _b[e_N]
	estadd scalar rsqr = _b[e_r2]
	estadd scalar cluster =  _b[e_N_clust]
	estadd local countryfe Y
	estadd local schoolcontrols Y 
	estadd local studentcontrols Y
	estadd local index  "+ autonomy"
	estadd local nodes  "1,2,4"
	estadd local method "Avg Practice"
	
	* WMS + policy
	eststo reg_mgmt_policy_`sub': 	repest PISA, estimate(stata: reg pv@`sub' mgmt_policy i.c private ${c_main} ${c_full}, cluster(uschool_id)) results(add(r2 N N_clust))
	estadd scalar obs = _b[e_N]
	estadd scalar rsqr = _b[e_r2]
	estadd scalar cluster =  _b[e_N_clust]
	estadd local countryfe Y
	estadd local schoolcontrols Y 
	estadd local studentcontrols Y
	estadd local index  "+ policy"
	estadd local nodes  "1,3,4"
	estadd local method "Avg Practice"

	* WMS Equal Weight Index
	eststo reg_mgmt_wms_ew_`sub': 	repest PISA, estimate(stata: reg pv@`sub' mgmt_wms_ew i.c private ${c_main} ${c_full}, cluster(uschool_id)) results(add(r2 N N_clust))
	estadd scalar obs = _b[e_N]
	estadd scalar rsqr = _b[e_r2]
	estadd scalar cluster =  _b[e_N_clust]
	estadd local countryfe Y
	estadd local schoolcontrols Y 
	estadd local studentcontrols Y
	estadd local index  "WMS core"
	estadd local nodes  "all"
	estadd local method "Avg Questions"

	* PCA index
	eststo reg_mgmt_pca_`sub':	repest PISA, estimate(stata: reg pv@`sub' mgmt_pca i.c private ${c_main} ${c_full}, cluster(uschool_id)) results(add(r2 N N_clust))
	estadd scalar obs = _b[e_N]
	estadd scalar rsqr = _b[e_r2]
	estadd scalar cluster =  _b[e_N_clust]
	estadd local countryfe Y
	estadd local schoolcontrols Y 
	estadd local studentcontrols Y
	estadd local index  "WMS core"
	estadd local nodes  "all"
	estadd local method "PCA"

	* Anderson (2008) index
	eststo reg_mgmt_ander_`sub': 	repest PISA, estimate(stata: reg pv@`sub' mgmt_ander i.c private ${c_main} ${c_full}, cluster(uschool_id)) results(add(r2 N N_clust))
	estadd scalar obs = _b[e_N]
	estadd scalar rsqr = _b[e_r2]
	estadd scalar cluster =  _b[e_N_clust]
	estadd local countryfe Y
	estadd local schoolcontrols Y 
	estadd local studentcontrols Y
	estadd local index  "WMS core"
	estadd local nodes  "all"
	estadd local method "Anderson (2008)"
}




// creating LaTeX Table	


* Panel A: Reading
esttab  reg_mgmt_wms_read reg_mgmt_broad_read reg_mgmt_auto_read reg_mgmt_policy_read ///
	 reg_mgmt_wms_ew_read reg_mgmt_pca_read reg_mgmt_ander_read ///
	using "analysis/results/table_3.tex", ///
	replace frag compress noconstant nogap collabels(none) nomtitle ///
	rename(mgmt_wms mgmt mgmt_broad mgmt mgmt_policy mgmt mgmt_auto mgmt ///
	       mgmt_wms_ew mgmt mgmt_pca mgmt mgmt_ander mgmt) ///
        keep(mgmt) coeflabels(mgmt "Management Index") ///
	refcat(mgmt "\midrule \textbf{Panel A: Reading}", nolabel) ///
	mgroups("Decision Nodes" "Index Method", pattern(1 0 0 0 1 0 0) ///
	prefix(\multicolumn{@span}{c}{) suffix(}) span erepeat(\cmidrule(lr){@span})) ///
	cells(b(star fmt(3)) se(par fmt(3))) starlevels(* 0.1 ** 0.05 *** 0.01) ///
	stats(rsqr, fmt(3) ///
	label("R-Squared")) ///
	obslast nolines
	

* Panel B: Math
esttab  reg_mgmt_wms_math reg_mgmt_broad_math reg_mgmt_auto_math reg_mgmt_policy_math ///
	reg_mgmt_wms_ew_math reg_mgmt_pca_math reg_mgmt_ander_math ///
	using "analysis/results/table_3.tex", ///
	append frag compress noconstant nogap nolines collabels(none) nomtitle nonum ///
	rename(mgmt_wms mgmt mgmt_broad mgmt mgmt_policy mgmt mgmt_auto mgmt ///
	       mgmt_wms_ew mgmt mgmt_pca mgmt mgmt_ander mgmt) ///
        keep(mgmt) coeflabels(mgmt "Management Index") ///
	refcat(mgmt "\midrule \textbf{Panel B: Math}", nolabel) ///
	cells(b(star fmt(3)) se(par fmt(3))) starlevels(* 0.1 ** 0.05 *** 0.01) ///
	stats(rsqr , fmt(3) ///
	label("R-Squared")) ///
	obslast 
	
	
* Panel C: Science
esttab  reg_mgmt_wms_scie reg_mgmt_broad_scie reg_mgmt_auto_scie reg_mgmt_policy_scie ///
	reg_mgmt_wms_ew_scie reg_mgmt_pca_scie reg_mgmt_ander_scie ///
	using "analysis/results/table_3.tex", ///
	append frag compress noconstant nogap nolines collabels(none) nomtitle nonum ///
	rename(mgmt_wms mgmt mgmt_broad mgmt mgmt_policy mgmt mgmt_auto mgmt ///
	       mgmt_wms_ew mgmt mgmt_pca mgmt mgmt_ander mgmt) ///
        keep(mgmt) coeflabels(mgmt "Management Index") ///
	refcat(mgmt "\midrule \textbf{Panel C: Science}", nolabel) ///
	cells(b(star fmt(3)) se(par fmt(3))) starlevels(* 0.1 ** 0.05 *** 0.01) ///
	stats(rsqr obs cluster countryfe schoolcontrols studentcontrols index nodes method, fmt(3 %12.0fc %12.0fc 0 0 0) ///
	label("R-Squared" "\\ \# Students" "\# Schools" "\midrule \textbf{Controls} \\ Country FE" "School" "Student" ///
		"\textbf{Index}" "\textit{Nodes included}" "\textbf{Method}")) 
	


	
	
	
		

	
	
	
