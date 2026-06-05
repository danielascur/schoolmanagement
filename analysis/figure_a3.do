
* Opening student-level dataset
use "analysis/data/PISA2012_analysis.dta", clear

* Collapsing by school
collapse mgmt_wms_practices_std zmgmt_wms_pca zmgmt_wms_and efa_* [w=stu_fac], by(uschool_id cnt)

* Generating correlates of factors and the PCA other indices
scatter mgmt_wms_practices_std zmgmt_wms_pca, ///
	xtitle("Principal Component (preferred)") ytitle("Preferred Management Index") name(pca, replace)

scatter mgmt_wms_practices_std zmgmt_wms_and, ///
	xtitle("Anderson (2018)") ytitle("Preferred Management Index") name(and, replace)
	
scatter mgmt_wms_practices_std efa_f1, ///
	xtitle("Estimated Factor 1") ytitle("Preferred Management Index") name(efa1, replace)
scatter mgmt_wms_practices_std efa_f2, ///
	xtitle("Estimated Factor 2") ytitle("Preferred Management Index") name(efa2, replace)
scatter mgmt_wms_practices_std efa_f3, ///
	xtitle("Estimated Factor 3") ytitle("Preferred Management Index") name(efa3, replace)
scatter mgmt_wms_practices_std efa_f4, ///
	xtitle("Estimated Factor 4") ytitle("Preferred Management Index") name(efa4, replace)
scatter mgmt_wms_practices_std efa_f5, ///
	xtitle("Estimated Factor 5") ytitle("Preferred Management Index") name(efa5, replace)
scatter mgmt_wms_practices_std efa_f6, ///
	xtitle("Estimated Factor 6") ytitle("Preferred Management Index") name(efa6, replace)

graph combine efa1 efa2 efa3 efa4 efa5 efa6 pca and

graph export "analysis/results/figure_a3.pdf", as(pdf) replace

graph close _all
