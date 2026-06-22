***
* Merging every year together
***		

* Local for the names used below for the nine school infrastructure questions
local infra_names infra_predio_telhado infra_predio_paredes infra_predio_piso infra_predio_portas infra_predio_janelas infra_predio_banheiros infra_predio_cozinha infra_predio_hidraulica infra_predio_eletrica

* Creating empty temporary file used to append the yearly school files
tempfile schools
clear
set obs 0
generate double codschool = .
generate int year = .

foreach var of local infra_names {
	generate str1 `var' = ""
}

save `schools', replace


*------------------------------------------------------------------------------------------------------------------------*
* 2007
*------------------------------------------------------------------------------------------------------------------------*

use "$input_pb/School_2007.dta", clear

generate year = 2007
rename PK_COD_ENTIDADE codschool

local i = 1
foreach var of local infra_names {
	generate `var' = substr(TX_RESP_QUESTIONARIO, `i', 1)
	local ++i
}

keep codschool year `infra_names'
append using `schools'
save `schools', replace


*------------------------------------------------------------------------------------------------------------------------*
* 2009
*------------------------------------------------------------------------------------------------------------------------*

use "$input_pb/School_2009.dta", clear

generate year = 2009
rename pk_cod_entidade codschool

generate infra_predio_telhado    = substr(tx_resp_questionario, 1, 1)
generate infra_predio_paredes    = substr(tx_resp_questionario, 2, 1)
generate infra_predio_piso       = substr(tx_resp_questionario, 3, 1)
generate infra_predio_portas     = substr(tx_resp_questionario, 8, 1)
generate infra_predio_janelas    = substr(tx_resp_questionario, 9, 1)
generate infra_predio_banheiros  = substr(tx_resp_questionario, 10, 1)
generate infra_predio_cozinha    = substr(tx_resp_questionario, 11, 1)
generate infra_predio_hidraulica = substr(tx_resp_questionario, 12, 1)
generate infra_predio_eletrica   = substr(tx_resp_questionario, 13, 1)

keep codschool year `infra_names'
append using `schools'
save `schools', replace


*------------------------------------------------------------------------------------------------------------------------*
* 2011
*------------------------------------------------------------------------------------------------------------------------*

use "$input_pb/School_2011.dta", clear

generate year = 2011
rename id_escola codschool

rename (tx_resp_q001 tx_resp_q002 tx_resp_q003 tx_resp_q008 tx_resp_q009 tx_resp_q010 tx_resp_q011 tx_resp_q012 tx_resp_q013) ///
       (`infra_names')

keep codschool year `infra_names'
append using `schools'
save `schools', replace


*------------------------------------------------------------------------------------------------------------------------*
* 2013, 2015 and 2017
*------------------------------------------------------------------------------------------------------------------------*

foreach y in 2013 2015 2017 {
	use "$input_pb/School_`y'.dta", clear

	generate year = `y'
	rename id_escola codschool

	rename (tx_resp_q007 tx_resp_q008 tx_resp_q009 tx_resp_q010 tx_resp_q011 tx_resp_q012 tx_resp_q013 tx_resp_q014 tx_resp_q015) ///
	       (`infra_names')

	keep codschool year `infra_names'
	append using `schools'
	save `schools', replace
}



	
***
* Creating infrastructure index
***
		
* Loading the combined file
use `schools', clear

local infra_names infra_predio_telhado infra_predio_paredes infra_predio_piso infra_predio_portas infra_predio_janelas infra_predio_banheiros infra_predio_cozinha infra_predio_hidraulica infra_predio_eletrica

* Looping through each variable to create a numeric version
foreach var of local infra_names {
	
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


* Saving 
order codschool year infra_index
compress
save "$output_pb/Schools.dta", replace

	
