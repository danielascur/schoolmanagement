

// Color scheme 
set scheme stcolor_alt

*------------------------------------------------------
* Correlation scores and MGMT index
*------------------------------------------------------

local indices wms a pca

foreach i of local indices {

	use "analysis/data/MgmtIndex_ProvaBrasil_SchlGradeYear", clear

	keep if year == 2013 & grade == 9

	// quartiles of PB management scores
	xtile qMM_schl = MM_`i'_practices_schl, nq(4)
	label define quart 1 "Bottom " 2 "2nd" 3 "3rd" 4 "Top ", modify
	label values qMM_schl quart 

	// de-meaning scores:
	egen mean_math = mean(score_saeb_math)
	egen mean_port = mean(score_saeb_port)
	generate math_dm = score_saeb_math - mean_math
	generate port_dm = score_saeb_port - mean_port

	// std 
	egen stdmath = std(score_saeb_math)
	egen stdport = std(score_saeb_port)


	// graph 
	graph bar stdmath stdport, over(qMM_schl) /// 
		ytitle("Prova Brasil score" "(grade 9, standardized)", size(medlarge)) ///
		b1title("Prova Brasil-based management score (quartiles)") ///
		yscale(range(-.5 .5)) ylabel(-.4(.2).4, labsize(medlarge) noticks grid glcolor(gs3) glpattern(dot) gmax noticks) ///
		graphregion(${gregion}) plotregion(${pregion}) ///
		legend(ring(0) pos(12) col(3) symx(4) region(lcolor(white)) ///
		label(1 Math) label(2 Portuguese)) ///
		blabel(bar, size(small) format(%12.2f) position(outside) color(navy)) 
		
		if "`i'" == "wms" {
			graph export "analysis/results/figure_a4a.pdf", as(pdf) replace  
		}
		else if "`i'" == "a" {
			graph export "analysis/results/figure_a4c.pdf", as(pdf) replace  
		}
		else if "`i'" == "pca" {
			graph export "analysis/results/figure_a4e.pdf", as(pdf) replace
		}		  
}	


*------------------------------------------------------
* PB scatterplot
*------------------------------------------------------

local indices wms a pca

foreach i of local indices {

	dis "Index `i'"

	use "analysis/data/MgmtIndex_ProvaBrasil_SchlGradeYear", clear

	keep if in_wms == 1
	keep if year == 2013 & grade == 9

	// standardizing management scores within this subsample
	egen MM_`i'_practices_std_schl = std(MM_`i'_practices_schl)
	egen wms_gmi_std = std(wms_gmi)

	// raw correlation for note in figure
	corr MM_`i'_practices_std_schl wms_gmi_std
	local rho: display %5.4f r(rho)
	local n: display %3.0f r(N)

	// graph
	binscatter MM_`i'_practices_std_schl wms_gmi_std, nquantiles(45) ///
		xtitle("Management Index, WMS") ytitle("Management Index, Prova Brasil (std)") ///
		ylabel(-1(.5)1) ///
		note("Correlation = `rho' (N = `n')") name("`i'", replace)

		if "`i'" == "wms" {
			graph export "analysis/results/figure_a4b.pdf", as(pdf) replace  
		}
		else if "`i'" == "a" {
			graph export "analysis/results/figure_a4d.pdf", as(pdf) replace
		}
		else if "`i'" == "pca" {
			graph export "analysis/results/figure_a4f.pdf", as(pdf) replace
		}	
}
