clear all
set more off

/* -------------------------------------------------------------------------- */
/* 2007                                                                       */
/* -------------------------------------------------------------------------- */

infix ///
str ANO_CENSO                       1   -   4 ///
str PK_COD_TURMA                    5   -   14 ///
str NO_TURMA                        15  -   94 ///
str HR_INICIAL                      95  -   96 ///
str HR_INICIAL_MINUTO               97  -   98 ///
str NU_DURACAO_TURMA                99  -   101 ///
str NUM_MATRICULAS                  102 -   104 ///
str FK_COD_MOD_ENSINO               105 -   106 ///
str FK_COD_ETAPA_ENSINO             107 -   109 ///
str FK_COD_CURSO_PROF               110 -   117 ///
str FK_COD_TIPO_TURMA               118 -   119 ///
str ID_QUIMICA                      120 -   120 ///
str ID_FISICA                       121 -   121 ///
str ID_MATEMATICA                   122 -   122 ///
str ID_BIOLOGIA                     123 -   123 ///
str ID_CIENCIAS                     124 -   124 ///
str ID_LINGUA_LITERAT_PORTUGUESA    125 -   125 ///
str ID_LINGUA_LITERAT_INGLES        126 -   126 ///
str ID_LINGUA_LITERAT_ESPANHOL      127 -   127 ///
str ID_LINGUA_LITERAT_OUTRA         128 -   128 ///
str ID_ARTES                        129 -   129 ///
str ID_EDUCACAO_FISICA              130 -   130 ///
str ID_HISTORIA                     131 -   131 ///
str ID_GEOGRAFIA                    132 -   132 ///
str ID_FILOSOFIA                    133 -   133 ///
str ID_ESTUDOS_SOCIAIS              134 -   134 ///
str ID_INFORMATICA_COMPUTACAO       135 -   135 ///
str ID_PROFISSIONALIZANTE           136 -   136 ///
str ID_DIDATICA_METODOLOGIA         137 -   137 ///
str ID_FUNDAMENTOS_EDUCACAO         138 -   138 ///
str ID_DISC_ATENDIMENTO_ESPECIAIS   139 -   139 ///
str ID_DISC_DIVERSIDADE_SOCIO_CULT  140 -   140 ///
str ID_OUTRAS_DISCIPLINAS_PEDAG     141 -   141 ///
str ID_LIBRAS                       142 -   142 ///
str ID_OUTRAS_DISCIPLINAS           143 -   143 ///
str PK_COD_ENTIDADE                 144 -   151 ///
str FK_COD_ESTADO                   152 -   153 ///
str SIGLA                           154 -   155 ///
str FK_COD_MUNICIPIO                156 -   162 ///
str ID_LOCALIZACAO                  163 -   163 ///
str ID_DEPENDENCIA_ADM              164 -   164 ///
str DESC_CATEGORIA_ESCOLA_PRIVADA   165 -   165 ///
str ID_CONVENIADA_PP                166 -   166 ///
str ID_MANT_ESCOLA_PRIVADA_EMP      167 -   167 ///
str ID_MANT_ESCOLA_PRIVADA_ONG      168 -   168 ///
str ID_MANT_ESCOLA_PRIVADA_SIND     169 -   169 ///
str ID_MANT_ESCOLA_PRIVADA_APAE     170 -   170 ///
str ID_DOCUMENTO_REGULAMENTACAO     171 -   171 ///
str ID_LOCALIZACAO_DIFERENCIADA     172 -   172 ///
str ID_EDUCACAO_INDIGENA            173 -   173 ///
using "$input_census/2007/DADOS/TS_TURMA.TXT"

save "$output_census/Turmas2007.dta", replace
clear

/* -------------------------------------------------------------------- */
/* 2008                                                                 */
/* -------------------------------------------------------------------- */

infix ///
str ANO_CENSO                       1   -   6 ///
str PK_COD_TURMA                    7   -   18 ///
str NO_TURMA                        19  -   98 ///
str HR_INICIAL                      99  -   100 ///
str HR_INICIAL_MINUTO               101 -   102 ///
str NU_DURACAO_TURMA                103 -   109 ///
str NUM_MATRICULAS                  110 -   116 ///
str FK_COD_MOD_ENSINO               117 -   120 ///
str FK_COD_ETAPA_ENSINO             121 -   124 ///
str FK_COD_CURSO_PROF               125 -   133 ///
str FK_COD_TIPO_TURMA               134 -   137 ///
str ID_VEZ_ATIVIDADE_COMPLEMENTAR   138 -   139 ///
str FK_COD_TIPO_ATIVIDADE_1         140 -   145 ///
str FK_COD_TIPO_ATIVIDADE_2         146 -   150 ///
str FK_COD_TIPO_ATIVIDADE_3         151 -   155 ///
str FK_COD_TIPO_ATIVIDADE_4         156 -   160 ///
str FK_COD_TIPO_ATIVIDADE_5         161 -   165 ///
str FK_COD_TIPO_ATIVIDADE_6         166 -   170 ///
str ID_QUIMICA                      171 -   171 ///
str ID_FISICA                       172 -   172 ///
str ID_MATEMATICA                   173 -   173 ///
str ID_BIOLOGIA                     174 -   174 ///
str ID_CIENCIAS                     175 -   175 ///
str ID_LINGUA_LITERAT_PORTUGUESA    176 -   176 ///
str ID_LINGUA_LITERAT_INGLES        177 -   177 ///
str ID_LINGUA_LITERAT_ESPANHOL      178 -   178 ///
str ID_LINGUA_LITERAT_OUTRA         179 -   179 ///
str ID_ARTES                        180 -   180 ///
str ID_EDUCACAO_FISICA              181 -   181 ///
str ID_HISTORIA                     182 -   182 ///
str ID_GEOGRAFIA                    183 -   183 ///
str ID_FILOSOFIA                    184 -   184 ///
str ID_ESTUDOS_SOCIAIS              185 -   185 ///
str ID_INFORMATICA_COMPUTACAO       186 -   186 ///
str ID_PROFISSIONALIZANTE           187 -   187 ///
str ID_DIDATICA_METODOLOGIA         188 -   188 ///
str ID_FUNDAMENTOS_EDUCACAO         189 -   189 ///
str ID_DISC_ATENDIMENTO_ESPECIAIS   190 -   190 ///
str ID_DISC_DIVERSIDADE_SOCIO_CULT  191 -   191 ///
str ID_OUTRAS_DISCIPLINAS_PEDAG     192 -   192 ///
str ID_LIBRAS                       193 -   193 ///
str ID_OUTRAS_DISCIPLINAS           194 -   194 ///
str PK_COD_ENTIDADE                 195 -   204 ///
str FK_COD_ESTADO                   205 -   208 ///
str SIGLA                           209 -   210 ///
str FK_COD_MUNICIPIO                211 -   224 ///
str ID_LOCALIZACAO                  225 -   225 ///
str ID_DEPENDENCIA_ADM              226 -   226 ///
str DESC_CATEGORIA_ESCOLA_PRIVADA   227 -   227 ///
str ID_CONVENIADA_PP                228 -   228 ///
str ID_TIPO_CONVENIO_PODER_PUBLICO  229 -   236 ///
str ID_MANT_ESCOLA_PRIVADA_EMP      237 -   237 ///
str ID_MANT_ESCOLA_PRIVADA_ONG      238 -   238 ///
str ID_MANT_ESCOLA_PRIVADA_SIND     239 -   239 ///
str ID_MANT_ESCOLA_PRIVADA_APAE     240 -   240 ///
str ID_DOCUMENTO_REGULAMENTACAO     241 -   241 ///
str ID_LOCALIZACAO_DIFERENCIADA     242 -   242 ///
str ID_EDUCACAO_INDIGENA            243 -   243 ///
using "$input_census/2008/DADOS/TS_TURMA.txt"

save "$output_census/Turmas2008.dta", replace
clear


/* -------------------------------------------------------------------------- */
/* 2009                                                                       */
/* -------------------------------------------------------------------------- */
infix  ///
str	ANO_CENSO			1	 - 	5 ///
str	PK_COD_TURMA			6	 - 	16 ///
str	NO_TURMA			17	 - 	96 ///
str	HR_INICIAL			97	 - 	98 ///
str	HR_INICIAL_MINUTO		99	 - 	100 ///
str	NU_DURACAO_TURMA		101	 - 	104 ///
str	NUM_MATRICULAS			105	 - 	109 ///
str	FK_COD_MOD_ENSINO		110	 - 	112 ///
str	FK_COD_ETAPA_ENSINO		113	 - 	116 ///
str	FK_COD_CURSO_PROF		117	 - 	125 ///
str	FK_COD_TIPO_TURMA		126	 - 	128 ///
str	ID_VEZ_ATIVIDADE_COMPLEMENTAR	129	 - 	130 ///
str	FK_COD_TIPO_ATIVIDADE_1		131	 - 	136 ///
str	FK_COD_TIPO_ATIVIDADE_2		137	 - 	142 ///
str	FK_COD_TIPO_ATIVIDADE_3		143	 - 	148 ///
str	FK_COD_TIPO_ATIVIDADE_4		149	 - 	154 ///
str	FK_COD_TIPO_ATIVIDADE_5		155	 - 	160 ///
str	FK_COD_TIPO_ATIVIDADE_6		161	 - 	166 ///
str	ID_BRAILLE			167	 - 	167 ///
str	ID_AUTONOMA			168	 - 	168 ///
str	ID_RECURSOS_BAIXA_VISAO		169	 - 	169 ///
str	ID_PROCESSOS_MENTAIS		170	 - 	170 ///
str	ID_ORIENTACAO_MOBILIDADE	171	 - 	171 ///
str	ID_SINAIS			172	 - 	172 ///
str	ID_COM_ALT_AUMENT		173	 - 	173 ///
str	ID_ENRIQ_CURRICULAR		174	 - 	174 ///
str	ID_SOROBAN			175	 - 	175 ///
str	ID_INF_ACESSIVEL		176	 - 	176 ///
str	ID_PORT_ESC			177	 - 	177 ///
str	ID_QUIMICA			178	 - 	178 ///
str	ID_FISICA			179	 - 	179 ///
str	ID_MATEMATICA			180	 - 	180 ///
str	ID_BIOLOGIA			181	 - 	181 ///
str	ID_CIENCIAS			182	 - 	182 ///
str	ID_LINGUA_LITERAT_PORTUGUESA	183	 - 	183 ///
str	ID_LINGUA_LITERAT_INGLES	184	 - 	184 ///
str	ID_LINGUA_LITERAT_ESPANHOL	185	 - 	185 ///
str	ID_LINGUA_LITERAT_OUTRA		186	 - 	186 ///
str	ID_LINGUA_LITERAT_INDIGENA	187	 - 	187 ///
str	ID_ARTES			188	 - 	188 ///
str	ID_EDUCACAO_FISICA		189	 - 	189 ///
str	ID_HISTORIA			190	 - 	190 ///
str	ID_GEOGRAFIA			191	 - 	191 ///
str	ID_FILOSOFIA			192	 - 	192 ///
str	ID_ENSINO_RELIGIOSO		193	 - 	193 ///
str	ID_ESTUDOS_SOCIAIS		194	 - 	194 ///
str	ID_INFORMATICA_COMPUTACAO	195	 - 	195 ///
str	ID_PROFISSIONALIZANTE		196	 - 	196 ///
str	ID_DISC_ATENDIMENTO_ESPECIAIS	197	 - 	197 ///
str	ID_DISC_DIVERSIDADE_SOCIO_CULT	198	 - 	198 ///
str	ID_LIBRAS			199	 - 	199 ///
str	ID_DISCIPLINAS_PEDAG		200	 - 	200 ///
str	ID_OUTRAS_DISCIPLINAS		201	 - 	201 ///
str	PK_COD_ENTIDADE			202	 - 	210 ///
str	FK_COD_ESTADO			211	 - 	213 ///
str	SIGLA				214	 - 	215 ///
str	FK_COD_MUNICIPIO		216	 - 	223 ///
str	ID_LOCALIZACAO			224	 - 	224 ///
str	ID_DEPENDENCIA_ADM		225	 - 	225 ///
str	DESC_CATEGORIA_ESCOLA_PRIVADA	226	 - 	226 ///
str	ID_CONVENIADA_PP		227	 - 	227 ///
str	ID_TIPO_CONVENIO_PODER_PUBLICO	228	 - 	229 ///
str	ID_MANT_ESCOLA_PRIVADA_EMP	230	 - 	230 ///
str	ID_MANT_ESCOLA_PRIVADA_ONG	231	 - 	231 ///
str	ID_MANT_ESCOLA_PRIVADA_SIND	232	 - 	232 ///
str	ID_MANT_ESCOLA_PRIVADA_S_FINS	233	 - 	233 ///
str	ID_DOCUMENTO_REGULAMENTACAO	234	 - 	234 ///
str	ID_LOCALIZACAO_DIFERENCIADA	235	 - 	235 ///
str	ID_EDUCACAO_INDIGENA		236	 - 	236 ///
using "$input_census/2009/DADOS/TS_TURMA.TXT"

save "$output_census/Turmas2009.dta", replace
clear


/* -------------------------------------------------------------------------- */
/* 2010                                                                       */
/* -------------------------------------------------------------------------- */

infix ///
str ANO_CENSO                       1   -   5 ///
str PK_COD_TURMA                    6   -   16 ///
str NO_TURMA                        17  -   96 ///
str HR_INICIAL                      97  -   98 ///
str HR_INICIAL_MINUTO               99  -   100 ///
str NU_DURACAO_TURMA                101 -   105 ///
str NUM_MATRICULAS                  106 -   111 ///
str FK_COD_MOD_ENSINO               112 -   114 ///
str FK_COD_ETAPA_ENSINO             115 -   118 ///
str FK_COD_CURSO_PROF               119 -   127 ///
str FK_COD_TIPO_TURMA               128 -   130 ///
str ID_VEZ_ATIVIDADE_COMPLEMENTAR   131 -   132 ///
str FK_COD_TIPO_ATIVIDADE_1         133 -   138 ///
str FK_COD_TIPO_ATIVIDADE_2         139 -   144 ///
str FK_COD_TIPO_ATIVIDADE_3         145 -   150 ///
str FK_COD_TIPO_ATIVIDADE_4         151 -   156 ///
str FK_COD_TIPO_ATIVIDADE_5         157 -   162 ///
str FK_COD_TIPO_ATIVIDADE_6         163 -   168 ///
str ID_BRAILLE                      169 -   169 ///
str ID_AUTONOMA                     170 -   170 ///
str ID_RECURSOS_BAIXA_VISAO         171 -   171 ///
str ID_PROCESSOS_MENTAIS            172 -   172 ///
str ID_ORIENTACAO_MOBILIDADE        173 -   173 ///
str ID_SINAIS                       174 -   174 ///
str ID_COM_ALT_AUMENT               175 -   175 ///
str ID_ENRIQ_CURRICULAR             176 -   176 ///
str ID_SOROBAN                      177 -   177 ///
str ID_INF_ACESSIVEL                178 -   178 ///
str ID_PORT_ESC                     179 -   179 ///
str ID_QUIMICA                      180 -   180 ///
str ID_FISICA                       181 -   181 ///
str ID_MATEMATICA                   182 -   182 ///
str ID_BIOLOGIA                     183 -   183 ///
str ID_CIENCIAS                     184 -   184 ///
str ID_LINGUA_LITERAT_PORTUGUESA    185 -   185 ///
str ID_LINGUA_LITERAT_INGLES        186 -   186 ///
str ID_LINGUA_LITERAT_ESPANHOL      187 -   187 ///
str ID_LINGUA_LITERAT_OUTRA         188 -   188 ///
str ID_LINGUA_LITERAT_INDIGENA      189 -   189 ///
str ID_ARTES                        190 -   190 ///
str ID_EDUCACAO_FISICA              191 -   191 ///
str ID_HISTORIA                     192 -   192 ///
str ID_GEOGRAFIA                    193 -   193 ///
str ID_FILOSOFIA                    194 -   194 ///
str ID_ENSINO_RELIGIOSO             195 -   195 ///
str ID_ESTUDOS_SOCIAIS              196 -   196 ///
str ID_INFORMATICA_COMPUTACAO       197 -   197 ///
str ID_PROFISSIONALIZANTE           198 -   198 ///
str ID_DISC_ATENDIMENTO_ESPECIAIS   199 -   199 ///
str ID_DISC_DIVERSIDADE_SOCIO_CULT  200 -   200 ///
str ID_LIBRAS                       201 -   201 ///
str ID_DISCIPLINAS_PEDAG            202 -   202 ///
str ID_OUTRAS_DISCIPLINAS           203 -   203 ///
str PK_COD_ENTIDADE                 204 -   212 ///
str FK_COD_ESTADO                   213 -   215 ///
str SIGLA                           216 -   217 ///
str FK_COD_MUNICIPIO                218 -   225 ///
str ID_LOCALIZACAO                  226 -   226 ///
str ID_DEPENDENCIA_ADM              227 -   227 ///
str DESC_CATEGORIA_ESCOLA_PRIVADA   228 -   228 ///
str ID_CONVENIADA_PP                229 -   229 ///
str ID_TIPO_CONVENIO_PODER_PUBLICO  230 -   231 ///
str ID_MANT_ESCOLA_PRIVADA_EMP      232 -   232 ///
str ID_MANT_ESCOLA_PRIVADA_ONG      233 -   233 ///
str ID_MANT_ESCOLA_PRIVADA_SIND     234 -   234 ///
str ID_MANT_ESCOLA_PRIVADA_S_FINS   235 -   235 ///
str ID_DOCUMENTO_REGULAMENTACAO     236 -   236 ///
str ID_LOCALIZACAO_DIFERENCIADA     237 -   237 ///
str ID_EDUCACAO_INDIGENA            238 -   238 ///
using "$input_census/2010/DADOS/TS_TURMA.TXT"

save "$output_census/Turmas2010.dta", replace
clear

/* -------------------------------------------------------------------------- */
/* 2011                                                                       */
/* -------------------------------------------------------------------------- */

infix ///
str ANO_CENSO                       1   -   5 ///
str PK_COD_TURMA                    6   -   16 ///
str NO_TURMA                        17  -   96 ///
str HR_INICIAL                      97  -   98 ///
str HR_INICIAL_MINUTO               99  -   100 ///
str NU_DURACAO_TURMA                101 -   105 ///
str NUM_MATRICULAS                  106 -   111 ///
str FK_COD_MOD_ENSINO               112 -   114 ///
str FK_COD_ETAPA_ENSINO             115 -   118 ///
str FK_COD_CURSO_PROF               119 -   127 ///
str FK_COD_TIPO_TURMA               128 -   130 ///
str ID_VEZ_ATIVIDADE_COMPLEMENTAR   131 -   132 ///
str FK_COD_TIPO_ATIVIDADE_1         133 -   138 ///
str FK_COD_TIPO_ATIVIDADE_2         139 -   144 ///
str FK_COD_TIPO_ATIVIDADE_3         145 -   150 ///
str FK_COD_TIPO_ATIVIDADE_4         151 -   156 ///
str FK_COD_TIPO_ATIVIDADE_5         157 -   162 ///
str FK_COD_TIPO_ATIVIDADE_6         163 -   168 ///
str ID_BRAILLE                      169 -   169 ///
str ID_RECURSOS_BAIXA_VISAO         170 -   170 ///
str ID_PROCESSOS_MENTAIS            171 -   171 ///
str ID_ORIENTACAO_MOBILIDADE        172 -   172 ///
str ID_SINAIS                       173 -   173 ///
str ID_COM_ALT_AUMENT               174 -   174 ///
str ID_ENRIQ_CURRICULAR             175 -   175 ///
str ID_SOROBAN                      176 -   176 ///
str ID_INF_ACESSIVEL                177 -   177 ///
str ID_PORT_ESC                     178 -   178 ///
str ID_AUT_ESCOLAR                  179 -   179 ///
str ID_QUIMICA                      180 -   180 ///
str ID_FISICA                       181 -   181 ///
str ID_MATEMATICA                   182 -   182 ///
str ID_BIOLOGIA                     183 -   183 ///
str ID_CIENCIAS                     184 -   184 ///
str ID_LINGUA_LITERAT_PORTUGUESA    185 -   185 ///
str ID_LINGUA_LITERAT_INGLES        186 -   186 ///
str ID_LINGUA_LITERAT_ESPANHOL      187 -   187 ///
str ID_LINGUA_LITERAT_OUTRA         188 -   188 ///
str ID_LINGUA_LITERAT_INDIGENA      189 -   189 ///
str ID_ARTES                        190 -   190 ///
str ID_EDUCACAO_FISICA              191 -   191 ///
str ID_HISTORIA                     192 -   192 ///
str ID_GEOGRAFIA                    193 -   193 ///
str ID_FILOSOFIA                    194 -   194 ///
str ID_ENSINO_RELIGIOSO             195 -   195 ///
str ID_ESTUDOS_SOCIAIS              196 -   196 ///
str ID_INFORMATICA_COMPUTACAO       197 -   197 ///
str ID_PROFISSIONALIZANTE           198 -   198 ///
str ID_DISC_ATENDIMENTO_ESPECIAIS   199 -   199 ///
str ID_DISC_DIVERSIDADE_SOCIO_CULT  200 -   200 ///
str ID_LIBRAS                       201 -   201 ///
str ID_DISCIPLINAS_PEDAG            202 -   202 ///
str ID_OUTRAS_DISCIPLINAS           203 -   203 ///
str PK_COD_ENTIDADE                 204 -   212 ///
str FK_COD_ESTADO                   213 -   215 ///
str SIGLA                           216 -   217 ///
str FK_COD_MUNICIPIO                218 -   225 ///
str FK_COD_DISTRITO                 226 -   233 ///
str ID_LOCALIZACAO                  234 -   234 ///
str ID_DEPENDENCIA_ADM              235 -   235 ///
str DESC_CATEGORIA_ESCOLA_PRIVADA   236 -   236 ///
str ID_CONVENIADA_PP                237 -   237 ///
str ID_TIPO_CONVENIO_PODER_PUBLICO  238 -   239 ///
str ID_MANT_ESCOLA_PRIVADA_EMP      240 -   240 ///
str ID_MANT_ESCOLA_PRIVADA_ONG      241 -   241 ///
str ID_MANT_ESCOLA_PRIVADA_SIND     242 -   242 ///
str ID_MANT_ESCOLA_PRIVADA_S_FINS   243 -   243 ///
str ID_DOCUMENTO_REGULAMENTACAO     244 -   244 ///
str ID_LOCALIZACAO_DIFERENCIADA     245 -   245 ///
str ID_EDUCACAO_INDIGENA            246 -   246 ///
using "$input_census/2011/DADOS/TS_TURMA.TXT"

save "$output_census/Turmas2011.dta", replace
clear

/* -------------------------------------------------------------------------- */
/* 2012                                                                       */
/* -------------------------------------------------------------------------- */

infix ///
str ANO_CENSO                       1   -   5 ///
str PK_COD_TURMA                    6   -   16 ///
str NO_TURMA                        17  -   96 ///
str HR_INICIAL                      97  -   98 ///
str HR_INICIAL_MINUTO               99  -   100 ///
str NU_DURACAO_TURMA                101 -   106 ///
str NUM_MATRICULAS                  107 -   112 ///
str FK_COD_MOD_ENSINO               113 -   115 ///
str FK_COD_ETAPA_ENSINO             116 -   119 ///
str FK_COD_CURSO_PROF               120 -   128 ///
str FK_COD_TIPO_TURMA               129 -   131 ///
str ID_MAIS_EDUCACAO                132 -   132 ///
str ID_DIA_SEMANA_DOMINGO           133 -   133 ///
str ID_DIA_SEMANA_SEGUNDA           134 -   134 ///
str ID_DIA_SEMANA_TERCA             135 -   135 ///
str ID_DIA_SEMANA_QUARTA            136 -   136 ///
str ID_DIA_SEMANA_QUINTA            137 -   137 ///
str ID_DIA_SEMANA_SEXTA             138 -   138 ///
str ID_DIA_SEMANA_SABADO            139 -   139 ///
str FK_COD_TIPO_ATIVIDADE_1         140 -   145 ///
str FK_COD_TIPO_ATIVIDADE_2         146 -   151 ///
str FK_COD_TIPO_ATIVIDADE_3         152 -   157 ///
str FK_COD_TIPO_ATIVIDADE_4         158 -   163 ///
str FK_COD_TIPO_ATIVIDADE_5         164 -   169 ///
str FK_COD_TIPO_ATIVIDADE_6         170 -   175 ///
str ID_BRAILLE                      176 -   176 ///
str ID_RECURSOS_BAIXA_VISAO         177 -   177 ///
str ID_PROCESSOS_MENTAIS            178 -   178 ///
str ID_ORIENTACAO_MOBILIDADE        179 -   179 ///
str ID_SINAIS                       180 -   180 ///
str ID_COM_ALT_AUMENT               181 -   181 ///
str ID_ENRIQ_CURRICULAR             182 -   182 ///
str ID_SOROBAN                      183 -   183 ///
str ID_INF_ACESSIVEL                184 -   184 ///
str ID_PORT_ESC                     185 -   185 ///
str ID_AUT_ESCOLAR                  186 -   186 ///
str ID_QUIMICA                      187 -   187 ///
str ID_FISICA                       188 -   188 ///
str ID_MATEMATICA                   189 -   189 ///
str ID_BIOLOGIA                     190 -   190 ///
str ID_CIENCIAS                     191 -   191 ///
str ID_LINGUA_LITERAT_PORTUGUESA    192 -   192 ///
str ID_LINGUA_LITERAT_INGLES        193 -   193 ///
str ID_LINGUA_LITERAT_ESPANHOL      194 -   194 ///
str ID_LINGUA_LITERAT_FRANCES       195 -   195 ///
str ID_LINGUA_LITERAT_OUTRA         196 -   196 ///
str ID_LINGUA_LITERAT_INDIGENA      197 -   197 ///
str ID_ARTES                        198 -   198 ///
str ID_EDUCACAO_FISICA              199 -   199 ///
str ID_HISTORIA                     200 -   200 ///
str ID_GEOGRAFIA                    201 -   201 ///
str ID_FILOSOFIA                    202 -   202 ///
str ID_ENSINO_RELIGIOSO             203 -   203 ///
str ID_ESTUDOS_SOCIAIS              204 -   204 ///
str ID_SOCIOLOGIA                   205 -   205 ///
str ID_INFORMATICA_COMPUTACAO       206 -   206 ///
str ID_PROFISSIONALIZANTE           207 -   207 ///
str ID_DISC_ATENDIMENTO_ESPECIAIS   208 -   208 ///
str ID_DISC_DIVERSIDADE_SOCIO_CULT  209 -   209 ///
str ID_LIBRAS                       210 -   210 ///
str ID_DISCIPLINAS_PEDAG            211 -   211 ///
str ID_OUTRAS_DISCIPLINAS           212 -   212 ///
str PK_COD_ENTIDADE                 213 -   221 ///
str FK_COD_ESTADO                   222 -   224 ///
str SIGLA                           225 -   226 ///
str FK_COD_MUNICIPIO                227 -   235 ///
str FK_COD_DISTRITO                 236 -   244 ///
str ID_LOCALIZACAO                  245 -   245 ///
str ID_DEPENDENCIA_ADM              246 -   246 ///
str DESC_CATEGORIA_ESCOLA_PRIVADA   247 -   247 ///
str ID_CONVENIADA_PP                248 -   248 ///
str ID_TIPO_CONVENIO_PODER_PUBLICO  249 -   250 ///
str ID_MANT_ESCOLA_PRIVADA_EMP      251 -   251 ///
str ID_MANT_ESCOLA_PRIVADA_ONG      252 -   252 ///
str ID_MANT_ESCOLA_PRIVADA_SIST_S   253 -   253 ///
str ID_MANT_ESCOLA_PRIVADA_SIND     254 -   254 ///
str ID_MANT_ESCOLA_PRIVADA_S_FINS   255 -   255 ///
str ID_DOCUMENTO_REGULAMENTACAO     256 -   256 ///
str ID_LOCALIZACAO_DIFERENCIADA     257 -   257 ///
str ID_EDUCACAO_INDIGENA            258 -   258 ///
using "$input_census/2012/DADOS/TS_TURMA.TXT"

save "$output_census/Turmas2012.dta", replace
clear

/* -------------------------------------------------------------------------- */
/* 2013                                                                       */
/* -------------------------------------------------------------------------- */

infix ///
str ANO_CENSO                       1   -   5 ///
str PK_COD_TURMA                    6   -   16 ///
str NO_TURMA                        17  -   96 ///
str HR_INICIAL                      97  -   98 ///
str HR_INICIAL_MINUTO               99  -   100 ///
str NU_DURACAO_TURMA                101 -   106 ///
str NUM_MATRICULAS                  107 -   112 ///
str FK_COD_MOD_ENSINO               113 -   115 ///
str FK_COD_ETAPA_ENSINO             116 -   119 ///
str FK_COD_CURSO_PROF               120 -   128 ///
str FK_COD_TIPO_TURMA               129 -   131 ///
str ID_MAIS_EDUCACAO                132 -   132 ///
str ID_DIA_SEMANA_DOMINGO           133 -   133 ///
str ID_DIA_SEMANA_SEGUNDA           134 -   134 ///
str ID_DIA_SEMANA_TERCA             135 -   135 ///
str ID_DIA_SEMANA_QUARTA            136 -   136 ///
str ID_DIA_SEMANA_QUINTA            137 -   137 ///
str ID_DIA_SEMANA_SEXTA             138 -   138 ///
str ID_DIA_SEMANA_SABADO            139 -   139 ///
str FK_COD_TIPO_ATIVIDADE_1         140 -   145 ///
str FK_COD_TIPO_ATIVIDADE_2         146 -   151 ///
str FK_COD_TIPO_ATIVIDADE_3         152 -   157 ///
str FK_COD_TIPO_ATIVIDADE_4         158 -   163 ///
str FK_COD_TIPO_ATIVIDADE_5         164 -   169 ///
str FK_COD_TIPO_ATIVIDADE_6         170 -   175 ///
str ID_BRAILLE                      176 -   176 ///
str ID_RECURSOS_BAIXA_VISAO         177 -   177 ///
str ID_PROCESSOS_MENTAIS            178 -   178 ///
str ID_ORIENTACAO_MOBILIDADE        179 -   179 ///
str ID_SINAIS                       180 -   180 ///
str ID_COM_ALT_AUMENT               181 -   181 ///
str ID_ENRIQ_CURRICULAR             182 -   182 ///
str ID_SOROBAN                      183 -   183 ///
str ID_INF_ACESSIVEL                184 -   184 ///
str ID_PORT_ESC                     185 -   185 ///
str ID_AUT_ESCOLAR                  186 -   186 ///
str ID_QUIMICA                      187 -   187 ///
str ID_FISICA                       188 -   188 ///
str ID_MATEMATICA                   189 -   189 ///
str ID_BIOLOGIA                     190 -   190 ///
str ID_CIENCIAS                     191 -   191 ///
str ID_LINGUA_LITERAT_PORTUGUESA    192 -   192 ///
str ID_LINGUA_LITERAT_INGLES        193 -   193 ///
str ID_LINGUA_LITERAT_ESPANHOL      194 -   194 ///
str ID_LINGUA_LITERAT_FRANCES       195 -   195 ///
str ID_LINGUA_LITERAT_OUTRA         196 -   196 ///
str ID_LINGUA_LITERAT_INDIGENA      197 -   197 ///
str ID_ARTES                        198 -   198 ///
str ID_EDUCACAO_FISICA              199 -   199 ///
str ID_HISTORIA                     200 -   200 ///
str ID_GEOGRAFIA                    201 -   201 ///
str ID_FILOSOFIA                    202 -   202 ///
str ID_ENSINO_RELIGIOSO             203 -   203 ///
str ID_ESTUDOS_SOCIAIS              204 -   204 ///
str ID_SOCIOLOGIA                   205 -   205 ///
str ID_INFORMATICA_COMPUTACAO       206 -   206 ///
str ID_PROFISSIONALIZANTE           207 -   207 ///
str ID_DISC_ATENDIMENTO_ESPECIAIS   208 -   208 ///
str ID_DISC_DIVERSIDADE_SOCIO_CULT  209 -   209 ///
str ID_LIBRAS                       210 -   210 ///
str ID_DISCIPLINAS_PEDAG            211 -   211 ///
str ID_OUTRAS_DISCIPLINAS           212 -   212 ///
str PK_COD_ENTIDADE                 213 -   221 ///
str FK_COD_ESTADO                   222 -   224 ///
str SIGLA                           225 -   226 ///
str FK_COD_MUNICIPIO                227 -   235 ///
str FK_COD_DISTRITO                 236 -   244 ///
str ID_LOCALIZACAO                  245 -   245 ///
str ID_DEPENDENCIA_ADM              246 -   246 ///
str DESC_CATEGORIA_ESCOLA_PRIVADA   247 -   247 ///
str ID_CONVENIADA_PP                248 -   248 ///
str ID_TIPO_CONVENIO_PODER_PUBLICO  249 -   250 ///
str ID_MANT_ESCOLA_PRIVADA_EMP      251 -   251 ///
str ID_MANT_ESCOLA_PRIVADA_ONG      252 -   252 ///
str ID_MANT_ESCOLA_PRIVADA_SIST_S   253 -   253 ///
str ID_MANT_ESCOLA_PRIVADA_SIND     254 -   254 ///
str ID_MANT_ESCOLA_PRIVADA_S_FINS   255 -   255 ///
str ID_DOCUMENTO_REGULAMENTACAO     256 -   256 ///
str ID_LOCALIZACAO_DIFERENCIADA     257 -   257 ///
str ID_EDUCACAO_INDIGENA            258 -   258 ///
using "$input_census/2013/DADOS/TS_TURMA.TXT"

save "$output_census/Turmas2013.dta", replace
clear
