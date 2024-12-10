clear all


cd "C:\Users\leona\OneDrive\1_WP\Net_journals\econ_letters"



use "./data/data_v2.dta", clear
//
// forvalues i = 2001/2019{
//     gen year`i' = 0
// 	replace year`i' = 1 if year == `i'
// }

*gen jel1 = A+B+C+D+E+F+G+H+I+J+K+L+M+N+O+P+Q+R+Z
*gen no_jel = 0
*replace no_jel=1 if jel1==0

reghdfe log_dale_chall only_female both_genders log_num_authors log_num_pages jel_flag if (ecm jpe  qje  res   a_imp  b_imp  c_imp   e_imp  f_imp  g_imp  h_imp  i_imp  j_imp  k_imp  l_imp  m_imp  n_imp  o_imp   p_imp  q_imp  r_imp  y_imp  z_imp   year2001  year2002  year2003  year2004  year2005  year2006 year2007  year2008  year2009  year2010), absorb(ecm  jpe  qje  res) vce(cluster  cluster)


specurve using "./code/readability_graph_specurve.yml", outcmd

