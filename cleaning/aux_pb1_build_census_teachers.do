clear all
set more off


/* -------------------------------------------------------------------------- */
/* 2007                                    */
/* -------------------------------------------------------------------------- */
foreach i in RO AC RR PA AP TO MA PI CE RN PB PE AL SE BA MG ES RJ SP PR SC RS MS MT GO DF {
	infix  ///
	str ANO_CENSO                       1  -  4 ///
	str FK_COD_DOCENTE                  5  -  16 ///
	str NU_DIA                          17 -  18 ///
	str NU_MES                          19 -  20 ///
	str NU_ANO                          21 -  24 ///
	str NUM_IDADE                       25 -  27 ///
	str TP_SEXO                         28 -  28 ///
	str TP_COR_RACA                     29 -  29 ///
	str TP_NACIONALIDADE                30 -  30 ///
	str FK_COD_PAIS_ORIGEM              31 -  33 ///
	str FK_COD_ESTADO_DNASC             34 -  35 ///
	str SIGLA_ESTADO_DNASC              36 -  37 ///
	str FK_COD_MUNICIPIO_DNASC          38 -  44 ///
	str FK_COD_ESTADO_DEND              45 -  46 ///
	str SIGLA_ESTADO_DEND               47 -  48 ///
	str FK_COD_MUNICIPIO_DEND           49 -  55 ///
	str FK_COD_ESCOLARIDADE             56 -  56 ///
	str COD_CURSO_1                     57 -  58 ///
	str COD_CURSO_2                     59 -  60 ///
	str COD_CURSO_3                     61 -  62 ///
	str ID_QUIMICA                      63 -  63 ///
	str ID_FISICA                       64 -  64 ///
	str ID_MATEMATICA                   65 -  65 ///
	str ID_BIOLOGIA                     66 -  66 ///
	str ID_CIENCIAS                     67 -  67 ///
	str ID_LINGUA_LITERAT_PORTUGUESA    68 -  68 ///
	str ID_LINGUA_LITERAT_INGLES        69 -  69 ///
	str ID_LINGUA_LITERAT_ESPANHOL      70 -  70 ///
	str ID_LINGUA_LITERAT_OUTRA         71 -  71 ///
	str ID_ARTES                        72 -  72 ///
	str ID_EDUCACAO_FISICA              73 -  73 ///
	str ID_HISTORIA                     74 -  74 ///
	str ID_GEOGRAFIA                    75 -  75 ///
	str ID_FILOSOFIA                    76 -  76 ///
	str ID_ESTUDOS_SOCIAIS              77 -  77 ///
	str ID_INFORMATICA_COMPUTACAO       78 -  78 ///
	str ID_PROFISSIONALIZANTE           79 -  79 ///
	str ID_DIDATICA_METODOLOGIA         80 -  80 ///
	str ID_FUNDAMENTOS_EDUCACAO         81 -  81 ///
	str ID_DISC_ATENDIMENTO_ESPECIAIS   82 -  82 ///
	str ID_DISC_DIVERSIDADE_SOCIO_CULT  83 -  83 ///
	str ID_OUTRAS_DISCIPLINAS_PEDAG     84 -  84 ///
	str ID_LIBRAS                       85 -  85 ///
	str ID_OUTRAS_DISCIPLINAS           86 -  86 ///
	str ID_ESPECIALIZACAO               87 -  87 ///
	str ID_MESTRADO                     88 -  88 ///
	str ID_DOUTORADO                    89 -  89 ///
	str ID_POS_GRADUACAO_NENHUM         90 -  90 ///
	str ID_ESPECIFICO_CRECHE            91 -  91 ///
	str ID_ESPECIFICO_PRE_ESCOLA        92 -  92 ///
	str ID_ESPECIFICO_NEC_ESP           93 -  93 ///
	str ID_ESPECIFICO_ED_INDIGENA       94 -  94 ///
	str ID_INTERCULTURAL_OUTROS         95 -  95 ///
	str ID_ESPECIFICO_NENHUM            96 -  96 ///
	str ID_TIPO_DOCENTE                 97 -  97 ///
	str PK_COD_TURMA                    98 -  107 ///
	str FK_TIPO_TURMA                   108 - 109 ///
	str FK_COD_MOD_ENSINO               110 - 111 ///
	str FK_COD_ETAPA_ENSINO             112 - 114 ///
	str FK_COD_CURSO_PROF               115 - 122 ///
	str PK_COD_ENTIDADE                 123 - 130 ///
	str FK_COD_ESTADO                   131 - 132 ///
	str SIGLA                           133 - 134 ///
	str FK_COD_MUNICIPIO                135 - 141 ///
	str ID_LOCALIZACAO                  142 - 142 ///
	str ID_DEPENDENCIA_ADM              143 - 143 ///
	str DESC_CATEGORIA_ESCOLA_PRIVADA   144 - 144 ///
	str ID_CONVENIADA_PP                145 - 145 ///
	str ID_MANT_ESCOLA_PRIVADA_EMP      146 - 146 ///
	str ID_MANT_ESCOLA_PRIVADA_ONG      147 - 147 ///
	str ID_MANT_ESCOLA_PRIVADA_SIND     148 - 148 ///
	str ID_MANT_ESCOLA_PRIVADA_APAE     149 - 149 ///
	str ID_DOCUMENTO_REGULAMENTACAO     150 - 150 ///
	str ID_LOCALIZACAO_DIFERENCIADA     151 - 151 ///
	str ID_EDUCACAO_INDIGENA            152 - 152 ///
	using "$input_census/2007/DADOS/TS_DOCENTES_`i'.TXT"

	// Saving 2007 data
	save "$output_census/Professores2007`i'.dta", replace
	clear
}


/* -------------------------------------------------------------------- */
/* 				2008                                    */
/* ---------------------------------------------------------------------*/

foreach i in RO AC AM RR PA AP TO MA PI CE RN PB PE AL SE BA MG ES RJ SP PR SC RS MS MT GO DF {
	infix ///
	str ANO_CENSO                       1   -  7 ///
	str FK_COD_DOCENTE                  8   -  22 ///
	str NU_DIA                          23  -  27 ///
	str NU_MES                          28  -  32 ///
	str NU_ANO                          33  -  39 ///
	str NUM_IDADE                       40  -  44 ///
	str TP_SEXO                         45  -  45 ///
	str TP_COR_RACA                     46  -  46 ///
	str TP_NACIONALIDADE                47  -  47 ///
	str FK_COD_PAIS_ORIGEM              48  -  53 ///
	str FK_COD_ESTADO_DNASC             54  -  58 ///
	str SIGLA_ESTADO_DNASC              59  -  60 ///
	str FK_COD_MUNICIPIO_DNASC          61  -  75 ///
	str FK_COD_ESTADO_DEND              76  -  80 ///
	str SIGLA_ESTADO_DEND               81  -  82 ///
	str FK_COD_MUNICIPIO_DEND           83  -  97 ///
	str FK_COD_ESCOLARIDADE             98  -  102 ///
	str FK_CLASSE_CURSO_1               103 -  107 ///
	str PK_COD_AREA_OCDE_1              108 -  113 ///
	str ID_LICENCIATURA_1               114 -  116 ///
	str NU_ANO_CONCLUSAO_1              117 -  122 ///
	str ID_TIPO_INSTITUICAO_1           123 -  125 ///
	str ID_NOME_IES_1                   126 -  225 ///
	str FK_COD_IES_1                    226 -  234 ///
	str FK_CLASSE_CURSO_2               235 -  239 ///
	str PK_COD_AREA_OCDE_2              240 -  245 ///
	str ID_LICENCIATURA_2               246 -  248 ///
	str NU_ANO_CONCLUSAO_2              249 -  254 ///
	str ID_TIPO_INSTITUICAO_2           255 -  257 ///
	str ID_NOME_IES_2                   258 -  357 ///
	str FK_COD_IES_2                    358 -  366 ///
	str FK_CLASSE_CURSO_3               367 -  371 ///
	str PK_COD_AREA_OCDE_3              372 -  377 ///
	str ID_LICENCIATURA_3               378 -  380 ///
	str NU_ANO_CONCLUSAO_3              381 -  386 ///
	str ID_TIPO_INSTITUICAO_3           387 -  389 ///
	str ID_NOME_IES_3                   390 -  489 ///
	str FK_COD_IES_3                    490 -  498 ///
	str ID_QUIMICA                      499 -  499 ///
	str ID_FISICA                       500 -  500 ///
	str ID_MATEMATICA                   501 -  501 ///
	str ID_BIOLOGIA                     502 -  502 ///
	str ID_CIENCIAS                     503 -  503 ///
	str ID_LINGUA_LITERAT_PORTUGUESA    504 -  504 ///
	str ID_LINGUA_LITERAT_INGLES        505 -  505 ///
	str ID_LINGUA_LITERAT_ESPANHOL      506 -  506 ///
	str ID_LINGUA_LITERAT_OUTRA         507 -  507 ///
	str ID_ARTES                        508 -  508 ///
	str ID_EDUCACAO_FISICA              509 -  509 ///
	str ID_HISTORIA                     510 -  510 ///
	str ID_GEOGRAFIA                    511 -  511 ///
	str ID_FILOSOFIA                    512 -  512 ///
	str ID_ESTUDOS_SOCIAIS              513 -  513 ///
	str ID_INFORMATICA_COMPUTACAO       514 -  514 ///
	str ID_PROFISSIONALIZANTE           515 -  515 ///
	str ID_DIDATICA_METODOLOGIA         516 -  516 ///
	str ID_FUNDAMENTOS_EDUCACAO         517 -  517 ///
	str ID_DISC_ATENDIMENTO_ESPECIAIS   518 -  518 ///
	str ID_DISC_DIVERSIDADE_SOCIO_CULT  519 -  519 ///
	str ID_OUTRAS_DISCIPLINAS_PEDAG     520 -  520 ///
	str ID_LIBRAS                       521 -  521 ///
	str ID_ESPECIALIZACAO               522 -  522 ///
	str ID_MESTRADO                     523 -  523 ///
	str ID_DOUTORADO                    524 -  524 ///
	str ID_POS_GRADUACAO_NENHUM         525 -  525 ///
	str ID_ESPECIFICO_CRECHE            526 -  526 ///
	str ID_ESPECIFICO_PRE_ESCOLA        527 -  527 ///
	str ID_ESPECIFICO_NEC_ESP           528 -  528 ///
	str ID_ESPECIFICO_ED_INDIGENA       529 -  529 ///
	str ID_INTERCULTURAL_OUTROS         530 -  530 ///
	str ID_ESPECIFICO_NENHUM            531 -  531 ///
	str ID_OUTRAS_DISCIPLINAS           532 -  532 ///
	str ID_TIPO_DOCENTE                 533 -  533 ///
	str PK_COD_TURMA                    534 -  546 ///
	str FK_TIPO_TURMA                   547 -  551 ///
	str FK_COD_MOD_ENSINO               552 -  556 ///
	str FK_COD_ETAPA_ENSINO             557 -  561 ///
	str FK_COD_CURSO_PROF               562 -  571 ///
	str PK_COD_ENTIDADE                 572 -  582 ///
	str FK_COD_ESTADO                   583 -  587 ///
	str SIGLA                           588 -  589 ///
	str FK_COD_MUNICIPIO                590 -  604 ///
	str ID_LOCALIZACAO                  605 -  605 ///
	str ID_DEPENDENCIA_ADM              606 -  606 ///
	str DESC_CATEGORIA_ESCOLA_PRIVADA   607 -  607 ///
	str ID_CONVENIADA_PP                608 -  608 ///
	str ID_TIPO_CONVENIO_PODER_PUBLICO  609 -  609 ///
	str ID_MANT_ESCOLA_PRIVADA_EMP      610 -  610 ///
	str ID_MANT_ESCOLA_PRIVADA_ONG      611 -  611 ///
	str ID_MANT_ESCOLA_PRIVADA_SIND     612 -  612 ///
	str ID_MANT_ESCOLA_PRIVADA_APAE     613 -  613 ///
	str ID_DOCUMENTO_REGULAMENTACAO     614 -  614 ///
	str ID_LOCALIZACAO_DIFERENCIADA     615 -  615 ///
	str ID_EDUCACAO_INDIGENA            616 -  616 ///
	using "$input_census/2008/DADOS/TS_DOCENTES_`i'.txt"

	// Saving 2008 data
	save "$output_census/Professores2008`i'.dta", replace
	clear
}

/* -------------------------------------------------------------------------- */
/* 2009                                                                       */
/* -------------------------------------------------------------------------- */
foreach i in RO AC AM RR PA AP TO MA PI CE RN PB PE AL SE BA MG ES RJ SP PR SC RS MS MT GO DF {
	infix ///
	str ANO_CENSO                       1   -  5 ///
	str FK_COD_DOCENTE                  6   -  18 ///
	str NU_DIA                          19  -  21 ///
	str NU_MES                          22  -  24 ///
	str NU_ANO                          25  -  29 ///
	str NUM_IDADE                       30  -  33 ///
	str TP_SEXO                         34  -  34 ///
	str TP_COR_RACA                     35  -  35 ///
	str TP_NACIONALIDADE                36  -  36 ///
	str FK_COD_PAIS_ORIGEM              37  -  40 ///
	str FK_COD_ESTADO_DNASC             41  -  43 ///
	str SIGLA_ESTADO_DNASC              44  -  45 ///
	str FK_COD_MUNICIPIO_DNASC          46  -  53 ///
	str FK_COD_ESTADO_DEND              54  -  56 ///
	str SIGLA_ESTADO_DEND               57  -  58 ///
	str FK_COD_MUNICIPIO_DEND           59  -  66 ///
	str FK_COD_ESCOLARIDADE             67  -  68 ///
	str FK_CLASSE_CURSO_1               69  -  72 ///
	str FK_COD_AREA_OCDE_1              73  -  78 ///
	str ID_LICENCIATURA_1               79  -  80 ///
	str NU_ANO_CONCLUSAO_1              81  -  85 ///
	str ID_TIPO_INSTITUICAO_1           86  -  87 ///
	str ID_NOME_INSTITUICAO_1           88  -  187 ///
	str FK_COD_IES_1                    188 -  196 ///
	str FK_CLASSE_CURSO_2               197 -  200 ///
	str FK_COD_AREA_OCDE_2              201 -  206 ///
	str ID_LICENCIATURA_2               207 -  208 ///
	str NU_ANO_CONCLUSAO_2              209 -  213 ///
	str ID_TIPO_INSTITUICAO_2           214 -  215 ///
	str ID_NOME_INSTITUICAO_2           216 -  315 ///
	str FK_COD_IES_2                    316 -  324 ///
	str FK_CLASSE_CURSO_3               325 -  328 ///
	str FK_COD_AREA_OCDE_3              329 -  334 ///
	str ID_LICENCIATURA_3               335 -  336 ///
	str NU_ANO_CONCLUSAO_3              337 -  341 ///
	str ID_TIPO_INSTITUICAO_3           342 -  343 ///
	str ID_NOME_INSTITUICAO_3           344 -  443 ///
	str FK_COD_IES_3                    444 -  452 ///
	str ID_QUIMICA                      453 -  453 ///
	str ID_FISICA                       454 -  454 ///
	str ID_MATEMATICA                   455 -  455 ///
	str ID_BIOLOGIA                     456 -  456 ///
	str ID_CIENCIAS                     457 -  457 ///
	str ID_LINGUA_LITERAT_PORTUGUESA    458 -  458 ///
	str ID_LINGUA_LITERAT_INGLES        459 -  459 ///
	str ID_LINGUA_LITERAT_ESPANHOL      460 -  460 ///
	str ID_LINGUA_LITERAT_OUTRA         461 -  461 ///
	str ID_LINGUA_LITERAT_INDIGENA      462 -  462 ///
	str ID_ARTES                        463 -  463 ///
	str ID_EDUCACAO_FISICA              464 -  464 ///
	str ID_HISTORIA                     465 -  465 ///
	str ID_GEOGRAFIA                    466 -  466 ///
	str ID_FILOSOFIA                    467 -  467 ///
	str ID_ENSINO_RELIGIOSO             468 -  468 ///
	str ID_ESTUDOS_SOCIAIS              469 -  469 ///
	str ID_INFORMATICA_COMPUTACAO       470 -  470 ///
	str ID_PROFISSIONALIZANTE           471 -  471 ///
	str ID_DISC_ATENDIMENTO_ESPECIAIS   472 -  472 ///
	str ID_DISC_DIVERSIDADE_SOCIO_CULT  473 -  473 ///
	str ID_LIBRAS                       474 -  474 ///
	str ID_DISCIPLINAS_PEDAG            475 -  475 ///
	str ID_OUTRAS_DISCIPLINAS           476 -  476 ///
	str ID_ESPECIALIZACAO               477 -  477 ///
	str ID_MESTRADO                     478 -  478 ///
	str ID_DOUTORADO                    479 -  479 ///
	str ID_POS_GRADUACAO_NENHUM         480 -  480 ///
	str ID_ESPECIFICO_CRECHE            481 -  481 ///
	str ID_ESPECIFICO_PRE_ESCOLA        482 -  482 ///
	str ID_ESPECIFICO_NEC_ESP           483 -  483 ///
	str ID_ESPECIFICO_ED_INDIGENA       484 -  484 ///
	str ID_INTERCULTURAL_OUTROS         485 -  485 ///
	str ID_ESPECIFICO_NENHUM            486 -  486 ///
	str ID_TIPO_DOCENTE                 487 -  487 ///
	str PK_COD_TURMA                    488 -  498 ///
	str FK_COD_TIPO_TURMA               499 -  501 ///
	str FK_COD_MOD_ENSINO               502 -  504 ///
	str FK_COD_ETAPA_ENSINO             505 -  508 ///
	str FK_COD_CURSO_PROF               509 -  517 ///
	str PK_COD_ENTIDADE                 518 -  526 ///
	str FK_COD_ESTADO                   527 -  529 ///
	str SIGLA                           530 -  531 ///
	str FK_COD_MUNICIPIO                532 -  539 ///
	str ID_LOCALIZACAO                  540 -  540 ///
	str ID_DEPENDENCIA_ADM              541 -  541 ///
	str DESC_CATEGORIA_ESCOLA_PRIVADA   542 -  542 ///
	str ID_CONVENIADA_PP                543 -  543 ///
	str ID_TIPO_CONVENIO_PODER_PUBLICO  544 -  545 ///
	str ID_MANT_ESCOLA_PRIVADA_EMP      546 -  546 ///
	str ID_MANT_ESCOLA_PRIVADA_ONG      547 -  547 ///
	str ID_MANT_ESCOLA_PRIVADA_SIND     548 -  548 ///
	str ID_MANT_ESCOLA_PRIVADA_S_FINS   549 -  549 ///
	str ID_DOCUMENTO_REGULAMENTACAO     550 -  550 ///
	str ID_LOCALIZACAO_DIFERENCIADA     551 -  551 ///
	str ID_EDUCACAO_INDIGENA            552 -  552 ///
	using "$input_census/2009/DADOS/TS_DOCENTES_`i'.txt"

	// Saving 2009 data
	save "$output_census/Professores2009`i'.dta", replace
	clear
}





/* -------------------------------------------------------------------------- */
/* 				2010                                          */
/* -------------------------------------------------------------------------- */
foreach i in RO AC AM RR PA AP TO MA PI CE RN PB PE AL SE BA MG ES RJ SP PR SC RS MS MT GO DF{
	infix ///
	str	ANO_CENSO			1	 - 	5 ///
	str	FK_COD_DOCENTE			6	 - 	18 ///
	str	NU_DIA				19	 - 	21 ///
	str	NU_MES				22	 - 	24 ///
	str	NU_ANO				25	 - 	29 ///
	str	NUM_IDADE			30	 - 	33 ///
	str	TP_SEXO				34	 - 	34 ///
	str	TP_COR_RACA			35	 - 	35 ///
	str	TP_NACIONALIDADE		36	 - 	36 ///
	str	FK_COD_PAIS_ORIGEM		37	 - 	40 ///
	str	FK_COD_ESTADO_DNASC		41	 - 	43 ///
	str	SIGLA_ESTADO_DNASC		44	 - 	45 ///
	str	FK_COD_MUNICIPIO_DNASC		46	 - 	53 ///
	str	FK_COD_ESTADO_DEND		54	 - 	56 ///
	str	SIGLA_ESTADO_DEND		57	 - 	58 ///
	str	FK_COD_MUNICIPIO_DEND		59	 - 	66 ///
	str	FK_COD_ESCOLARIDADE		67	 - 	68 ///
	str	FK_CLASSE_CURSO_1		69	 - 	72 ///
	str	FK_COD_AREA_OCDE_1		73	 - 	78 ///
	str	ID_LICENCIATURA_1		79	 - 	80 ///
	str	NU_ANO_CONCLUSAO_1		81	 - 	85 ///
	str	ID_TIPO_INSTITUICAO_1		86	 - 	87 ///
	str	ID_NOME_INSTITUICAO_1		88	 - 	187 ///
	str	FK_COD_IES_1			188	 - 	196 ///
	str	FK_CLASSE_CURSO_2		197	 - 	200 ///
	str	FK_COD_AREA_OCDE_2		201	 - 	206 ///
	str	ID_LICENCIATURA_2		207	 - 	208 ///
	str	NU_ANO_CONCLUSAO_2		209	 - 	213 ///
	str	ID_TIPO_INSTITUICAO_2		214	 - 	215 ///
	str	ID_NOME_INSTITUICAO_2		216	 - 	315 ///
	str	FK_COD_IES_2			316	 - 	324 ///
	str	FK_CLASSE_CURSO_3		325	 - 	328 ///
	str	FK_COD_AREA_OCDE_3		329	 - 	334 ///
	str	ID_LICENCIATURA_3		335	 - 	336 ///
	str	NU_ANO_CONCLUSAO_3		337	 - 	341 ///
	str	ID_TIPO_INSTITUICAO_3		342	 - 	343 ///
	str	ID_NOME_INSTITUICAO_3		344	 - 	443 ///
	str	FK_COD_IES_3			444	 - 	452 ///
	str	ID_QUIMICA			453	 - 	453 ///
	str	ID_FISICA			454	 - 	454 ///
	str	ID_MATEMATICA			455	 - 	455 ///
	str	ID_BIOLOGIA			456	 - 	456 ///
	str	ID_CIENCIAS			457	 - 	457 ///
	str	ID_LINGUA_LITERAT_PORTUGUESA	458	 - 	458 ///
	str	ID_LINGUA_LITERAT_INGLES	459	 - 	459 ///
	str	ID_LINGUA_LITERAT_ESPANHOL	460	 - 	460 ///
	str	ID_LINGUA_LITERAT_OUTRA		461	 - 	461 ///
	str	ID_ARTES			462	 - 	462 ///
	str	ID_EDUCACAO_FISICA		463	 - 	463 ///
	str	ID_HISTORIA			464	 - 	464 ///
	str	ID_GEOGRAFIA			465	 - 	465 ///
	str	ID_FILOSOFIA			466	 - 	466 ///
	str	ID_ESTUDOS_SOCIAIS		467	 - 	467 ///
	str	ID_INFORMATICA_COMPUTACAO	468	 - 	468 ///
	str	ID_PROFISSIONALIZANTE		469	 - 	469 ///
	str	ID_DISC_ATENDIMENTO_ESPECIAIS	470	 - 	470 ///
	str	ID_DISC_DIVERSIDADE_SOCIO_CULT	471	 - 	471 ///
	str	ID_LIBRAS			472	 - 	472 ///
	str	ID_ESPECIALIZACAO		473	 - 	473 ///
	str	ID_MESTRADO			474	 - 	474 ///
	str	ID_DOUTORADO			475	 - 	475 ///
	str	ID_POS_GRADUACAO_NENHUM		476	 - 	476 ///
	str	ID_ESPECIFICO_CRECHE		477	 - 	477 ///
	str	ID_ESPECIFICO_PRE_ESCOLA	478	 - 	478 ///
	str	ID_ESPECIFICO_NEC_ESP		479	 - 	479 ///
	str	ID_ESPECIFICO_ED_INDIGENA	480	 - 	480 ///
	str	ID_INTERCULTURAL_OUTROS		481	 - 	481 ///
	str	ID_ESPECIFICO_NENHUM		482	 - 	482 ///
	str	ID_OUTRAS_DISCIPLINAS		483	 - 	483 ///
	str	ID_TIPO_DOCENTE			484	 - 	484 ///
	str	PK_COD_TURMA			485	 - 	495 ///
	str	FK_COD_TIPO_TURMA		496	 - 	498 ///
	str	FK_COD_MOD_ENSINO		499	 - 	501 ///
	str	FK_COD_ETAPA_ENSINO		502	 - 	505 ///
	str	FK_COD_CURSO_PROF		506	 - 	514 ///
	str	PK_COD_ENTIDADE			515	 - 	523 ///
	str	FK_COD_ESTADO			524	 - 	526 ///
	str	SIGLA				527	 - 	528 ///
	str	FK_COD_MUNICIPIO		529	 - 	536 ///
	str	ID_LOCALIZACAO			537	 - 	537 ///
	str	ID_DEPENDENCIA_ADM		538	 - 	538 ///
	str	DESC_CATEGORIA_ESCOLA_PRIVADA	539	 - 	539 ///
	str	ID_CONVENIADA_PP		540	 - 	540 ///
	str	ID_TIPO_CONVENIO_PODER_PUBLICO	541	 - 	542 ///
	str	ID_MANT_ESCOLA_PRIVADA_EMP	543	 - 	543 ///
	str	ID_MANT_ESCOLA_PRIVADA_ONG	544	 - 	544 ///
	str	ID_MANT_ESCOLA_PRIVADA_SIND	545	 - 	545 ///
	str	ID_MANT_ESCOLA_PRIVADA_S_FINS	546	 - 	546 ///
	str	ID_DOCUMENTO_REGULAMENTACAO	547	 - 	547 ///
	str	ID_LOCALIZACAO_DIFERENCIADA	548	 - 	548 ///
	str	ID_EDUCACAO_INDIGENA		549	 - 	549 ///
	str	ID_LINGUA_LITERAT_INDIGENA	550	 - 	550 ///
	str	ID_ENSINO_RELIGIOSO		551	 - 	551 ///
	str	ID_DISCIPLINAS_PEDAG		552	 - 	552 ///
	using "$input_census/2010/DADOS/TS_DOCENTES_`i'.txt"
	
	// Saving 2010 data
	save "$output_census/Professores2010`i'.dta", replace
	clear
}


/* -------------------------------------------------------------------------- */
/* 2011                                                                       */
/* -------------------------------------------------------------------------- */
foreach i in RO AC AM RR PA AP TO MA PI CE RN PB PE AL SE BA MG ES RJ SP PR SC RS MS MT GO DF {
	infix ///
	str ANO_CENSO                       1   -  5 ///
	str FK_COD_DOCENTE                  6   -  18 ///
	str NU_DIA                          19  -  21 ///
	str NU_MES                          22  -  24 ///
	str NU_ANO                          25  -  29 ///
	str NUM_IDADE                       30  -  33 ///
	str TP_SEXO                         34  -  34 ///
	str TP_COR_RACA                     35  -  35 ///
	str TP_NACIONALIDADE                36  -  36 ///
	str FK_COD_PAIS_ORIGEM              37  -  40 ///
	str FK_COD_ESTADO_DNASC             41  -  43 ///
	str SIGLA_ESTADO_DNASC              44  -  45 ///
	str FK_COD_MUNICIPIO_DNASC          46  -  53 ///
	str FK_COD_ESTADO_DEND              54  -  56 ///
	str SIGLA_ESTADO_DEND               57  -  58 ///
	str FK_COD_MUNICIPIO_DEND           59  -  66 ///
	str FK_COD_ESCOLARIDADE             67  -  68 ///
	str ID_SITUACAO_CURSO_1             69  -  69 ///
	str FK_CLASSE_CURSO_1               70  -  73 ///
	str FK_COD_AREA_OCDE_1              74  -  79 ///
	str ID_LICENCIATURA_1               80  -  81 ///
	str ID_COM_PEDAGOGICA_1             82  -  83 ///
	str NU_ANO_INICIO_1                 84  -  88 ///
	str NU_ANO_CONCLUSAO_1              89  -  93 ///
	str ID_TIPO_INSTITUICAO_1           94  -  95 ///
	str ID_NOME_INSTITUICAO_1           96  -  195 ///
	str FK_COD_IES_1                    196 -  204 ///
	str ID_SITUACAO_CURSO_2             205 -  205 ///
	str FK_CLASSE_CURSO_2               206 -  209 ///
	str FK_COD_AREA_OCDE_2              210 -  215 ///
	str ID_LICENCIATURA_2               216 -  217 ///
	str ID_COM_PEDAGOGICA_2             218 -  219 ///
	str NU_ANO_INICIO_2                 220 -  224 ///
	str NU_ANO_CONCLUSAO_2              225 -  229 ///
	str ID_TIPO_INSTITUICAO_2           230 -  231 ///
	str ID_NOME_INSTITUICAO_2           232 -  331 ///
	str FK_COD_IES_2                    332 -  340 ///
	str ID_SITUACAO_CURSO_3             341 -  341 ///
	str FK_CLASSE_CURSO_3               342 -  345 ///
	str FK_COD_AREA_OCDE_3              346 -  351 ///
	str ID_LICENCIATURA_3               352 -  353 ///
	str ID_COM_PEDAGOGIAC_3             354 -  355 ///
	str NU_ANO_INICIO_3                 356 -  360 ///
	str NU_ANO_CONCLUSAO_3              361 -  365 ///
	str ID_TIPO_INSTITUICAO_3           366 -  367 ///
	str ID_NOME_INSTITUICAO_3           368 -  467 ///
	str FK_COD_IES_3                    468 -  476 ///
	str ID_QUIMICA                      477 -  477 ///
	str ID_FISICA                       478 -  478 ///
	str ID_MATEMATICA                   479 -  479 ///
	str ID_BIOLOGIA                     480 -  480 ///
	str ID_CIENCIAS                     481 -  481 ///
	str ID_LINGUA_LITERAT_PORTUGUESA    482 -  482 ///
	str ID_LINGUA_LITERAT_INGLES        483 -  483 ///
	str ID_LINGUA_LITERAT_ESPANHOL      484 -  484 ///
	str ID_LINGUA_LITERAT_OUTRA         485 -  485 ///
	str ID_LINGUA_LITERAT_INDIGENA      486 -  486 ///
	str ID_ARTES                        487 -  487 ///
	str ID_EDUCACAO_FISICA              488 -  488 ///
	str ID_HISTORIA                     489 -  489 ///
	str ID_GEOGRAFIA                    490 -  490 ///
	str ID_FILOSOFIA                    491 -  491 ///
	str ID_ENSINO_RELIGIOSO             492 -  492 ///
	str ID_ESTUDOS_SOCIAIS              493 -  493 ///
	str ID_INFORMATICA_COMPUTACAO       494 -  494 ///
	str ID_PROFISSIONALIZANTE           495 -  495 ///
	str ID_DISC_ATENDIMENTO_ESPECIAIS   496 -  496 ///
	str ID_DISC_DIVERSIDADE_SOCIO_CULT  497 -  497 ///
	str ID_LIBRAS                       498 -  498 ///
	str ID_DISCIPLINAS_PEDAG            499 -  499 ///
	str ID_OUTRAS_DISCIPLINAS           500 -  500 ///
	str ID_ESPECIALIZACAO               501 -  501 ///
	str ID_MESTRADO                     502 -  502 ///
	str ID_DOUTORADO                    503 -  503 ///
	str ID_POS_GRADUACAO_NENHUM         504 -  504 ///
	str ID_ESPECIFICO_CRECHE            505 -  505 ///
	str ID_ESPECIFICO_PRE_ESCOLA        506 -  506 ///
	str ID_ESPECIFICO_ANOS_INICIAIS     507 -  507 ///
	str ID_ESPECIFICO_ANOS_FINAIS       508 -  508 ///
	str ID_ESPECIFICO_ENS_MEDIO         509 -  509 ///
	str ID_ESPECIFICO_EJA               510 -  510 ///
	str ID_ESPECIFICO_NEC_ESP           511 -  511 ///
	str ID_ESPECIFICO_ED_INDIGENA       512 -  512 ///
	str ID_INTERCULTURAL_OUTROS         513 -  513 ///
	str ID_ESPECIFICO_OUTROS            514 -  514 ///
	str ID_ESPECIFICO_NENHUM            515 -  515 ///
	str ID_TIPO_DOCENTE                 516 -  516 ///
	str ID_TIPO_CONTRATACAO             517 -  517 ///
	str PK_COD_TURMA                    518 -  528 ///
	str FK_COD_TIPO_TURMA               529 -  531 ///
	str FK_COD_MOD_ENSINO               532 -  534 ///
	str FK_COD_ETAPA_ENSINO             535 -  538 ///
	str FK_COD_CURSO_PROF               539 -  547 ///
	str PK_COD_ENTIDADE                 548 -  556 ///
	str FK_COD_ESTADO                   557 -  559 ///
	str SIGLA                           560 -  561 ///
	str FK_COD_MUNICIPIO                562 -  569 ///
	str FK_COD_DISTRITO                 570 -  577 ///
	str ID_LOCALIZACAO                  578 -  578 ///
	str ID_DEPENDENCIA_ADM              579 -  579 ///
	str DESC_CATEGORIA_ESCOLA_PRIVADA   580 -  580 ///
	str ID_CONVENIADA_PP                581 -  581 ///
	str ID_TIPO_CONVENIO_PODER_PUBLICO  582 -  583 ///
	str ID_MANT_ESCOLA_PRIVADA_EMP      584 -  584 ///
	str ID_MANT_ESCOLA_PRIVADA_ONG      585 -  585 ///
	str ID_MANT_ESCOLA_PRIVADA_SIND     586 -  586 ///
	str ID_MANT_ESCOLA_PRIVADA_S_FINS   587 -  587 ///
	str ID_DOCUMENTO_REGULAMENTACAO     588 -  588 ///
	str ID_LOCALIZACAO_DIFERENCIADA     589 -  589 ///
	str ID_EDUCACAO_INDIGENA            590 -  590 ///
	using "$input_census/2011/DADOS/TS_DOCENTES_`i'.txt"

	// Saving 2011 data
	save "$output_census/Professores2011`i'.dta", replace
	clear
}

/* -------------------------------------------------------------------------- */
/* 2012                                                                       */
/* -------------------------------------------------------------------------- */
foreach i in RO AC AM RR PA AP TO MA PI CE RN PB PE AL SE BA MG ES RJ SP PR SC RS MS MT GO DF {
	infix ///
	str ANO_CENSO                       1   -  5 ///
	str FK_COD_DOCENTE                  6   -  18 ///
	str NU_DIA                          19  -  21 ///
	str NU_MES                          22  -  24 ///
	str NU_ANO                          25  -  29 ///
	str NUM_IDADE                       30  -  33 ///
	str TP_SEXO                         34  -  34 ///
	str TP_COR_RACA                     35  -  35 ///
	str TP_NACIONALIDADE                36  -  36 ///
	str FK_COD_PAIS_ORIGEM              37  -  40 ///
	str FK_COD_ESTADO_DNASC             41  -  43 ///
	str SIGLA_ESTADO_DNASC              44  -  45 ///
	str FK_COD_MUNICIPIO_DNASC          46  -  54 ///
	str FK_COD_ESTADO_DEND              55  -  57 ///
	str SIGLA_ESTADO_DEND               58  -  59 ///
	str FK_COD_MUNICIPIO_DEND           60  -  68 ///
	str ID_ZONA_RESIDENCIAL             69  -  70 ///
	str ID_POSSUI_NEC_ESPECIAL          71  -  72 ///
	str ID_CEGUEIRA                     73  -  74 ///
	str ID_BAIXA_VISAO                  75  -  76 ///
	str ID_SURDEZ                       77  -  78 ///
	str ID_DEF_AUDITIVA                 79  -  80 ///
	str ID_SURDOCEGUEIRA                81  -  82 ///
	str ID_DEF_FISICA                   83  -  84 ///
	str ID_DEF_INTELECTUAL              85  -  86 ///
	str ID_DEF_MULTIPLA                 87  -  88 ///
	str FK_COD_ESCOLARIDADE             89  -  90 ///
	str ID_SITUACAO_CURSO_1             91  -  91 ///
	str FK_CLASSE_CURSO_1               92  -  94 ///
	str FK_COD_AREA_OCDE_1              95  -  100 ///
	str ID_LICENCIATURA_1               101 -  102 ///
	str ID_COM_PEDAGOGICA_1             103 -  104 ///
	str NU_ANO_INICIO_1                 105 -  109 ///
	str NU_ANO_CONCLUSAO_1              110 -  114 ///
	str ID_TIPO_INSTITUICAO_1           115 -  116 ///
	str ID_NOME_INSTITUICAO_1           117 -  216 ///
	str FK_COD_IES_1                    217 -  225 ///
	str ID_SITUACAO_CURSO_2             226 -  226 ///
	str FK_CLASSE_CURSO_2               227 -  230 ///
	str FK_COD_AREA_OCDE_2              231 -  236 ///
	str ID_LICENCIATURA_2               237 -  238 ///
	str ID_COM_PEDAGOGICA_2             239 -  240 ///
	str NU_ANO_INICIO_2                 241 -  245 ///
	str NU_ANO_CONCLUSAO_2              246 -  250 ///
	str ID_TIPO_INSTITUICAO_2           251 -  252 ///
	str ID_NOME_INSTITUICAO_2           253 -  352 ///
	str FK_COD_IES_2                    353 -  361 ///
	str ID_SITUACAO_CURSO_3             362 -  362 ///
	str FK_CLASSE_CURSO_3               363 -  366 ///
	str FK_COD_AREA_OCDE_3              367 -  372 ///
	str ID_LICENCIATURA_3               373 -  374 ///
	str ID_COM_PEDAGOGICA_3             375 -  376 ///
	str NU_ANO_INICIO_3                 377 -  381 ///
	str NU_ANO_CONCLUSAO_3              382 -  386 ///
	str ID_TIPO_INSTITUICAO_3           387 -  388 ///
	str ID_NOME_INSTITUICAO_3           389 -  488 ///
	str FK_COD_IES_3                    489 -  497 ///
	str ID_QUIMICA                      498 -  498 ///
	str ID_FISICA                       499 -  499 ///
	str ID_MATEMATICA                   500 -  500 ///
	str ID_BIOLOGIA                     501 -  501 ///
	str ID_CIENCIAS                     502 -  502 ///
	str ID_LINGUA_LITERAT_PORTUGUESA    503 -  503 ///
	str ID_LINGUA_LITERAT_INGLES        504 -  504 ///
	str ID_LINGUA_LITERAT_ESPANHOL      505 -  505 ///
	str ID_LINGUA_LITERAT_FRANCES       506 -  506 ///
	str ID_LINGUA_LITERAT_OUTRA         507 -  507 ///
	str ID_LINGUA_LITERAT_INDIGENA      508 -  508 ///
	str ID_ARTES                        509 -  509 ///
	str ID_EDUCACAO_FISICA              510 -  510 ///
	str ID_HISTORIA                     511 -  511 ///
	str ID_GEOGRAFIA                    512 -  512 ///
	str ID_FILOSOFIA                    513 -  513 ///
	str ID_ENSINO_RELIGIOSO             514 -  514 ///
	str ID_ESTUDOS_SOCIAIS              515 -  515 ///
	str ID_SOCIOLOGIA                   516 -  516 ///
	str ID_INFORMATICA_COMPUTACAO       517 -  517 ///
	str ID_PROFISSIONALIZANTE           518 -  518 ///
	str ID_DISC_ATENDIMENTO_ESPECIAIS   519 -  519 ///
	str ID_DISC_DIVERSIDADE_SOCIO_CULT  520 -  520 ///
	str ID_LIBRAS                       521 -  521 ///
	str ID_DISCIPLINAS_PEDAG            522 -  522 ///
	str ID_OUTRAS_DISCIPLINAS           523 -  523 ///
	str ID_ESPECIALIZACAO               524 -  524 ///
	str ID_MESTRADO                     525 -  525 ///
	str ID_DOUTORADO                    526 -  526 ///
	str ID_POS_GRADUACAO_NENHUM         527 -  527 ///
	str ID_ESPECIFICO_CRECHE            528 -  528 ///
	str ID_ESPECIFICO_PRE_ESCOLA        529 -  529 ///
	str ID_ESPECIFICO_ANOS_INICIAIS     530 -  530 ///
	str ID_ESPECIFICO_ANOS_FINAIS       531 -  531 ///
	str ID_ESPECIFICO_ENS_MEDIO         532 -  532 ///
	str ID_ESPECIFICO_EJA               533 -  533 ///
	str ID_ESPECIFICO_NEC_ESP           534 -  534 ///
	str ID_ESPECIFICO_ED_INDIGENA       535 -  535 ///
	str ID_ESPECIFICO_CAMPO             536 -  536 ///
	str ID_ESPECIFICO_AMBIENTAL         537 -  537 ///
	str ID_ESPECIFICO_DIR_HUMANOS       538 -  538 ///
	str ID_ESPECIFICO_DIV_SEXUAL        539 -  539 ///
	str ID_ESPECIFICO_DIR_ADOLESC       540 -  540 ///
	str ID_ESPECIFICO_AFRO              541 -  541 ///
	str ID_ESPECIFICO_OUTROS            542 -  542 ///
	str ID_ESPECIFICO_NENHUM            543 -  543 ///
	str ID_TIPO_DOCENTE                 544 -  544 ///
	str ID_TIPO_CONTRATACAO             545 -  545 ///
	str PK_COD_TURMA                    546 -  556 ///
	str FK_COD_TIPO_TURMA               557 -  559 ///
	str FK_COD_MOD_ENSINO               560 -  562 ///
	str FK_COD_ETAPA_ENSINO             563 -  566 ///
	str FK_COD_CURSO_PROF               567 -  575 ///
	str PK_COD_ENTIDADE                 576 -  584 ///
	str FK_COD_ESTADO                   585 -  587 ///
	str SIGLA                           588 -  589 ///
	str FK_COD_MUNICIPIO                590 -  598 ///
	str FK_COD_DISTRITO                 599 -  607 ///
	str ID_LOCALIZACAO                  608 -  608 ///
	str ID_DEPENDENCIA_ADM              609 -  609 ///
	str DESC_CATEGORIA_ESCOLA_PRIVADA   610 -  610 ///
	str ID_CONVENIADA_PP                611 -  611 ///
	str ID_TIPO_CONVENIO_PODER_PUBLICO  612 -  613 ///
	str ID_MANT_ESCOLA_PRIVADA_EMP      614 -  614 ///
	str ID_MANT_ESCOLA_PRIVADA_ONG      615 -  615 ///
	str ID_MANT_ESCOLA_PRIVADA_SIST_S   616 -  616 ///
	str ID_MANT_ESCOLA_PRIVADA_SIND     617 -  617 ///
	str ID_MANT_ESCOLA_PRIVADA_S_FINS   618 -  618 ///
	str ID_DOCUMENTO_REGULAMENTACAO     619 -  619 ///
	str ID_LOCALIZACAO_DIFERENCIADA     620 -  620 ///
	str ID_EDUCACAO_INDIGENA            621 -  621 ///
	using "$input_census/2012/DADOS/TS_DOCENTES_`i'.txt"

	// Saving 2012 data
	save "$output_census/Professores2012`i'.dta", replace
	clear
}

/* -------------------------------------------------------------------------- */
/* 2013                                                                       */
/* -------------------------------------------------------------------------- */
foreach i in RO AC AM RR PA AP TO MA PI CE RN PB PE AL SE BA MG ES RJ SP PR SC RS MS MT GO DF {
	infix ///
	str ANO_CENSO                       1   -  5 ///
	str FK_COD_DOCENTE                  6   -  18 ///
	str NU_DIA                          19  -  21 ///
	str NU_MES                          22  -  24 ///
	str NU_ANO                          25  -  29 ///
	str NUM_IDADE                       30  -  33 ///
	str TP_SEXO                         34  -  34 ///
	str TP_COR_RACA                     35  -  35 ///
	str TP_NACIONALIDADE                36  -  36 ///
	str FK_COD_PAIS_ORIGEM              37  -  40 ///
	str FK_COD_ESTADO_DNASC             41  -  43 ///
	str SIGLA_ESTADO_DNASC              44  -  45 ///
	str FK_COD_MUNICIPIO_DNASC          46  -  54 ///
	str FK_COD_ESTADO_DEND              55  -  57 ///
	str SIGLA_ESTADO_DEND               58  -  59 ///
	str FK_COD_MUNICIPIO_DEND           60  -  68 ///
	str ID_ZONA_RESIDENCIAL             69  -  70 ///
	str ID_POSSUI_NEC_ESPECIAL          71  -  72 ///
	str ID_CEGUEIRA                     73  -  74 ///
	str ID_BAIXA_VISAO                  75  -  76 ///
	str ID_SURDEZ                       77  -  78 ///
	str ID_DEF_AUDITIVA                 79  -  80 ///
	str ID_SURDOCEGUEIRA                81  -  82 ///
	str ID_DEF_FISICA                   83  -  84 ///
	str ID_DEF_INTELECTUAL              85  -  86 ///
	str ID_DEF_MULTIPLA                 87  -  88 ///
	str FK_COD_ESCOLARIDADE             89  -  90 ///
	str ID_SITUACAO_CURSO_1             91  -  91 ///
	str FK_CLASSE_CURSO_1               92  -  94 ///
	str FK_COD_AREA_OCDE_1              95  -  100 ///
	str ID_LICENCIATURA_1               101 -  102 ///
	str ID_COM_PEDAGOGICA_1             103 -  104 ///
	str NU_ANO_INICIO_1                 105 -  109 ///
	str NU_ANO_CONCLUSAO_1              110 -  114 ///
	str ID_TIPO_INSTITUICAO_1           115 -  116 ///
	str ID_NOME_INSTITUICAO_1           117 -  216 ///
	str FK_COD_IES_1                    217 -  225 ///
	str ID_SITUACAO_CURSO_2             226 -  226 ///
	str FK_CLASSE_CURSO_2               227 -  230 ///
	str FK_COD_AREA_OCDE_2              231 -  236 ///
	str ID_LICENCIATURA_2               237 -  238 ///
	str ID_COM_PEDAGOGICA_2             239 -  240 ///
	str NU_ANO_INICIO_2                 241 -  245 ///
	str NU_ANO_CONCLUSAO_2              246 -  250 ///
	str ID_TIPO_INSTITUICAO_2           251 -  252 ///
	str ID_NOME_INSTITUICAO_2           253 -  352 ///
	str FK_COD_IES_2                    353 -  361 ///
	str ID_SITUACAO_CURSO_3             362 -  362 ///
	str FK_CLASSE_CURSO_3               363 -  366 ///
	str FK_COD_AREA_OCDE_3              367 -  372 ///
	str ID_LICENCIATURA_3               373 -  374 ///
	str ID_COM_PEDAGOGICA_3             375 -  376 ///
	str NU_ANO_INICIO_3                 377 -  381 ///
	str NU_ANO_CONCLUSAO_3              382 -  386 ///
	str ID_TIPO_INSTITUICAO_3           387 -  388 ///
	str ID_NOME_INSTITUICAO_3           389 -  488 ///
	str FK_COD_IES_3                    489 -  497 ///
	str ID_QUIMICA                      498 -  498 ///
	str ID_FISICA                       499 -  499 ///
	str ID_MATEMATICA                   500 -  500 ///
	str ID_BIOLOGIA                     501 -  501 ///
	str ID_CIENCIAS                     502 -  502 ///
	str ID_LINGUA_LITERAT_PORTUGUESA    503 -  503 ///
	str ID_LINGUA_LITERAT_INGLES        504 -  504 ///
	str ID_LINGUA_LITERAT_ESPANHOL      505 -  505 ///
	str ID_LINGUA_LITERAT_FRANCES       506 -  506 ///
	str ID_LINGUA_LITERAT_OUTRA         507 -  507 ///
	str ID_LINGUA_LITERAT_INDIGENA      508 -  508 ///
	str ID_ARTES                        509 -  509 ///
	str ID_EDUCACAO_FISICA              510 -  510 ///
	str ID_HISTORIA                     511 -  511 ///
	str ID_GEOGRAFIA                    512 -  512 ///
	str ID_FILOSOFIA                    513 -  513 ///
	str ID_ENSINO_RELIGIOSO             514 -  514 ///
	str ID_ESTUDOS_SOCIAIS              515 -  515 ///
	str ID_SOCIOLOGIA                   516 -  516 ///
	str ID_INFORMATICA_COMPUTACAO       517 -  517 ///
	str ID_PROFISSIONALIZANTE           518 -  518 ///
	str ID_DISC_ATENDIMENTO_ESPECIAIS   519 -  519 ///
	str ID_DISC_DIVERSIDADE_SOCIO_CULT  520 -  520 ///
	str ID_LIBRAS                       521 -  521 ///
	str ID_DISCIPLINAS_PEDAG            522 -  522 ///
	str ID_OUTRAS_DISCIPLINAS           523 -  523 ///
	str ID_ESPECIALIZACAO               524 -  524 ///
	str ID_MESTRADO                     525 -  525 ///
	str ID_DOUTORADO                    526 -  526 ///
	str ID_POS_GRADUACAO_NENHUM         527 -  527 ///
	str ID_ESPECIFICO_CRECHE            528 -  528 ///
	str ID_ESPECIFICO_PRE_ESCOLA        529 -  529 ///
	str ID_ESPECIFICO_ANOS_INICIAIS     530 -  530 ///
	str ID_ESPECIFICO_ANOS_FINAIS       531 -  531 ///
	str ID_ESPECIFICO_ENS_MEDIO         532 -  532 ///
	str ID_ESPECIFICO_EJA               533 -  533 ///
	str ID_ESPECIFICO_NEC_ESP           534 -  534 ///
	str ID_ESPECIFICO_ED_INDIGENA       535 -  535 ///
	str ID_ESPECIFICO_CAMPO             536 -  536 ///
	str ID_ESPECIFICO_AMBIENTAL         537 -  537 ///
	str ID_ESPECIFICO_DIR_HUMANOS       538 -  538 ///
	str ID_ESPECIFICO_DIV_SEXUAL        539 -  539 ///
	str ID_ESPECIFICO_DIR_ADOLESC       540 -  540 ///
	str ID_ESPECIFICO_AFRO              541 -  541 ///
	str ID_ESPECIFICO_OUTROS            542 -  542 ///
	str ID_ESPECIFICO_NENHUM            543 -  543 ///
	str ID_TIPO_DOCENTE                 544 -  544 ///
	str ID_TIPO_CONTRATACAO             545 -  545 ///
	str PK_COD_TURMA                    546 -  556 ///
	str FK_COD_TIPO_TURMA               557 -  559 ///
	str FK_COD_MOD_ENSINO               560 -  562 ///
	str FK_COD_ETAPA_ENSINO             563 -  566 ///
	str FK_COD_CURSO_PROF               567 -  575 ///
	str PK_COD_ENTIDADE                 576 -  584 ///
	str FK_COD_ESTADO                   585 -  587 ///
	str SIGLA                           588 -  589 ///
	str FK_COD_MUNICIPIO                590 -  598 ///
	str FK_COD_DISTRITO                 599 -  607 ///
	str ID_LOCALIZACAO                  608 -  608 ///
	str ID_DEPENDENCIA_ADM              609 -  609 ///
	str DESC_CATEGORIA_ESCOLA_PRIVADA   610 -  610 ///
	str ID_CONVENIADA_PP                611 -  611 ///
	str ID_TIPO_CONVENIO_PODER_PUBLICO  612 -  613 ///
	str ID_MANT_ESCOLA_PRIVADA_EMP      614 -  614 ///
	str ID_MANT_ESCOLA_PRIVADA_ONG      615 -  615 ///
	str ID_MANT_ESCOLA_PRIVADA_SIST_S   616 -  616 ///
	str ID_MANT_ESCOLA_PRIVADA_SIND     617 -  617 ///
	str ID_MANT_ESCOLA_PRIVADA_S_FINS   618 -  618 ///
	str ID_DOCUMENTO_REGULAMENTACAO     619 -  619 ///
	str ID_LOCALIZACAO_DIFERENCIADA     620 -  620 ///
	str ID_EDUCACAO_INDIGENA            621 -  621 ///
	using "$input_census/2013/DADOS/TS_DOCENTES_`i'.txt"

	// Saving 2013 data
	save "$output_census/Professores2013`i'.dta", replace
	clear
}
