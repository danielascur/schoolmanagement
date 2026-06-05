*-----------------------------------------*
* SET UP
*-----------------------------------------*

clear all
macro drop _all

// Color scheme 
set scheme stcolor_alt

// Defining directory ----> Change it to where the replication file was saved!
global dir "/home/ecco_rais/data/interwrk/daniela_group/schoolmgmt/replication_jpem/replication_leaver_lemos_scur"

cd "${dir}"

* Set seed
set seed 12345

// Opening Log file
log using "logs/log_file.log", replace text

*-----------------------------------------*
* INSTALLED PROGRAMS
*-----------------------------------------*

ssc install pv, replace
ssc install repest, replace
ssc install icw_index, replace
net install grc1leg, from(http://www.stata.com/users/vwiggins/) replace
ssc install cibar, replace
ssc install rdrobust, replace
ssc install estout, replace
ssc install binscatter
ssc install fs


*---------------------------------------*
* GLOBALS FOR PREPARE & ANALYSIS 	*
*---------------------------------------*

// Prova Brasil analysis
* System controls (Akhtari et al. (2022))
global educ_spending 		"lspendeduc_imp m_lspendeduc"

* System controls (Prova Brasil)
global fin_controls 		"fin_resourses_fed_imp fin_resourses_state_imp fin_resourses_muni_imp"
global fin_control_miss 	"m_fin_resourses_fed   m_fin_resourses_state   m_fin_resourses_muni"

* Principal controls (Prova Brasil)
global pr       		"p_male_imp p_age50_imp p_sen15_imp p_pededuc_imp p_deg_imp p_wage7plus_imp p_uniquejob_imp"
global pr_miss  		"m_p_male   m_p_age50   m_p_sen15   m_p_pededuc   m_p_deg   m_p_wage7plus   m_p_uniquejob"

* School controls (School Census)
global sch_ctrl      		"urban_imp stratio_imp lstu_imp computerlab_imp internetaccess_imp infra_index_imp" 
global sch_ctrl_miss 		"m_urban   m_stratio   m_lstu   m_computerlab   m_internetaccess   m_infra_index"

* Teacher controls (Prova Brasil)
global t_ctrl    		"tmale_sh_imp twhite_sh_imp tedu_sh_imp ttenure_mean_imp"
global t_ctrl_miss 		"m_tmale_sh   m_twhite_sh   m_tedu_sh   m_ttenure_mean"

* Students controls (Prova Brasil)
global stu_ctrl      		"lstu_age_imp stu_female_imp socio_eco_imp stu_white_imp work_imp mlit_imp flit_imp"
global stu_ctrl_miss 		"m_lstu_age   m_stu_female   m_socio_eco   m_stu_white   m_work   m_mlit   m_flit"

global all_controls ${educ_spending} ${fin_controls} ${fin_control_miss} ${pr} ${pr_miss} ${sch_ctrl} ${sch_ctrl_miss} ${t_ctrl} ${t_ctrl_miss} ${stu_ctrl} ${stu_ctrl_miss} 





// Globals for Mediator analysis

* Teacher controls SCHOOL AVERAGES (Prova Brasil)
global t_ctrl_sch_avg   		"tmale_sh_sch_avg   twhite_sh_sch_avg   tedu_sh_sch_avg   ttenure_mean_sch_avg"
global t_ctrl_sch_avg_miss 		"m_tmale_sh_sch_avg m_twhite_sh_sch_avg m_tedu_sh_sch_avg m_ttenure_mean_sch_avg"

* Students controls SCHOOL AVERAGES (Prova Brasil)
global stu_sch_avg_ctrl      		"lstu_age_sch_avg   stu_female_sch_avg   socio_eco_sch_avg   stu_white_sch_avg   work_sch_avg   mlit_sch_avg   flit_sch_avg"
global stu_sch_avg_ctrl_miss 		"m_lstu_age_sch_avg m_stu_female_sch_avg m_socio_eco_sch_avg m_stu_white_sch_avg m_work_sch_avg m_mlit_sch_avg m_flit_sch_avg"


* Aggregating those controls into mediators (M), post treatment controls (Z) and other controls (X) 

* M: All mediators
	global principal_controls	"${pr} ${pr_miss}"
	global all_mediators		"zmgmt ${principal_controls}"

* Z: Post-treatment cofounders
	global post_treat  		"${fin_controls} ${fin_control_miss} ${educ_spending} stratio_imp lstu_imp computerlab_imp internetaccess_imp infra_index_imp m_stratio m_lstu m_computerlab m_internetaccess m_infra_index ${t_ctrl_sch_avg} ${t_ctrl_sch_avg_miss} ${stu_sch_avg_ctrl} ${stu_sch_avg_ctrl_miss}"

	global post_treat_prev_year  	"${fin_controls} ${fin_control_miss} ${educ_spending} stratio_imp lstu_imp computerlab_imp internetaccess_imp infra_index_imp m_stratio m_lstu m_computerlab m_internetaccess m_infra_index"

* X: "Other controls" (that are not post-treatment)
	global other_controls   	"urban m_urban" 



// PISA analysis
global c_main "schloc1 schloc2 schloc3 schloc4 schloc5 schloc_m stratio_imp stratio_m lstu_imp lstu_m compweb_imp compweb_m govfund_imp govfund_m "
global c_full "stu_female grade_imp grade_m escs_imp escs_m stu_immi1 stu_immi2 stu_immi3 stu_immi_m" 

// Political turnover analysis
global controls_sch  "urban_schl waterpblcnetwork_schl sewerpblcnetwork_schl trashcollect_schl eqpinternet_schl eqpinternet_schl_miss"
global controls_stud "female_SPB female_SPB_miss white_SPB white_SPB_miss mom_reads_SPB mom_reads_SPB_miss"

// Graph globals
global region "fcolor(white) lcolor(white) ifcolor(white) ilcolor(white)"






*-----------------------------------------*
* DO FILES 
*-----------------------------------------*

// Cleaning
do "cleaning/1_pisa2012_cleaning.do" 

	display "End of PISA 2012"

do "cleaning/2_pisa2022_cleaning.do" 

	display "End of PISA 2022"	
	
do "cleaning/3_pb_cleaning.do" 

	display "End of Prova Brasil"

do "cleaning/4_pol_turnover_cleaning.do" 

	display "End of Political turnover"


// Analysis
do "analysis/table_1.do"
do "analysis/table_2.do"
do "analysis/table_3.do"
do "analysis/table_4.do"
do "analysis/figure_1.do"
do "analysis/figure_3.do"
do "analysis/figure_4.do"
do "analysis/figure_5_table_5.do"
do "analysis/table_a1.do"
do "analysis/table_a2.do"
do "analysis/table_a3.do"
do "analysis/figure_a1.do"
do "analysis/figure_a2.do"
do "analysis/figure_a3.do"
do "analysis/figure_a4.do"
do "analysis/figure_a5.do"




// Erasing temporary (temp) folder

// * Listing all files in the folder
// fs "cleaning/tempdata/*"
//
// * Looping through each file and delete it
// foreach file in `r(files)' {
//     rm "cleaning/tempdata/`file'"
// }
//
// * Verifying the folder is empty
// fs "cleaning/tempdata/*"
//
// * Erasing empty folder
// rmdir "cleaning/tempdata"


// Closing log
log close


