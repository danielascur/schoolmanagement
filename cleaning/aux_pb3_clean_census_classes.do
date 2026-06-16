


		
*1*														
* Organizing Cohorts (Turmas) microdata - 2007-2017
*----------------------------------------------------------------------------------------------------------------------------*

*Obs: With this dataset, we can know which students are enrolled in multietapa" cohorts


*2007-2017
*------------------------------------------------------------------------------------------------------------------------*
forvalues k = 2007/2017 {

	global turmas T EI creche pre EF1 EF2 EF 5grade 9grade EM EMTotal 

	use "$input_census/Turmas`k'.dta", clear

	if `k' <= 2014 {
		keep    ANO_CENSO	PK_COD_TURMA	NO_TURMA	HR_INICIAL	HR_INICIAL_MINUTO	NU_DURACAO_TURMA	NUM_MATRICULAS	FK_COD_MOD_ENSINO	FK_COD_ETAPA_ENSINO	PK_COD_ENTIDADE	FK_COD_ESTADO	FK_COD_MUNICIPIO	ID_LOCALIZACAO	ID_DEPENDENCIA_ADM 
		order   ANO_CENSO	PK_COD_TURMA	NO_TURMA	HR_INICIAL	HR_INICIAL_MINUTO	NU_DURACAO_TURMA	NUM_MATRICULAS	FK_COD_MOD_ENSINO	FK_COD_ETAPA_ENSINO	PK_COD_ENTIDADE	FK_COD_ESTADO	FK_COD_MUNICIPIO	ID_LOCALIZACAO	ID_DEPENDENCIA_ADM 
		rename (ANO_CENSO-ID_DEPENDENCIA_ADM)       (year	codclass	class	begins	beginsminute	last	enrollments	FK_COD_MOD_ENSINO	FK_COD_ETAPA_ENSINO	codschool	coduf	codmunic	location	network)
		destring, replace 
	}
		

	if `k' >= 2015 {
		*Manter as variáveis principais
		keep    NU_ANO_CENSO	ID_TURMA	NO_TURMA TX_HR_INICIAL TX_MI_INICIAL NU_DURACAO_TURMA NU_MATRICULAS	IN_ESPECIAL_EXCLUSIVA IN_REGULAR IN_EJA IN_PROFISSIONALIZANTE TP_ETAPA_ENSINO   CO_ENTIDADE	CO_UF	CO_MUNICIPIO TP_LOCALIZACAO TP_DEPENDENCIA NU_DIAS_ATIVIDADE  TP_MEDIACAO_DIDATICO_PEDAGO IN_DIA_SEMANA_SEGUNDA IN_DIA_SEMANA_TERCA IN_DIA_SEMANA_QUARTA IN_DIA_SEMANA_QUINTA IN_DIA_SEMANA_SEXTA IN_DIA_SEMANA_SABADO IN_DIA_SEMANA_DOMINGO IN_CONVENIADA_PP
		order   NU_ANO_CENSO	ID_TURMA	NO_TURMA TX_HR_INICIAL TX_MI_INICIAL NU_DURACAO_TURMA NU_MATRICULAS	IN_ESPECIAL_EXCLUSIVA IN_REGULAR IN_EJA IN_PROFISSIONALIZANTE TP_ETAPA_ENSINO   CO_ENTIDADE	CO_UF	CO_MUNICIPIO TP_LOCALIZACAO TP_DEPENDENCIA NU_DIAS_ATIVIDADE  TP_MEDIACAO_DIDATICO_PEDAGO IN_DIA_SEMANA_SEGUNDA IN_DIA_SEMANA_TERCA IN_DIA_SEMANA_QUARTA IN_DIA_SEMANA_QUINTA IN_DIA_SEMANA_SEXTA IN_DIA_SEMANA_SABADO IN_DIA_SEMANA_DOMINGO IN_CONVENIADA_PP
		rename (NU_ANO_CENSO-TP_MEDIACAO_DIDATICO_PEDAGO)        (year	codclass	class begins	beginsminute	last	enrollments IN_ESPECIAL_EXCLUSIVA IN_REGULAR IN_EJA	 IN_PROFISSIONALIZANTE FK_COD_ETAPA_ENSINO codschool	coduf	codmunic	location	network days_activity pedagogia)
		destring, replace 
		gen     FK_COD_MOD_ENSINO = 1 if IN_REGULAR            == 1
		replace FK_COD_MOD_ENSINO = 2 if IN_ESPECIAL_EXCLUSIVA == 1
		replace FK_COD_MOD_ENSINO = 3 if IN_EJA                == 1
		replace FK_COD_MOD_ENSINO = 4 if IN_PROFISSIONALIZANTE == 1
		drop IN_REGULAR IN_ESPECIAL_EXCLUSIVA IN_EJA
		order 								        (year	codclass	class begins	beginsminute	last	enrollments FK_COD_MOD_ENSINO   FK_COD_ETAPA_ENSINO	codschool	coduf	codmunic	location	network)
	}
	
		gen tclassEI        = 1 if  FK_COD_ETAPA_ENSINO == 1 | FK_COD_ETAPA_ENSINO == 2 | FK_COD_ETAPA_ENSINO == 3
		gen tclasscreche    = 1 if  FK_COD_ETAPA_ENSINO == 1
		gen tclasspre       = 1 if  FK_COD_ETAPA_ENSINO == 2
		gen tclassUnificada = 1 if  FK_COD_ETAPA_ENSINO == 3
		gen tclassEF1 		= 1 if (FK_COD_ETAPA_ENSINO >= 4 & FK_COD_ETAPA_ENSINO  <= 7)  | (FK_COD_ETAPA_ENSINO >= 14 & FK_COD_ETAPA_ENSINO  <= 18)
		gen tclassEF2 		= 1 if (FK_COD_ETAPA_ENSINO >= 8 & FK_COD_ETAPA_ENSINO  <= 11) | (FK_COD_ETAPA_ENSINO >= 19 & FK_COD_ETAPA_ENSINO  <= 21) | (FK_COD_ETAPA_ENSINO == 41)
		gen tclassMultiEIEF = 1 if  FK_COD_ETAPA_ENSINO == 56
		gen tclassMulti8    = 1 if  FK_COD_ETAPA_ENSINO == 12
		gen tclassMulti9    = 1 if  FK_COD_ETAPA_ENSINO == 22
		gen tclassMulti8AD  = 1 if  FK_COD_ETAPA_ENSINO == 13
		gen tclassMulti9AD  = 1 if  FK_COD_ETAPA_ENSINO == 23
		gen tclassMulti89   = 1 if  FK_COD_ETAPA_ENSINO == 24
		gen tclass1grade 	= 1 if  FK_COD_ETAPA_ENSINO == 14
		gen tclass2grade 	= 1 if (FK_COD_ETAPA_ENSINO == 4  | FK_COD_ETAPA_ENSINO == 15)
		gen tclass3grade 	= 1 if (FK_COD_ETAPA_ENSINO == 5  | FK_COD_ETAPA_ENSINO == 16)
		gen tclass4grade 	= 1 if (FK_COD_ETAPA_ENSINO == 6  | FK_COD_ETAPA_ENSINO == 17)
		gen tclass5grade 	= 1 if (FK_COD_ETAPA_ENSINO == 7  | FK_COD_ETAPA_ENSINO == 18)
		gen tclass6grade 	= 1 if (FK_COD_ETAPA_ENSINO == 8  | FK_COD_ETAPA_ENSINO == 19)
		gen tclass7grade 	= 1 if (FK_COD_ETAPA_ENSINO == 9  | FK_COD_ETAPA_ENSINO == 20)
		gen tclass8grade	= 1 if (FK_COD_ETAPA_ENSINO == 10 | FK_COD_ETAPA_ENSINO == 21)
		gen tclass9grade 	= 1 if (FK_COD_ETAPA_ENSINO == 11 | FK_COD_ETAPA_ENSINO == 41)
		gen tclassEM1 		= 1 if  FK_COD_ETAPA_ENSINO == 25
		gen tclassEM2 		= 1 if  FK_COD_ETAPA_ENSINO == 26
		gen tclassEM3 		= 1 if  FK_COD_ETAPA_ENSINO == 27
		gen tclassEM4 		= 1 if  FK_COD_ETAPA_ENSINO == 28
		gen tclassEMns 		= 1 if  FK_COD_ETAPA_ENSINO == 29
		gen tclassEM  		= 1 if (FK_COD_ETAPA_ENSINO >= 25 & FK_COD_ETAPA_ENSINO <= 29)
		gen tclassEM1int 	= 1 if  FK_COD_ETAPA_ENSINO == 30
		gen tclassEM2int 	= 1 if  FK_COD_ETAPA_ENSINO == 31
		gen tclassEM3int 	= 1 if  FK_COD_ETAPA_ENSINO == 32
		gen tclassEM4int 	= 1 if  FK_COD_ETAPA_ENSINO == 33
		gen tclassEMnsint 	= 1 if  FK_COD_ETAPA_ENSINO == 34
		gen tclassEMint   	= 1 if  FK_COD_ETAPA_ENSINO >= 30  & FK_COD_ETAPA_ENSINO <= 34
		gen tclassEM1mag 	= 1 if  FK_COD_ETAPA_ENSINO == 35
		gen tclassEM2mag 	= 1 if  FK_COD_ETAPA_ENSINO == 36
		gen tclassEM3mag 	= 1 if  FK_COD_ETAPA_ENSINO == 37
		gen tclassEM4mag 	= 1 if  FK_COD_ETAPA_ENSINO == 38
		gen tclassEMmag  	= 1 if  FK_COD_ETAPA_ENSINO >= 35 & FK_COD_ETAPA_ENSINO <= 38
		gen tclassEMconc  	= 1 if  FK_COD_ETAPA_ENSINO == 39 | FK_COD_ETAPA_ENSINO == 40  | FK_COD_ETAPA_ENSINO == 64 | FK_COD_ETAPA_ENSINO == 68 //Ensino Técnico concomitante, Ensino Técnico subsequente, 
		gen tclassEMtec 	= 1 if tclassEMint 	== 1 | tclassEMconc == 1
		gen tclassEMst 		= 1 if tclassEM 	== 1 | tclassEMmag == 1
		gen tclassEMTotal 	= 1 if tclassEMst 	== 1 | tclassEMtec == 1
		gen tclassEMp 		= 1 if (FK_COD_ETAPA_ENSINO >= 25 & FK_COD_ETAPA_ENSINO <= 27) | (FK_COD_ETAPA_ENSINO >= 30 & FK_COD_ETAPA_ENSINO <= 32) | (FK_COD_ETAPA_ENSINO >= 35 & FK_COD_ETAPA_ENSINO <= 37) 
		gen tclassEF  		= 1 if tclassEF1 == 1 | tclassEF2 == 1
		egen    tclassMulti = rsum(tclassMultiEIEF tclassMulti8 tclassMulti9 tclassMulti8AD tclassMulti9AD tclassMulti89)
		replace tclassMulti = . if tclassMulti == 0
		gen tclassEFTotal 	= 1 if tclassEF ~=.  | tclassMulti ~= .
		
	*EF EJA 
	if `k' <= 2008 {
		gen tclassEFEJA  	= 1 if  FK_COD_ETAPA_ENSINO == 43 | FK_COD_ETAPA_ENSINO == 44 | FK_COD_ETAPA_ENSINO == 46 | FK_COD_ETAPA_ENSINO == 47  | FK_COD_ETAPA_ENSINO == 49 | FK_COD_ETAPA_ENSINO == 50 | FK_COD_ETAPA_ENSINO == 51 | FK_COD_ETAPA_ENSINO == 53 | FK_COD_ETAPA_ENSINO == 54 | FK_COD_ETAPA_ENSINO == 58 | FK_COD_ETAPA_ENSINO == 59
	}
	
	if `k' >= 2009 & `k' <= 2014 {
		gen tclassEFEJA  	= 1 if  FK_COD_ETAPA_ENSINO == 43 | FK_COD_ETAPA_ENSINO == 44 | FK_COD_ETAPA_ENSINO == 46 | FK_COD_ETAPA_ENSINO == 47  | FK_COD_ETAPA_ENSINO == 51 | FK_COD_ETAPA_ENSINO == 58 | FK_COD_ETAPA_ENSINO == 60 | FK_COD_ETAPA_ENSINO == 61  | FK_COD_ETAPA_ENSINO == 65 
	}
	
	if `k' >= 2015 {
		gen tclassEFEJA  	= 1 if  FK_COD_ETAPA_ENSINO == 65 | FK_COD_ETAPA_ENSINO == 69 | FK_COD_ETAPA_ENSINO == 70 | FK_COD_ETAPA_ENSINO == 72 | FK_COD_ETAPA_ENSINO == 73 
	}

	*EM EJA
	if `k' <= 2008 {
		gen tclassEMEJA  	= 1 if  FK_COD_ETAPA_ENSINO == 45 | FK_COD_ETAPA_ENSINO == 48 | FK_COD_ETAPA_ENSINO == 52 | FK_COD_ETAPA_ENSINO == 55  | FK_COD_ETAPA_ENSINO == 57
		gen tclassFIC 		= .
		gen tclassFICEJA 	= .
	}
	
	if `k' >= 2009 & `k' <= 2014 {
		gen tclassEMEJA  	= 1 if  FK_COD_ETAPA_ENSINO == 45 | FK_COD_ETAPA_ENSINO == 48 | FK_COD_ETAPA_ENSINO == 62 | FK_COD_ETAPA_ENSINO == 63 
		gen tclassFIC 		= .
		gen tclassFICEJA 	= .
	}
	
	if `k' >= 2015 {
		gen tclassEMEJA  	= 1 if  FK_COD_ETAPA_ENSINO == 67 | FK_COD_ETAPA_ENSINO == 71 | FK_COD_ETAPA_ENSINO == 74
		gen tclassFIC    	= 1 if  FK_COD_ETAPA_ENSINO == 68		//curso FIC concomitante
		gen tclassFICEJA 	= 1 if  FK_COD_ETAPA_ENSINO == 67		//curso FIC EJA
	}
	
	*Total de matrículas
	gen tclassT = . 
	foreach i in $turmas {
		replace tclassT = 1 if tclass`i' == 1
	} 
	
	*Educação regular, educação especial e EJA
	gen     type = 1 if FK_COD_MOD_ENSINO == 1
	replace type = 2 if FK_COD_MOD_ENSINO == 2
	replace type = 3 if FK_COD_MOD_ENSINO == 3
	
	keep year codclass enrollments last coduf   codmunic	location	network	type codschool tclass*
	save "$output_census/Turmas`k'.dta", replace

}


*2*																
*CLEANING
*--------------------------------------------------------------------------------------------------------------------------------*

*Format
*----------------------------------------------------------------------------------------------------------------------------*
cap program drop formatacao
program define   formatacao

	#delimit ;
	
	gen 	uf = "RO" if coduf == 11; replace uf = "AC" if coduf == 12; replace uf = "AM" if coduf == 13; replace uf = "RR" if coduf == 14;
	replace uf = "PA" if coduf == 15; replace uf = "AP" if coduf == 16; replace uf = "TO" if coduf == 17; replace uf = "MA" if coduf == 21;
	replace uf = "PI" if coduf == 22; replace uf = "CE" if coduf == 23; replace uf = "RN" if coduf == 24; replace uf = "PB" if coduf == 25;
	replace uf = "PE" if coduf == 26; replace uf = "AL" if coduf == 27; replace uf = "SE" if coduf == 28; replace uf = "BA" if coduf == 29;
	replace uf = "MG" if coduf == 31; replace uf = "ES" if coduf == 32; replace uf = "RJ" if coduf == 33; replace uf = "SP" if coduf == 35;
	replace uf = "PR" if coduf == 41; replace uf = "SC" if coduf == 42; replace uf = "RS" if coduf == 43; replace uf = "MS" if coduf == 50;
	replace uf = "MT" if coduf == 51; replace uf = "GO" if coduf == 52; replace uf = "DF" if coduf == 53;
	#delimit cr
	
	cap label define state 11 "RO" 12 "AC" 13 "AM" 14 "RR" 15 "PA" 16 "AP" 17 "TO" ///
			       21 "MA" 22 "PI" 23 "CE" 24 "RN" 25 "PB" 26 "PE" 27 "AL" 28 "SE" 29 "BA" ///
			       31 "MG" 32 "ES" 33 "RJ" 35 "SP" ///
			       41 "PR" 42 "SC" 43 "RS" ///
			       50 "MS" 51 "MT" 52 "GO" 53 "DF"
	label val coduf state
	
	cap drop codmunic2 // if there is codmunic2, dropping and creating again
	gen 	 codmunic2 = substr(string(codmunic), 1,6)
	destring codmunic2, replace
	
	cap label define network 1 "Federal" 2 "State" 3 "Municipal" 4 "Private"
	cap label define location 1 "Urban" 2 "Rural"
	label val location location
	label val network network
	
end




*2007-2017
*------------------------------------------------------------------------------------------------------------------------*
clear
forvalues k = 2007/2017  {		
		append using "$output_census/Turmas`k'.dta"
		*erase  		 "$output_census/Turmas`k'.dta"
}
compress

* Formatting 

	#delimit ;
	gen 	uf = "RO" if coduf == 11; replace uf = "AC" if coduf == 12; replace uf = "AM" if coduf == 13; replace uf = "RR" if coduf == 14;
	replace uf = "PA" if coduf == 15; replace uf = "AP" if coduf == 16; replace uf = "TO" if coduf == 17; replace uf = "MA" if coduf == 21;
	replace uf = "PI" if coduf == 22; replace uf = "CE" if coduf == 23; replace uf = "RN" if coduf == 24; replace uf = "PB" if coduf == 25;
	replace uf = "PE" if coduf == 26; replace uf = "AL" if coduf == 27; replace uf = "SE" if coduf == 28; replace uf = "BA" if coduf == 29;
	replace uf = "MG" if coduf == 31; replace uf = "ES" if coduf == 32; replace uf = "RJ" if coduf == 33; replace uf = "SP" if coduf == 35;
	replace uf = "PR" if coduf == 41; replace uf = "SC" if coduf == 42; replace uf = "RS" if coduf == 43; replace uf = "MS" if coduf == 50;
	replace uf = "MT" if coduf == 51; replace uf = "GO" if coduf == 52; replace uf = "DF" if coduf == 53;
	#delimit cr
	
	cap label define state 11 "RO" 12 "AC" 13 "AM" 14 "RR" 15 "PA" 16 "AP" 17 "TO" ///
			       21 "MA" 22 "PI" 23 "CE" 24 "RN" 25 "PB" 26 "PE" 27 "AL" 28 "SE" 29 "BA" ///
			       31 "MG" 32 "ES" 33 "RJ" 35 "SP" ///
			       41 "PR" 42 "SC" 43 "RS" ///
			       50 "MS" 51 "MT" 52 "GO" 53 "DF"
	label val coduf state
	
	cap drop codmunic2 // if there is codmunic2, dropping and creating again
	gen 	 codmunic2 = substr(string(codmunic), 1,6)
	destring codmunic2, replace
	
	cap label define network 1 "Federal" 2 "State" 3 "Municipal" 4 "Private"
	cap label define location 1 "Urban" 2 "Rural"
	label val location location
	label val network network


save "$output_census/Turmas.dta", replace


* Average cohort size
*------------------------------------------------------------------------------------------------------------------------*
foreach x in $turmas {
	gen	 	classhour`x' = last/60 			if tclass`x' == 1 	//duração da aula, em horas
	replace tclass`x' 	 = enrollments 		if tclass`x' == 1 	//número de alunos na turma
}

* By School
*------------------------------------------------------------------------------------------------------------------------*

preserve
collapse (mean) tclass*, by (year network coduf uf codmunic codmunic2 codschool)		//tamanho médio das turmas

sort year codschool -tclassEI  // there are some duplicates with different number of tclassEI
by  year codschool:  gen dup_tag = cond(_N==1, 0, _n) 
drop if dup_tag > 1 
drop dup_tag

save "$output_census/Class-Size at school level.dta", replace
restore


