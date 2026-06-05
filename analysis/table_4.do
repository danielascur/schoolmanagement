

* Opening student-level dataset
use "analysis/data/PISA2012_analysis.dta", clear


eststo clear

// PANEL A: ALL COUNTRIES WITH PUBLIC/PRIVATE DUMMMY IN EQUATION

foreach sub in read math scie {
	forvalues x = 1/6{
		
		rename efa_f`x' efa_var
		
		eststo col`x'_`sub': repest PISA, estimate(stata: reg pv@`sub' efa_var i.c private ${c_main} ${c_full}, cluster(uschool_id)) results(add(r2 N N_clust))
		estadd scalar obs = _b[e_N]
		estadd scalar rsqr = _b[e_r2]
		estadd scalar cluster =  _b[e_N_clust]
		estadd local latent "`x'"
		estadd local countryfe Y
		estadd local schoolcontrols Y 
		estadd local studentcontrols Y
		
		rename efa_var efa_f`x'
	}  
}

// creating LaTeX Table	
	esttab col1_read col2_read col3_read col4_read col5_read col6_read ///
		using "analysis/results/table_4.tex", replace booktabs collabels(none)  f label ///
		keep(efa_var) coeflabels(efa_var "Factor Index") ///
		refcat(efa_var "\midrule \textbf{Panel A: Reading}", nolabel) ///
		cells(b(star fmt(3)) se(par fmt(3))) starlevels(* 0.1 ** 0.05 *** 0.01) ///
		noobs nolines stats(rsqr, fmt(3) label("\\ R-Squared"))
		
// creating LaTeX Table	
	esttab col1_math col2_math col3_math col4_math col5_math col6_math ///
		using "analysis/results/table_4.tex", booktabs append collabels(none) f label   ///
		keep(efa_var) coeflabels(efa_var "Factor Index") ///
		refcat(efa_var "\midrule \textbf{Panel B: Math}", nolabel) ///
		cells(b(star fmt(3)) se(par fmt(3))) starlevels(* 0.1 ** 0.05 *** 0.01) ///
		noobs nolines nonum stats(rsqr, fmt(3) label("\\ R-Squared"))
		
// creating LaTeX Table	
	esttab col1_scie col2_scie col3_scie col4_scie col5_scie col6_scie ///
		using "analysis/results/table_4.tex", booktabs append collabels(none) f label     ///
		keep(efa_var) coeflabels(efa_var "Factor Index") ///
		refcat(efa_var "\midrule \textbf{Panel C: Science}", nolabel) ///
		cells(b(star fmt(3)) se(par fmt(3))) starlevels(* 0.1 ** 0.05 *** 0.01) ///
		stats(rsqr obs cluster latent countryfe schoolcontrols studentcontrols, fmt(3 %12.0fc %12.0fc) ///
		label(" R-Squared" "\\ \# Students" "\# Schools" "\\ \textbf{Latent factor}" "\midrule \textbf{Controls} \\ Country FE" "School" "Student")) ///
		obslast nolines nonum
		
		
		/*
	
coefplot (col1_math col2_math col3_math col4_math col5_math col6_math , msymbol(D) mcolor(navy) ciopts(color(navy*.6))) ///
	(col1_read col2_read col3_read col4_read col5_read col6_read , msymbol(S) mcolor(maroon) ciopts(color(maroon*.6))) ///
	(col1_scie col2_scie col3_scie col4_scie col5_scie col6_scie, msymbol(T) mcolor(emerald) ciopts(color(emerald*.6)))  , keep(efa_*) ///
	xline(0, lcolor(black)) legend(order(2 "Math" 4 "Reading" 6 "Science") col(3) pos(6) )
	graph export "analysis/results/efa_corr_PISA.pdf", as(pdf)  
