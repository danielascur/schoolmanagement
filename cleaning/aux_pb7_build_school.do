***
*1*IMPORTING PROVA BRASIL MICRODATA AT SCHOOL LEVEL*
***


*------------------------------------------------------------------------------------------------------------------------*
*2007*
*------------------------------------------------------------------------------------------------------------------------*
*------------------------------------------------------------------------------------------------------------------------*
	clear
	#delimit;
	infix
		str PK_COD_ENTIDADE       1-8
		str ID_DEPENDENCIA_ADM    9-9
		str ID_LOCALIZACAO        10-10
		str SIGLA_UF              11-12
		str COD_UF                13-14
		str NO_MUNICIPIO          15-64
		str COD_MUNICIPIO         65-71
		str TX_RESP_QUESTIONARIO  72-140
		using "$input_pb/2007/DADOS/TS_QUEST_ESCOLA.TXT";
	#delimit cr

	* Converting the numeric ID fields to numeric
	destring PK_COD_ENTIDADE ID_DEPENDENCIA_ADM ID_LOCALIZACAO COD_UF COD_MUNICIPIO, replace

	* Defining harmonized variable names
	global infra_names "infra_predio_telhado infra_predio_paredes infra_predio_piso infra_predio_portas infra_predio_janelas infra_predio_banheiros infra_predio_cozinha infra_predio_hidraulica infra_predio_eletrica"

	* Generating infrastructure variables from the questionnaire string
	local i = 1
	foreach var of global infra_names {
	    gen `var' = substr(TX_RESP_QUESTIONARIO, `i', 1)
	    local ++i
	}

	* Standardizing ID variable
	rename PK_COD_ENTIDADE ID_ESCOLA

	* Keeping only necessary variables
	keep ID_ESCOLA ID_DEPENDENCIA_ADM ID_LOCALIZACAO COD_UF COD_MUNICIPIO $infra_names

	* Converting the new infrastructure variables to numeric
	destring $infra_names, replace

	compress
	save "$output_pb/School_2007.dta", replace



*------------------------------------------------------------------------------------------------------------------------*
*2009*
*------------------------------------------------------------------------------------------------------------------------*
*------------------------------------------------------------------------------------------------------------------------*
	clear
	insheet using "$input_pb/2009/DADOS/TS_QUEST_ESCOLA.txt", names delimiter(";")

	* Defining harmonized variable names
	global infra_names "infra_predio_telhado infra_predio_paredes infra_predio_piso infra_predio_portas infra_predio_janelas infra_predio_banheiros infra_predio_cozinha infra_predio_hidraulica infra_predio_eletrica"

	* Generating infrastructure variables from the questionnaire string
	* Using positions from the questionnaire (1.1, 1.2, 1.3, 1.8-1.13)
	gen infra_predio_telhado = substr(tx_resp_questionario, 1, 1)
	gen infra_predio_paredes = substr(tx_resp_questionario, 2, 1)
	gen infra_predio_piso = substr(tx_resp_questionario, 3, 1)
	gen infra_predio_portas = substr(tx_resp_questionario, 8, 1)
	gen infra_predio_janelas = substr(tx_resp_questionario, 9, 1)
	gen infra_predio_banheiros = substr(tx_resp_questionario, 10, 1)
	gen infra_predio_cozinha = substr(tx_resp_questionario, 11, 1)
	gen infra_predio_hidraulica = substr(tx_resp_questionario, 12, 1)
	gen infra_predio_eletrica = substr(tx_resp_questionario, 13, 1)

	* Standardizing ID variables to uppercase
	rename pk_cod_entidade ID_ESCOLA
	rename id_dependencia_adm ID_DEPENDENCIA_ADM
	rename id_localizacao ID_LOCALIZACAO
	rename cod_uf COD_UF
	rename cod_municipio COD_MUNICIPIO

	* Keeping only necessary variables
	keep ID_ESCOLA ID_DEPENDENCIA_ADM ID_LOCALIZACAO COD_UF COD_MUNICIPIO $infra_names

	* Destringing all variables (IDs and new infra vars)
	destring, replace
	compress
	save "$output_pb/School_2009.dta", replace




	
	
*------------------------------------------------------------------------------------------------------------------------*
*2011*
*------------------------------------------------------------------------------------------------------------------------*
*------------------------------------------------------------------------------------------------------------------------*
import delimited "$input_pb/2011/DADOS/TS_QUEST_ESCOLA.csv", delimiter(";") clear

	* Defining the harmonized names
	global infra_names "infra_predio_telhado infra_predio_paredes infra_predio_piso infra_predio_portas infra_predio_janelas infra_predio_banheiros infra_predio_cozinha infra_predio_hidraulica infra_predio_eletrica"

	* Defining 2011 variable names (lowercase)
	local infra_vars_2011 "tx_resp_q001 tx_resp_q002 tx_resp_q003 tx_resp_q008 tx_resp_q009 tx_resp_q010 tx_resp_q011 tx_resp_q012 tx_resp_q013"

	* Renaming variables to harmonized names
	local i = 1
	foreach var of local infra_vars_2011 {
	    local new_name: word `i' of $infra_names
	    rename `var' `new_name'
	    local ++i
	}

	* Standardizing ID variables to uppercase
	rename (id_escola id_dependencia_adm id_localizacao id_uf id_municipio) ///
	       (ID_ESCOLA ID_DEPENDENCIA_ADM ID_LOCALIZACAO ID_UF ID_MUNICIPIO)

	* Keeping only necessary variables
	keep ID_ESCOLA ID_DEPENDENCIA_ADM ID_LOCALIZACAO ID_UF ID_MUNICIPIO $infra_names

	destring, replace
	compress
	save "$output_pb/School_2011.dta", replace






*------------------------------------------------------------------------------------------------------------------------*
*2013, 2015 and 2017*
*------------------------------------------------------------------------------------------------------------------------*
*------------------------------------------------------------------------------------------------------------------------*

	* Defining the harmonized names
	global infra_names "infra_predio_telhado infra_predio_paredes infra_predio_piso infra_predio_portas infra_predio_janelas infra_predio_banheiros infra_predio_cozinha infra_predio_hidraulica infra_predio_eletrica"

	* Defining variable names for 2013-2017 (lowercase)
	local infra_vars_13_17 "tx_resp_q007 tx_resp_q008 tx_resp_q009 tx_resp_q010 tx_resp_q011 tx_resp_q012 tx_resp_q013 tx_resp_q014 tx_resp_q015"

	foreach year in 2013 2015 2017 {
	    import delimited "$input_pb/`year'/DADOS/TS_ESCOLA.csv", delimiter(",") clear
	    
	    * Renaming variables to harmonized names
	    local i = 1
	    foreach var of local infra_vars_13_17 {
		local new_name: word `i' of $infra_names
		rename `var' `new_name'
		local ++i
	    }
	    
	    * Standardizing ID variables to uppercase
	    rename (id_escola id_dependencia_adm id_localizacao id_uf id_municipio) ///
		   (ID_ESCOLA ID_DEPENDENCIA_ADM ID_LOCALIZACAO ID_UF ID_MUNICIPIO)
	    
	    * Keeping only necessary variables
	    keep ID_ESCOLA ID_DEPENDENCIA_ADM ID_LOCALIZACAO ID_UF ID_MUNICIPIO $infra_names

	    destring, replace
	    compress
	    save "$output_pb/School_`year'.dta", replace
	}







			
***
*2*Merging everything together
***		
	* Loading 2007 data and adding year variable
	use "$output_pb/School_2007.dta", clear
	gen year = 2007

	* Saving 2007 as the temporary base file to append to
	tempfile base_data
	save `base_data'

	* Appending all subsequent years
	foreach y in 2009 2011 2013 2015 2017 {

	    use "$output_pb/School_`y'.dta", clear
	    
	    gen year = `y'
	    
	    * Appending this year's data to the base file
	    append using `base_data'
	    
	    save `base_data', replace
	}

	* Loading the final, fully combined file from the tempfile
	use `base_data', clear

	* Compressing and saving the final file
	compress
	save "$output_pb/Schools.dta", replace


		
	
	
***
*3* Creating infrastructure index
***		
	* Loading the combined file
	use "$output_pb/Schools.dta", clear

	* Looping through each variable to create a numeric version
	foreach var of global infra_names {
		
		* Generating a new numeric variable (e.g., infra_predio_telhado_n)
		local new_var = "`var'_n"
		gen `new_var' = .
		
		* Recoding A/B/C/D to 4/3/2/1
		replace `new_var' = 4 if `var' == "A"
		replace `new_var' = 3 if `var' == "B"
		replace `new_var' = 2 if `var' == "C"
		replace `new_var' = 1 if `var' == "D"
	}

	* Creating a list of the new numeric variable names
	local numeric_infra_vars "infra_predio_telhado_n infra_predio_paredes_n infra_predio_piso_n infra_predio_portas_n infra_predio_janelas_n infra_predio_banheiros_n infra_predio_cozinha_n infra_predio_hidraulica_n infra_predio_eletrica_n"

	* Generating the index by averaging the numeric variables
	egen infra_index = rowmean(`numeric_infra_vars')

	* Counting the number of missing variables for each observation
	egen infra_missings = rowmiss(`numeric_infra_vars')

	* Setting the index to missing if more than 3 variables were missing
	replace infra_index = . if infra_missings > 3

	* Cleaning up the intermediate variables
	drop `numeric_infra_vars'
	drop infra_missings

	* Rescaling the index from 1-4 range to 0-1 range
	replace  infra_index = (infra_index - 1) / 3

	rename ID_ESCOLA codschool
	
	* Saving 
	save "$output_pb/Schools.dta", replace
	
	
	
	
	
