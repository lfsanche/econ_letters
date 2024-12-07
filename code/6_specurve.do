clear all


cd "C:\Users\lfsanche\OneDrive - Escuela Superior Politécnica del Litoral\Working_Papers\AER-NLP-Research\notebooks\readability\data"



use "data.dta", clear

forvalues i = 2001/2019{
    gen year`i' = 0
	replace year`i' = 1 if year == `i'
}

*gen jel1 = A+B+C+D+E+F+G+H+I+J+K+L+M+N+O+P+Q+R+Z
*gen no_jel = 0
*replace no_jel=1 if jel1==0

specurve using readability_graph_specurve.yml, transparent_background

