
// Color scheme 
set scheme stcolor_alt

* Open PISA dataset (student-level)
use "analysis/data/PISA2012_analysis.dta", clear

* Collapsing at the school level
collapse (mean) zmgmt_common_practices math reading science [w=stu_fac], by(uschool_id cnt)


* Plotting correlation of scores and management for Common indices
g qgmi=.

g _math_c = . 
g _science_c = . 
g _reading_c = .

* Looping through countries and building quartiles variables
levelsof cnt, local(lcty)
foreach c of local lcty {

	di "`c'" // checks on which cnt is currently running 
	cap drop gmi_`c'
	cap xtile qgmi_`c' = zmgmt_common_practices if cnt == "`c'", nq(4)
	cap replace qgmi=qgmi_`c' if cnt=="`c'" & qgmi == .
	cap drop qgmi_`c'
	
	di "Scores"
	foreach sub in math reading science {
		egen o_`sub'_`c' = mean(`sub') if cnt == "`c'"
		replace _`sub'_c = `sub' - o_`sub'_`c' if cnt == "`c'" & _`sub'_c==.
	} 
}
		
* Plotting
label define quart 1 "Bottom" 2 "2nd" 3 "3rd" 4 "Top", modify 				
label values qgmi quart

	graph bar _math _reading _science, over(qgmi)  /// 
		ytitle("PISA score""(deviations from country mean)", size(medlarge)) ///
		b1title("PISA-based management score (quartiles)")  ///
		yscale(range(-8 8)) ylabel(-8(2)8, labsize(medlarge) noticks grid glcolor(gs3) glpattern(dot) gmax noticks) ///
		graphregion(${region}) plotregion(${region}) ///
		legend(ring(0) pos(12) col(3) symx(4) region(lcolor(white)) ///
		label(1 Math) label(2 Reading) label(3 Science)) ///
		blabel(bar, size(small) format(%12.2f) position(outside) color(navy)) name(pisacommon_practices_all,replace)
	graph export "analysis/results/figure_a1a.pdf", as(pdf) replace



	
	
*************************************
* 2022


use "analysis/data/PISA2022_analysis.dta", clear

// classifying into quartiles (within which country)

g qgmi=.

g _math_c = . 
g _science_c = . 
g _reading_c = .

* Looping through countries and building quartiles variables
levelsof cnt, local(lcty)
foreach c of local lcty {
	di "`c'"
 // checks on which country is currently running 
	cap drop gmi_`c'
	cap xtile qgmi_`c' = zmgmt_common_practices if cnt == "`c'", nq(4)
	cap replace qgmi=qgmi_`c' if cnt=="`c'" & qgmi == .
	cap drop qgmi_`c'
	
	di "Scores"
	foreach sub in math reading science {
		egen o_`sub'_`c' = mean(`sub') if cnt == "`c'"
		replace _`sub'_c = `sub' - o_`sub'_`c' if cnt == "`c'" & _`sub'_c==.
	} 
}
		
* Plotting
label define quart 1 "Bottom" 2 "2nd" 3 "3rd" 4 "Top", modify 				
label values qgmi quart

* For common, increading the range of y axis from 5 to 6

graph bar _math _reading _science, over(qgmi)  /// 
	ytitle("PISA score""(deviations from country mean)", size(medlarge)) ///
	b1title("PISA-based management score (quartiles)")  ///
	yscale(range(-6 6)) ylabel(-4(2)4, labsize(medlarge) noticks grid glcolor(gs3) glpattern(dot) gmax noticks) ///
	graphregion(${region}) plotregion(${region}) ///
	legend(ring(0) pos(12) col(3) symx(4) region(lcolor(white)) ///
	label(1 Math) label(2 Reading) label(3 Science)) ///
	blabel(bar, size(small) format(%12.2f) position(outside) color(navy)) name(pisa`i'_all,replace)
	
	
graph export "analysis/results/figure_a1b.pdf", as(pdf) replace

	
	
