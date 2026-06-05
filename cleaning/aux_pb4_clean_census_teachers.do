
*1*
* CONVERTING FROM .CSV TO .DTA
*--------------------------------------------------------------------------------------------------------------------------------*

*2014-2017*
	forvalues year = 2014/2017 {
		foreach region in CO NORDESTE SUDESTE SUL NORTE {
			import delimited "$input_census/`year'/DADOS/DOCENTES_`region'.CSV" , delimiter("|") clear
			rename *, upper
			save "$output_census/Professores`year'`region'", replace
		}	
	}

													
*2*
*PROGRAMA PARA PADRONIZAÇÃO DOS DADOS
*--------------------------------------------------------------------------------------------------------------------------------*
cap program drop Professores
program define Professores
syntax, ano(string) divisao(string)

	local Teacher 1Grade 2Grade 3Grade 4Grade 5Grade 6Grade 7Grade 8Grade 9Grade
	
	if `ano' == 2007 | `ano' == 2008 | `ano' == 2009 | `ano' == 2010{
		keep    ANO_CENSO	FK_COD_DOCENTE	NU_DIA	NU_MES	NU_ANO	NUM_IDADE	TP_SEXO	TP_COR_RACA	FK_COD_ESCOLARIDADE	ID_ESPECIALIZACAO	ID_MESTRADO	ID_DOUTORADO	ID_TIPO_DOCENTE	PK_COD_TURMA	FK_COD_MOD_ENSINO	FK_COD_ETAPA_ENSINO	PK_COD_ENTIDADE	FK_COD_ESTADO	FK_COD_MUNICIPIO	ID_LOCALIZACAO	ID_DEPENDENCIA_ADM ID_QUIMICA-ID_OUTRAS_DISCIPLINAS
		order   ANO_CENSO	FK_COD_DOCENTE	NU_DIA	NU_MES	NU_ANO	NUM_IDADE	TP_SEXO	TP_COR_RACA	FK_COD_ESCOLARIDADE	ID_ESPECIALIZACAO	ID_MESTRADO	ID_DOUTORADO	ID_TIPO_DOCENTE	PK_COD_TURMA	FK_COD_MOD_ENSINO	FK_COD_ETAPA_ENSINO	PK_COD_ENTIDADE	FK_COD_ESTADO	FK_COD_MUNICIPIO	ID_LOCALIZACAO	ID_DEPENDENCIA_ADM ID_QUIMICA-ID_OUTRAS_DISCIPLINAS
		rename (ANO_CENSO-ID_DEPENDENCIA_ADM) (year	codteacher	birthday	birthmonth	birthyear	age	gender	color	schoolattainment	specialization	master	phd	occupation	codclass	FK_COD_MOD_ENSINO	FK_COD_ETAPA_ENSINO	codschool	coduf	codmunic	location	network)
	}
			
	if `ano' == 2011 | `ano' == 2012 |`ano' == 2013  | `ano' == 2014{
		keep    ANO_CENSO	FK_COD_DOCENTE	NU_DIA	NU_MES	NU_ANO	NUM_IDADE	TP_SEXO	TP_COR_RACA	FK_COD_ESCOLARIDADE	ID_ESPECIALIZACAO	ID_MESTRADO	ID_DOUTORADO	ID_TIPO_DOCENTE	ID_TIPO_CONTRATACAO	PK_COD_TURMA	FK_COD_MOD_ENSINO	FK_COD_ETAPA_ENSINO	PK_COD_ENTIDADE	FK_COD_ESTADO	FK_COD_MUNICIPIO	ID_LOCALIZACAO	ID_DEPENDENCIA_ADM ID_QUIMICA-ID_OUTRAS_DISCIPLINAS 
		order   ANO_CENSO	FK_COD_DOCENTE	NU_DIA	NU_MES	NU_ANO	NUM_IDADE	TP_SEXO	TP_COR_RACA	FK_COD_ESCOLARIDADE	ID_ESPECIALIZACAO	ID_MESTRADO	ID_DOUTORADO	ID_TIPO_DOCENTE	ID_TIPO_CONTRATACAO	PK_COD_TURMA	FK_COD_MOD_ENSINO	FK_COD_ETAPA_ENSINO	PK_COD_ENTIDADE	FK_COD_ESTADO	FK_COD_MUNICIPIO	ID_LOCALIZACAO	ID_DEPENDENCIA_ADM ID_QUIMICA-ID_OUTRAS_DISCIPLINAS
		rename (ANO_CENSO-ID_DEPENDENCIA_ADM) (year	codteacher	birthday	birthmonth	birthyear	age	gender	color	schoolattainment	specialization	master	phd	occupation	contract	codclass	FK_COD_MOD_ENSINO	FK_COD_ETAPA_ENSINO	codschool	coduf	codmunic	location	network)
	}	
	
	if `ano' == 2015 {
		keep    NU_ANO_CENSO CO_PESSOA_FISICA NU_DIA	NU_MES	NU_ANO	NU_IDADE TP_SEXO	TP_COR_RACA TP_ESCOLARIDADE IN_ESPECIALIZACAO	IN_MESTRADO	IN_DOUTORADO TP_TIPO_DOCENTE TP_TIPO_CONTRATACAO ID_TURMA IN_ESPECIAL_EXCLUSIVA IN_REGULAR IN_EJA TP_ETAPA_ENSINO CO_ENTIDADE CO_UF CO_MUNICIPIO TP_LOCALIZACAO TP_DEPENDENCIA IN_DISC*
		order   NU_ANO_CENSO CO_PESSOA_FISICA NU_DIA	NU_MES	NU_ANO	NU_IDADE TP_SEXO	TP_COR_RACA TP_ESCOLARIDADE IN_ESPECIALIZACAO	IN_MESTRADO	IN_DOUTORADO TP_TIPO_DOCENTE TP_TIPO_CONTRATACAO ID_TURMA IN_ESPECIAL_EXCLUSIVA IN_REGULAR IN_EJA TP_ETAPA_ENSINO CO_ENTIDADE CO_UF CO_MUNICIPIO TP_LOCALIZACAO TP_DEPENDENCIA IN_DISC*
		rename  TP_ETAPA_ENSINO FK_COD_ETAPA_ENSINO
		rename (NU_ANO_CENSO-TP_DEPENDENCIA) (year	codteacher	birthday	birthmonth	birthyear	age	gender	color	schoolattainment	specialization	master	phd	occupation	contract	codclass IN_ESPECIAL_EXCLUSIVA IN_REGULAR IN_EJA FK_COD_ETAPA_ENSINO	codschool	coduf	codmunic	location	network)
		destring, replace 
		gen     FK_COD_MOD_ENSINO = 1 if IN_REGULAR            == 1
		replace FK_COD_MOD_ENSINO = 2 if IN_ESPECIAL_EXCLUSIVA == 1
		replace FK_COD_MOD_ENSINO = 3 if IN_EJA                == 1
		drop IN_REGULAR IN_ESPECIAL_EXCLUSIVA IN_EJA
	}	
	
	if `ano' > 2015 {
		keep    NU_ANO_CENSO CO_PESSOA_FISICA NU_DIA	NU_MES	NU_ANO	NU_IDADE TP_SEXO	TP_COR_RACA TP_ESCOLARIDADE IN_ESPECIALIZACAO	IN_MESTRADO	IN_DOUTORADO TP_TIPO_DOCENTE TP_TIPO_CONTRATACAO ID_TURMA IN_ESPECIAL_EXCLUSIVA IN_REGULAR IN_EJA TP_ETAPA_ENSINO CO_ENTIDADE CO_UF CO_MUNICIPIO TP_LOCALIZACAO TP_DEPENDENCIA TP_NORMAL_MAGISTERIO	TP_SITUACAO_CURSO_1	CO_AREA_CURSO_1	CO_CURSO_1	IN_LICENCIATURA_1	IN_COM_PEDAGOGICA_1	NU_ANO_INICIO_1	NU_ANO_CONCLUSAO_1	TP_TIPO_IES_1	CO_IES_1	TP_SITUACAO_CURSO_2	CO_AREA_CURSO_2	CO_CURSO_2	IN_LICENCIATURA_2	IN_COM_PEDAGOGICA_2	NU_ANO_INICIO_2	NU_ANO_CONCLUSAO_2	TP_TIPO_IES_2	CO_IES_2	TP_SITUACAO_CURSO_3	CO_AREA_CURSO_3	CO_CURSO_3	IN_LICENCIATURA_3	IN_COM_PEDAGOGICA_3	NU_ANO_INICIO_3	NU_ANO_CONCLUSAO_3	TP_TIPO_IES_3	CO_IES_3	IN_DISC_QUIMICA	IN_DISC_FISICA	IN_DISC_MATEMATICA	IN_DISC_BIOLOGIA	IN_DISC_CIENCIAS	IN_DISC_LINGUA_PORTUGUESA	IN_DISC_LINGUA_INGLES	IN_DISC_LINGUA_ESPANHOL	IN_DISC_LINGUA_FRANCES	IN_DISC_LINGUA_OUTRA	IN_DISC_LINGUA_INDIGENA	IN_DISC_ARTES	IN_DISC_EDUCACAO_FISICA	IN_DISC_HISTORIA	IN_DISC_GEOGRAFIA	IN_DISC_FILOSOFIA	IN_DISC_ENSINO_RELIGIOSO	IN_DISC_ESTUDOS_SOCIAIS	IN_DISC_SOCIOLOGIA	IN_DISC_EST_SOCIAIS_SOCIOLOGIA	IN_DISC_INFORMATICA_COMPUTACAO	IN_DISC_PROFISSIONALIZANTE	IN_DISC_ATENDIMENTO_ESPECIAIS	IN_DISC_DIVER_SOCIO_CULTURAL	IN_DISC_LIBRAS	IN_DISC_PEDAGOGICAS	IN_DISC_OUTRAS	IN_ESPECIFICO_CRECHE	IN_ESPECIFICO_PRE_ESCOLA	IN_ESPECIFICO_ANOS_INICIAIS	IN_ESPECIFICO_ANOS_FINAIS	IN_ESPECIFICO_ENS_MEDIO	IN_ESPECIFICO_EJA	IN_ESPECIFICO_ED_ESPECIAL	IN_ESPECIFICO_ED_INDIGENA	IN_ESPECIFICO_CAMPO	IN_ESPECIFICO_AMBIENTAL	IN_ESPECIFICO_DIR_HUMANOS	IN_ESPECIFICO_DIV_SEXUAL	IN_ESPECIFICO_DIR_ADOLESC	IN_ESPECIFICO_AFRO	IN_ESPECIFICO_OUTROS	IN_ESPECIFICO_NENHUM
		order   NU_ANO_CENSO CO_PESSOA_FISICA NU_DIA	NU_MES	NU_ANO	NU_IDADE TP_SEXO	TP_COR_RACA TP_ESCOLARIDADE IN_ESPECIALIZACAO	IN_MESTRADO	IN_DOUTORADO TP_TIPO_DOCENTE TP_TIPO_CONTRATACAO ID_TURMA IN_ESPECIAL_EXCLUSIVA IN_REGULAR IN_EJA TP_ETAPA_ENSINO CO_ENTIDADE CO_UF CO_MUNICIPIO TP_LOCALIZACAO TP_DEPENDENCIA TP_NORMAL_MAGISTERIO	TP_SITUACAO_CURSO_1	CO_AREA_CURSO_1	CO_CURSO_1	IN_LICENCIATURA_1	IN_COM_PEDAGOGICA_1	NU_ANO_INICIO_1	NU_ANO_CONCLUSAO_1	TP_TIPO_IES_1	CO_IES_1	TP_SITUACAO_CURSO_2	CO_AREA_CURSO_2	CO_CURSO_2	IN_LICENCIATURA_2	IN_COM_PEDAGOGICA_2	NU_ANO_INICIO_2	NU_ANO_CONCLUSAO_2	TP_TIPO_IES_2	CO_IES_2	TP_SITUACAO_CURSO_3	CO_AREA_CURSO_3	CO_CURSO_3	IN_LICENCIATURA_3	IN_COM_PEDAGOGICA_3	NU_ANO_INICIO_3	NU_ANO_CONCLUSAO_3	TP_TIPO_IES_3	CO_IES_3	IN_DISC_QUIMICA	IN_DISC_FISICA	IN_DISC_MATEMATICA	IN_DISC_BIOLOGIA	IN_DISC_CIENCIAS	IN_DISC_LINGUA_PORTUGUESA	IN_DISC_LINGUA_INGLES	IN_DISC_LINGUA_ESPANHOL	IN_DISC_LINGUA_FRANCES	IN_DISC_LINGUA_OUTRA	IN_DISC_LINGUA_INDIGENA	IN_DISC_ARTES	IN_DISC_EDUCACAO_FISICA	IN_DISC_HISTORIA	IN_DISC_GEOGRAFIA	IN_DISC_FILOSOFIA	IN_DISC_ENSINO_RELIGIOSO	IN_DISC_ESTUDOS_SOCIAIS	IN_DISC_SOCIOLOGIA	IN_DISC_EST_SOCIAIS_SOCIOLOGIA	IN_DISC_INFORMATICA_COMPUTACAO	IN_DISC_PROFISSIONALIZANTE	IN_DISC_ATENDIMENTO_ESPECIAIS	IN_DISC_DIVER_SOCIO_CULTURAL	IN_DISC_LIBRAS	IN_DISC_PEDAGOGICAS	IN_DISC_OUTRAS	IN_ESPECIFICO_CRECHE	IN_ESPECIFICO_PRE_ESCOLA	IN_ESPECIFICO_ANOS_INICIAIS	IN_ESPECIFICO_ANOS_FINAIS	IN_ESPECIFICO_ENS_MEDIO	IN_ESPECIFICO_EJA	IN_ESPECIFICO_ED_ESPECIAL	IN_ESPECIFICO_ED_INDIGENA	IN_ESPECIFICO_CAMPO	IN_ESPECIFICO_AMBIENTAL	IN_ESPECIFICO_DIR_HUMANOS	IN_ESPECIFICO_DIV_SEXUAL	IN_ESPECIFICO_DIR_ADOLESC	IN_ESPECIFICO_AFRO	IN_ESPECIFICO_OUTROS	IN_ESPECIFICO_NENHUM
		rename  TP_ETAPA_ENSINO FK_COD_ETAPA_ENSINO
		rename (NU_ANO_CENSO-TP_DEPENDENCIA) (year	codteacher	birthday	birthmonth	birthyear	age	gender	color	schoolattainment	specialization	master	phd	occupation	contract	codclass IN_ESPECIAL_EXCLUSIVA IN_REGULAR IN_EJA FK_COD_ETAPA_ENSINO	codschool	coduf	codmunic	location	network)
		destring, replace 
		gen     FK_COD_MOD_ENSINO = 1 if IN_REGULAR            == 1
		replace FK_COD_MOD_ENSINO = 2 if IN_ESPECIAL_EXCLUSIVA == 1
		replace FK_COD_MOD_ENSINO = 3 if IN_EJA                == 1
		drop IN_REGULAR IN_ESPECIAL_EXCLUSIVA IN_EJA
	}	
	
	destring, replace
	format codteacher codschool codmunic %15.0g
			
	label define network  1 "Federal"           2 "State" 3 "Municipal" 4 "Private"
	label define location 1 "Urban"             2 "Rural"
	label val 	 location location
	label val 	 network  network

	*Educação regular, educação especial e EJA
	gen 	type = 1 if FK_COD_MOD_ENSINO == 1
	replace type = 2 if FK_COD_MOD_ENSINO == 2
	replace type = 3 if FK_COD_MOD_ENSINO == 3
	label 	define type 1 "Regular Education" 2 "Special Education" 3 "Adult Education" 
	label 	val    type type
	drop if type == . 
	
	/*
	*Creche e pre escola
	gen LTeacherEI        = 1 if FK_COD_ETAPA_ENSINO == 1 | FK_COD_ETAPA_ENSINO == 2 | FK_COD_ETAPA_ENSINO == 3
	gen LTeacherCreche    = 1 if FK_COD_ETAPA_ENSINO == 1
	gen LTeacherPre       = 1 if FK_COD_ETAPA_ENSINO == 2
	gen LTeacherUnificada = 1 if FK_COD_ETAPA_ENSINO == 3
	*/			
			
	*1º ou 2º Ciclos do EF
	gen LTeacherEF1 = 1 if (FK_COD_ETAPA_ENSINO >= 4 & FK_COD_ETAPA_ENSINO  <= 7)  | (FK_COD_ETAPA_ENSINO >= 14 & FK_COD_ETAPA_ENSINO  <= 18)
	gen LTeacherEF2 = 1 if (FK_COD_ETAPA_ENSINO >= 8 & FK_COD_ETAPA_ENSINO  <= 11) | (FK_COD_ETAPA_ENSINO >= 19 & FK_COD_ETAPA_ENSINO  <= 21) | (FK_COD_ETAPA_ENSINO == 41)
	gen LTeacherEF  = 1 if LTeacherEF1 == 1 | LTeacherEF2 == 1
		
	/*
	*1º ao 9º anos do EF
	gen LTeacherMultiEIEF = 1 if FK_COD_ETAPA_ENSINO == 56
	gen LTeacherMulti8    = 1 if FK_COD_ETAPA_ENSINO == 12
	gen LTeacherMulti9    = 1 if FK_COD_ETAPA_ENSINO == 22
	gen LTeacherMulti8AD  = 1 if FK_COD_ETAPA_ENSINO == 13
	gen LTeacherMulti9AD  = 1 if FK_COD_ETAPA_ENSINO == 23
	gen LTeacherMulti89   = 1 if FK_COD_ETAPA_ENSINO == 24
	*/
	
	gen LTeacher1grade = 1 if FK_COD_ETAPA_ENSINO == 14
	gen LTeacher2grade = 1 if (FK_COD_ETAPA_ENSINO == 4  | FK_COD_ETAPA_ENSINO == 15)
	gen LTeacher3grade = 1 if (FK_COD_ETAPA_ENSINO == 5  | FK_COD_ETAPA_ENSINO == 16)
	gen LTeacher4grade = 1 if (FK_COD_ETAPA_ENSINO == 6  | FK_COD_ETAPA_ENSINO == 17)
	gen LTeacher5grade = 1 if (FK_COD_ETAPA_ENSINO == 7  | FK_COD_ETAPA_ENSINO == 18)
	gen LTeacher6grade = 1 if (FK_COD_ETAPA_ENSINO == 8  | FK_COD_ETAPA_ENSINO == 19)
	gen LTeacher7grade = 1 if (FK_COD_ETAPA_ENSINO == 9  | FK_COD_ETAPA_ENSINO == 20)
	gen LTeacher8grade = 1 if (FK_COD_ETAPA_ENSINO == 10 | FK_COD_ETAPA_ENSINO == 21)
	gen LTeacher9grade = 1 if (FK_COD_ETAPA_ENSINO == 11 | FK_COD_ETAPA_ENSINO == 41)
	
	*Identificação dos docentes
	gen     occupation2 = 1 if occupation == 0 & year == 2007
	replace occupation2 = 1 if occupation == 1 & year >  2007 //Em 2008, no dicionário está que essa variável é igual a 0 para docentes, mas na base a maior parte está como 1
	replace occupation2 = 2 if occupation == 2 & year >  2008
	replace occupation2 = 3 if occupation == 3 & year >  2008
	replace occupation2 = 4 if occupation == 4 & year >  2010
	replace occupation2 = 5 if occupation == 5 & year >= 2015
	replace occupation2 = 6 if occupation == 6 & year >= 2015
	
	label 	define occupation 1 "Docente" 2 "Auxiliar da educação infantil" 3 "Monitor" 4 "Intérprete de Libras" 5 "Docente tutor - EAD" 6 "Docente auxiliar - EAD"
	label 	val    occupation2 occupation
	
	save "$output_census/Professores Harmonizado_`ano'`divisao'.dta", replace

	*Professores por escola
	keep if occupation2 == 1 		
		
		
		if `ano'  < 2011 {			
			collapse (mean) LTeacher*,			   			 by (year codteacher occupation2 network codschool codmunic coduf)
		}
		if `ano' >= 2011 {
			egen mincontrato = min(contract), by (codteacher network codschool)
			replace contract = 1 if mincontrato == 1 		//se o professor aparece na base uma vez como concursado, vamos considerá-lo concursado, a ocorrência de professor = temporário provavelmente é um erro
			replace contract = 2 if contract    ~= 1
			collapse (mean) LTeacher*,			   			 by (year codteacher occupation2 network codschool codmunic coduf contract location)
		}
		foreach var of varlist LTeacher* {
			local newname = substr("`var'", 2, .)
			rename `var'  `newname'
		}
		collapse (sum)  Teacher*,			   				 by (year coduf network codmunic codschool)
	
	save "$output_census/Professores por escola_`ano'`divisao'.dta", replace

	/*
	Nessa base, cada linha é uma turma. Um professor pode aparecer mais de uma vez se: 

	(1) Der aula em mais de uma turma.
	(2) Se lecionar em diferentes redes de ensino, por exemplo, rede municipal e estadual.
	(3) Se der aula em duas escolas diferentes.

	*/

end



*3*																
*APLICANDO O PROGRAMA
*--------------------------------------------------------------------------------------------------------------------------------*
	foreach year in 2007 2009 2010 2011 2012 2013  {
		foreach region in RO AC AM RR PA AP TO MA PI CE RN PB PE AL SE BA MG ES RJ SP PR SC RS MS MT GO DF{
			use "$output_census/Professores`year'`region'.dta", clear
			Professores, ano(`year') divisao(`region')
		}
	}


	foreach year in 2014 2015 2016 2017 { 
		foreach region in CO NORDESTE NORTE SUDESTE SUL {
			use "$output_census/Professores`year'`region'.dta", clear
			Professores, ano(`year') divisao(`region')		
		}
	}



*4*																
*CLEANING
*--------------------------------------------------------------------------------------------------------------------------------*
	clear
	foreach year in 2007 2009 2010 2011 2012 2013 { 
		foreach region in RO AC AM RR PA AP TO MA PI CE RN PB PE AL SE BA MG ES RJ SP PR SC RS MS MT GO DF {
			append using "$output_census/Professores por escola_`year'`region'.dta",
		}
	}

	foreach year in 2014 2015 2016 2017 { 
		foreach region in NORTE NORDESTE SUL SUDESTE CO {
			append using "$output_census/Professores por escola_`year'`region'.dta"
		}
	}
	save "$output_census/Teachers per school.dta", replace
	
		
