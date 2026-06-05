

*** Globals for PISA analysis

* Countries in PISA 2012
global pisacty "ALB ARE ARG AUS AUT BEL BGR BRA CAN CHE CHL COL CRI CZE DEU DNK ESP EST FIN FRA GBR GRC HKG HRV HUN IDN IRL ISL ISR ITA JOR JPN KAZ KOR LIE LTU LUX LVA MAC MEX MNE MYS NLD NOR NZL PER POL PRT QAT QCN QRS ROU RUS SGP SRB SVK SVN SWE TAP THA TUN TUR URY USA VNM"

* Countries in PISA 2022
global pisacty2022 "ALB ARE ARG AUS AUT BEL BGR BRA BRN CAN CHE CHL COL CRI CZE DEU DNK DOM ESP EST FIN FRA GBR GEO GRC GTM HKG HRV HUN IDN IRL ISL ISR ITA JAM JOR JPN KAZ KHM KOR KSV LTU LVA MAC MAR MDA MEX MKD MLT MNE MNG MYS NLD NOR NZL PAN PER PHL POL PRT PRY PSE QAT QAZ QUR ROU SAU SGP SLV SRB SVK SVN SWE TAP THA TUR URY USA UZB VNM"



* Variables for PISA 2012 scores
global outcomes "pv1math pv2math pv3math pv4math pv5math pv1read pv2read pv3read pv4read pv5read pv1scie pv2scie pv3scie pv4scie pv5scie"
global pv_efactors "w_fstuwt w_fstr1-w_fstr80 w_fschwt"
global efactors "stu_fac pri_fac"

* PISA student/ schools variables
global scc "rural students"
global stu "stidstd stu_female grade escs stu_immi stu_age"
global sch "schloc stratio lstu compweb govfund private cnt"
global ids "uschool_id cnt wmscty"


* For 2012, a few differences
global outcomes2022 "PV1MATH PV2MATH PV3MATH PV4MATH PV5MATH PV1READ PV2READ PV3READ PV4READ PV5READ PV1SCIE PV2SCIE PV3SCIE PV4SCIE PV5SCIE"
global pv_efactors2022 "W_FSTUWT W_FSTURWT1-W_FSTURWT80 W_SCHGRNRABWT"
global efactors2022 "stu_pri_fac"	
global stu2022 "stu_id stu_female grade escs stu_immi stu_age natdisaster"
global sch2022 "schloc stratio lstu govfund private"


* Teacher shortages, motivation and effort, Student attention and Parent effort 
global ts "ts_1 ts_2 ts_3 ts_4"
global tm "tm_1 tm_2 tm_3 tm_4 tm_5 tm_6 tm_7 tm_8 tm_9 tm_10 tm_11 tm_12 tm_13 tm_14"
global te "te_1 te_2 te_3 te_4"
global sa "sa_1 sa_2 sa_3 sa_4 sa_5 sa_6 sa_7 sa_8"
global pe "pe_1 pe_2 pe_3 pe_4 pe_5 pe_6 pe_7 pe_8 pe_9 pe_10 pe_11"
global boutcomes "${ts} ${tm} ${te} ${sa} ${pe}"

* Standardized
global ts_z "ts_1_z ts_2_z ts_3_z ts_4_z"
global tm_z "tm_1_z tm_2_z tm_3_z tm_4_z tm_5_z tm_6_z tm_7_z tm_8_z tm_9_z tm_10_z tm_11_z tm_12_z tm_13_z tm_14_z"
global te_z "te_1_z te_2_z te_3_z te_4_z"
global sa_z "sa_1_z sa_2_z sa_3_z sa_4_z sa_5_z sa_6_z sa_7_z sa_8_z"
global pe_z "pe_1_z pe_2_z pe_3_z pe_4_z pe_5_z pe_6_z pe_7_z pe_8_z pe_9_z pe_10_z pe_11_z"
global boutcomes_z "${ts_z} ${tm_z} ${te_z} ${sa_z} ${pe_z}"

	
* WMS index
global p1_wms    "p1a_1 p1a_3 p1b_2 p1b_3 p1d_1" 
global p2_wms    "p2b_2"
global p3_wms    "p3a_1 p3a_2 p3b_1"
global p4_wms    "p4a_1 p4a_2 p4b_1 p4b_2 p4b_3"
global p5_wms    "p5a_1 p5c_1 p5c_2 p5c_3 p5c_5 p5d_1"
global p7_wms    "p7a_1 p7a_2 p7a_3 p7a_4 p7a_5"
global p8_wms    "p8a_1 p8a_2 p8a_3"
global p10_wms   "p10a_1 p10a_2 p10a_3 p10a_4"
global p11_wms   "p11a_1"
global p13_wms   "p13a_1"		
global p14_wms   "p14a_1 p14a_3 p14c_1 p14c_2"
global p15_wms   "p15a_1 p15b_1 p15b_2 p15b_3 p15b_4"
global p17_wms   "p17b_1 p17c_1 p17c_2 p17d_1"
global p20_wms   "p20b_2 p20b_3" 

* Practices in WMS index
global practices_wms "${p1_wms} ${p2_wms} ${p3_wms} ${p4_wms} ${p5_wms} ${p7_wms} ${p8_wms} ${p10_wms} ${p11_wms} ${p13_wms} ${p14_wms} ${p15_wms} ${p17_wms} ${p20_wms}"


* WMS index (std)
global zp1_wms    "zp1a_1 zp1a_3 zp1b_2 zp1b_3 zp1d_1" 
global zp2_wms    "zp2b_2"
global zp3_wms    "zp3a_1 zp3a_2 zp3b_1"
global zp4_wms    "zp4a_1 zp4a_2 zp4b_1 zp4b_2 zp4b_3"
global zp5_wms    "zp5a_1 zp5c_1 zp5c_2 zp5c_3 zp5c_5 zp5d_1"
global zp7_wms    "zp7a_1 zp7a_2 zp7a_3 zp7a_4 zp7a_5"
global zp8_wms    "zp8a_1 zp8a_2 zp8a_3"
global zp10_wms   "zp10a_1 zp10a_2 zp10a_3 zp10a_4"
global zp11_wms   "zp11a_1"
global zp13_wms   "zp13a_1"		
global zp14_wms   "zp14a_1 zp14a_3 zp14c_1 zp14c_2"
global zp15_wms   "zp15a_1 zp15b_1 zp15b_2 zp15b_3 zp15b_4"
global zp17_wms   "zp17b_1 zp17c_1 zp17c_2 zp17d_1"
global zp20_wms   "zp20b_2 zp20b_3" 

* Practices in WMS index (std)
global zpractices_wms "${zp1_wms} ${zp2_wms} ${zp3_wms} ${zp4_wms} ${zp5_wms} ${zp7_wms} ${zp8_wms} ${zp10_wms} ${zp11_wms} ${zp13_wms} ${zp14_wms} ${zp15_wms} ${zp17_wms} ${zp20_wms}"


* Broad index
global p1_broad  "p1a_1 p1a_2 p1a_3 p1b_2 p1b_3 p1d_1"
global p2_broad  "p2a_1 p2b_1 p2b_2"
global p3_broad  "p3a_1 p3a_2 p3b_1"
global p4_broad  "p4a_1 p4a_2 p4b_1 p4b_2 p4b_3"
global p5_broad  "p5a_1 p5c_1 p5c_2 p5c_3 p5c_4 p5c_5 p5c_6 p5d_1"
global p7_broad  "p7a_1 p7a_2 p7a_3 p7a_4 p7a_5"
global p8_broad  "p8a_1 p8a_2 p8a_3"
global p10_broad "p10a_1 p10a_2 p10a_3 p10a_4"
global p11_broad "p11a_1"
global p13_broad "p13a_1"
global p14_broad "p14a_1 p14a_2 p14a_3 p14c_1 p14c_2"
global p15_broad "p15a_1 p15b_1 p15b_2 p15b_3 p15b_4"
global p17_broad "p17b_1 p17c_1 p17c_2 p17d_1"
global p20_broad "p20b_2 p20b_3"

* Practices Broad index
global practices_broad "${p1_broad} ${p2_broad} ${p3_broad} ${p4_broad} ${p5_broad} ${p7_broad} ${p8_broad} ${p10_broad} ${p11_broad} ${p13_broad} ${p14_broad} ${p15_broad} ${p17_broad} ${p20_broad}"


* Common between 2012 and 2022 practices 
global p1_common  "p1a_1 p1a_3 p1b_2 p1b_3"
global p2_common  "p2b_2"
global p3_common  "p3a_1 p3a_2 p3b_1"
global p4_common  "p4a_1 p4b_2"
global p5_common  "p5c_3 p5c_5"
global p10_common "p10a_1 p10a_2 p10a_3"
global p15_common "p15a_1 p15b_1 p15b_2 p15b_3"
global p17_common "p17b_1 p17d_1"
global p20_common "p20b_2 p20b_3"

* Practices common 
global practices_common "${p1_common} ${p2_common} ${p3_common} ${p4_common} ${p5_common} ${p10_common} ${p15_common} ${p17_common} ${p20_common}"

* For 2022, there are pairs of questions that are equivalent to only one question in 2012, so we need different globals). Specifically p3a_1_td, p3a_2_td, p3b_2, p4a_1_td, p10a_1_td, p10a_2_td, p10a_3_td, p15a_1_td,  p17d_2 p17d_3
global p1_common2022  "p1a_1 p1a_3 p1b_2 p1b_3"
global p2_common2022  "p2b_2"
global p3_common2022  "p3a_1 p3a_1_td p3a_2 p3a_2_td p3b_1 p3b_2"
global p4_common2022  "p4a_1 p4a_1_td p4b_2"
global p5_common2022  "p5c_3 p5c_5"
global p10_common2022 "p10a_1 p10a_1_td p10a_2 p10a_2_td p10a_3 p10a_3_td"
global p15_common2022 "p15a_1 p15a_1_td p15b_1 p15b_2 p15b_3"
global p17_common2022 "p17b_1 p17d_1 p17d_2 p17d_3"
global p20_common2022 "p20b_2 p20b_3"

* Practices common 
global practices_common2022 "${p1_common2022} ${p2_common2022} ${p3_common2022} ${p4_common2022} ${p5_common2022} ${p10_common2022} ${p15_common2022} ${p17_common2022} ${p20_common2022}"


* Policy questions
global policy  "policy01 policy02 policy03 policy04 policy05 policy06 policy07 policy08 policy09 policy10 policy11 policy12 policy13 policy14" 	

* Autonomy questions
global autonomy "aut_1 aut_2 aut_3 aut_4 aut_5 aut_6 aut_7 aut_8 aut_9 aut_10 aut_11 aut_12 aut_13 aut_14 aut_15 aut_16 aut_17 aut_18 aut_19 aut_20 aut_21 aut_22 aut_23 aut_24 aut_25 aut_26 aut_27 aut_28 aut_29 aut_30 aut_31 aut_32 aut_33 aut_34 aut_35 aut_36 aut_37 aut_38 aut_39 aut_40 aut_41 aut_42 aut_43 aut_44 aut_45 aut_46 aut_47 aut_48 aut_49 aut_50 aut_51 aut_52 aut_53 aut_54 aut_55 aut_56 aut_57 aut_58 aut_59 aut_60"










