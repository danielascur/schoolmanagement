	
***
*1* Creating infrastructure index
***		
* Loading the combined file
use "$input_pb/Schools.dta", clear

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

	
