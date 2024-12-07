clear all

cd "C:\Users\lfsan\OneDrive - Escuela Superior Politécnica del Litoral\Working_Papers\AER-NLP-Research\notebooks\readability\data\"

use "data", clear

global save_tables "..\tables\"


set seed 123456

* Generata some variables
gen pages_females = log_num_pages*only_females
gen pages_males = log_num_pages*only_males
gen pages_prop = log_num_pages*prop_women
gen authors_females = log_num_authors*only_females
gen authors_males = log_num_authors*only_males
gen authors_prop = log_num_authors*prop_women
gen words_females = log_num_words*only_females
gen words_males = log_num_words*only_males
gen words_prop = log_num_words*prop_women

*Generate local variables
local journals  ecm jpe qje res

local jel_imp a_imp b_imp c_imp  e_imp f_imp g_imp h_imp i_imp j_imp k_imp /// 
		l_imp m_imp n_imp o_imp p_imp q_imp r_imp y_imp z_imp

local jel_obs a_obs b_obs c_obs  e_obs f_obs g_obs h_obs i_obs j_obs k_obs /// 
		l_obs m_obs n_obs o_obs p_obs q_obs r_obs y_obs z_obs

local sex only_females only_males prop_women

foreach y of local jel_imp {
	foreach s of local sex{
		
		gen `y'_`s'= `y'*`s'
	}    
}

foreach y of local jel_obs {
	foreach s of local sex{
		
		gen `y'_`s'= `y'*`s'
	}    
}

local jel_female1 a_imp_only_females b_imp_only_females c_imp_only_females  /// 
				e_imp_only_females f_imp_only_females g_imp_only_females h_imp_only_females /// 
				i_imp_only_females j_imp_only_females k_imp_only_females l_imp_only_females /// 
				m_imp_only_females n_imp_only_females o_imp_only_females p_imp_only_females ///
				q_imp_only_females r_imp_only_females y_imp_only_females z_imp_only_females

local jel_prop1 a_imp_prop_women b_imp_prop_women c_imp_prop_women  /// 
				e_imp_prop_women f_imp_prop_women g_imp_prop_women h_imp_prop_women /// 
				i_imp_prop_women j_imp_prop_women k_imp_prop_women l_imp_prop_women /// 
				m_imp_prop_women n_imp_prop_women o_imp_prop_women p_imp_prop_women /// 
				q_imp_prop_women r_imp_prop_women y_imp_prop_women z_imp_prop_women

local jel_male1 a_imp_only_males b_imp_only_males c_imp_only_males  /// 
				e_imp_only_males f_imp_only_males g_imp_only_males h_imp_only_males /// 
				i_imp_only_males j_imp_only_males k_imp_only_males l_imp_only_males /// 
				m_imp_only_males n_imp_only_males o_imp_only_males p_imp_only_males /// 
				q_imp_only_males r_imp_only_males y_imp_only_males z_imp_only_males 

local jel_female2 a_obs_only_females b_obs_only_females c_obs_only_females  ///
				e_obs_only_females f_obs_only_females g_obs_only_females h_obs_only_females /// 
				i_obs_only_females j_obs_only_females k_obs_only_females l_obs_only_females /// 
				m_obs_only_females n_obs_only_females o_obs_only_females p_obs_only_females /// 
				q_obs_only_females r_obs_only_females y_obs_only_females z_obs_only_females

local jel_prop2 a_obs_prop_women b_obs_prop_women c_obs_prop_women  /// 
				e_obs_prop_women f_obs_prop_women g_obs_prop_women h_obs_prop_women /// 
				i_obs_prop_women j_obs_prop_women k_obs_prop_women l_obs_prop_women /// 
				m_obs_prop_women n_obs_prop_women o_obs_prop_women p_obs_prop_women /// 
				q_obs_prop_women r_obs_prop_women y_obs_prop_women z_obs_prop_women

local jel_male2 a_obs_only_males b_obs_only_males c_obs_only_males  /// 
				e_obs_only_males f_obs_only_males g_obs_only_males h_obs_only_males /// 
				i_obs_only_males j_obs_only_males k_obs_only_males l_obs_only_males /// 
				m_obs_only_males n_obs_only_males o_obs_only_males p_obs_only_males ///
				q_obs_only_males r_obs_only_males y_obs_only_males z_obs_only_males



* Relabel variables - This is necessary to get table of summarize statistics

label variable log_flesch_kincaid_grade_level "log(F-K grade)"
label variable log_dale_chall "log(Dale-Chall)"
label variable only_females "\hspace{3mm}Female"
label variable only_males "\hspace{3mm}Male"
label variable both_genders "\hspace{3mm}Both genders" 
label variable num_authors "\hspace{3mm}Number of authors"
label variable log_num_authors "\hspace{3mm}log(Number authors)"
label variable num_words "\hspace{3mm}Number of words"
label variable log_num_words "\hspace{3mm}log(Number of words)"
label variable num_pages "\hspace{3mm}Number of pages"
label variable log_num_pages "\hspace{3mm}log(Number pages)"
label variable num_sentences "\hspace{3mm}Number of sentences"
label variable num_syllables "\hspace{3mm}Number of syllables"
label variable log_num_sentences "\hspace{3mm}log(Number of sentences)"
label variable log_num_syllables "\hspace{3mm}log(Number of syllables)"
label variable prop_women "\hspace{3mm}Share of women" 
label variable jel_flag "\hspace{3mm}Papers with  jel code"
label variable isolated "\hspace{3mm}Papers not connected"
label variable aer "\hspace{3mm}American Economic Review"
label variable ecm "\hspace{3mm}Econometrica"
label variable jpe "\hspace{3mm}Journal of Political Economy"
label variable qje "\hspace{3mm}The Quarterly Journal of Economics"
label variable res "\hspace{3mm}Review Economic Studies"

label variable pages_females "\hspace{3mm}log(Number of pages) $\times$ Female"
label variable pages_males "\hspace{3mm}log(Number of pages) $\times$ Male"
label variable pages_prop "\hspace{3mm}log(Number of pages) $\times$ Share of females"
label variable authors_females "\hspace{3mm}log(Number of authors) $\times$ Female"
label variable authors_males "\hspace{3mm}log(Number of authors) $\times$ Male"
label variable authors_prop "\hspace{3mm}log(Number of authors) $\time$ Share of females"
label variable words_females "\hspace{3mm}log(Number of words) $\times$ Female"
label variable words_males "\hspace{3mm}log(Number of words) $\times$ Male"
label variable words_prop "\hspace{3mm}log(Number of words) $\time$ Share of females"

//
rename log_flesch_kincaid_grade_level FKG
rename log_dale_chall DCH

gen sex=.
replace sex=1 if only_females==1
replace sex=0 if only_males==1

tabulate year, generate(y_)
tabulate cluster, generate(c_)

* JI= jel codes imputed, JO= jel codes observed

********************************************************************************
*************** SECOND SET OF REGRESSIONS **************************************

*** FKG FEMALE

** JI

dsregress FKG  log_num_authors  log_num_pages both_genders only_females pages_females authors_females  , ///
			controls(`journals' `jel_imp' y_2-y_20  c_2-c_215 jel_flag  `jel_female1') vce(cluster cluster)

							
	estadd scalar w1 = e(N) 
	estadd scalar w2 = e(k_controls) 
	estadd scalar w3 = e(k_controls_sel)
	estadd scalar w4 = e(chi2)
	est store m1
			
dsregress FKG log_num_authors  log_num_pages both_genders only_females pages_females authors_females  , ///
		controls(`journals' `jel_imp' y_2-y_20  c_2-c_215 jel_flag  `jel_female1') vce(cluster cluster) ///
			selection(cv) rseed(42)
			
	estadd scalar w1 = e(N) 
	estadd scalar w2 = e(k_controls) 
	estadd scalar w3 = e(k_controls_sel)
	estadd scalar w4 = e(chi2)
	est store m2			
			
			
dsregress FKG log_num_authors  log_num_pages both_genders only_females pages_females authors_females  , ///
		controls(`journals' `jel_imp' y_2-y_20  c_2-c_215 jel_flag  `jel_female1') vce(cluster cluster) ///
			selection(adaptive) rseed(42)
			
	estadd scalar w1 = e(N) 
	estadd scalar w2 = e(k_controls) 
	estadd scalar w3 = e(k_controls_sel)
	estadd scalar w4 = e(chi2)
	est store m3				
			
xporegress FKG  log_num_authors  log_num_pages both_genders only_females pages_females authors_females  , ///
			controls(`journals' `jel_imp' y_2-y_20  c_2-c_215  jel_flag  `jel_female1') vce(cluster cluster) rseed(42)

							
	estadd scalar w1 = e(N) 
	estadd scalar w2 = e(k_controls) 
	estadd scalar w3 = e(k_controls_sel)
	estadd scalar w4 = e(chi2)
	est store m4			
			
			
esttab m1 m2 m3 m4  using "$save_tables\FKG_females_JI.tex",  replace b(4) se(4) star(* 0.10 ** 0.05) r2   ///
		stats(N k_controls k_controls_sel chi2, label( "Observations" "Number potential controls" ///
		"Number controls selected" "$\chi^2(4)$" ) fmt( 0 0 0 %9.3f)) label nonumbers mtitle("DS Regress" "DS Regress (cv)" "DS Regress (adaptive)" "XPO Regress")
		
estimates clear			


** JO

dsregress FKG  log_num_authors  log_num_pages both_genders only_females pages_females authors_females  if jel_flag==1, ///
			controls(`journals' `jel_obs' y_2-y_20  c_2-c_215  jel_flag  `jel_female2') vce(cluster cluster)

							
	estadd scalar w1 = e(N) 
	estadd scalar w2 = e(k_controls) 
	estadd scalar w3 = e(k_controls_sel)
	estadd scalar w4 = e(chi2)
	est store m1
			
dsregress FKG log_num_authors  log_num_pages both_genders only_females pages_females authors_females  if jel_flag==1, ///
		controls(`journals' `jel_obs' y_2-y_20  c_2-c_215  jel_flag  `jel_female2') vce(cluster cluster) ///
			selection(cv) rseed(42)
			
	estadd scalar w1 = e(N) 
	estadd scalar w2 = e(k_controls) 
	estadd scalar w3 = e(k_controls_sel)
	estadd scalar w4 = e(chi2)
	est store m2			
			
			
dsregress FKG log_num_authors  log_num_pages both_genders only_females pages_females authors_females  if jel_flag==1, ///
		controls(`journals' `jel_obs' y_2-y_20  c_2-c_215  jel_flag  `jel_female2') vce(cluster cluster) ///
			selection(adaptive) rseed(42)
			
	estadd scalar w1 = e(N) 
	estadd scalar w2 = e(k_controls) 
	estadd scalar w3 = e(k_controls_sel)
	estadd scalar w4 = e(chi2)
	est store m3				
			
xporegress FKG  log_num_authors  log_num_pages both_genders only_females pages_females authors_females  if jel_flag==1, ///
			controls(`journals' `jel_obs' y_2-y_20  c_2-c_215  jel_flag  `jel_female2') vce(cluster cluster) rseed(42)

							
	estadd scalar w1 = e(N) 
	estadd scalar w2 = e(k_controls) 
	estadd scalar w3 = e(k_controls_sel)
	estadd scalar w4 = e(chi2)
	est store m4			
			
			
esttab m1 m2 m3 m4  using "$save_tables\FKG_females_JO.tex",  replace b(4) se(4) star(* 0.10 ** 0.05) r2   ///
		stats(N k_controls k_controls_sel chi2, label( "Observations" "Number potential controls" ///
		"Number controls selected" "$\chi^2(4)$") fmt( 0 0 0 %9.3f)) label nonumbers mtitle("DS Regress" "DS Regress (cv)" "DS Regress (adaptive)" "XPO Regress")
		
estimates clear		


*** DSREGRESS MALE

** JI

dsregress FKG  log_num_authors  log_num_pages both_genders only_males pages_males authors_males  , ///
			controls(`journals' `jel_imp' y_2-y_20  c_2-c_215  jel_flag  `jel_male1') vce(cluster cluster)
							
	estadd scalar w1 = e(N) 
	estadd scalar w2 = e(k_controls) 
	estadd scalar w3 = e(k_controls_sel)
	estadd scalar w4 = e(chi2)
	est store m1
			
dsregress FKG log_num_authors  log_num_pages both_genders only_males pages_males authors_males  , ///
		controls(`journals' `jel_imp' y_2-y_20  c_2-c_215  jel_flag  `jel_male1') vce(cluster cluster) ///
			selection(cv) rseed(42)
			
	estadd scalar w1 = e(N) 
	estadd scalar w2 = e(k_controls) 
	estadd scalar w3 = e(k_controls_sel)
	estadd scalar w4 = e(chi2)
	est store m2			
			
			
dsregress FKG log_num_authors  log_num_pages both_genders only_males pages_males authors_males  , ///
		controls(`journals' `jel_imp' y_2-y_20  c_2-c_215  jel_flag  `jel_male1') vce(cluster cluster) ///
			selection(adaptive) rseed(42)
			
	estadd scalar w1 = e(N) 
	estadd scalar w2 = e(k_controls) 
	estadd scalar w3 = e(k_controls_sel)
	estadd scalar w4 = e(chi2)
	est store m3				
			
xporegress FKG  log_num_authors  log_num_pages both_genders only_males pages_males authors_males  , ///
			controls(`journals' `jel_imp' y_2-y_20  c_2-c_215  jel_flag  `jel_male1') vce(cluster cluster) rseed(42)

							
	estadd scalar w1 = e(N) 
	estadd scalar w2 = e(k_controls) 
	estadd scalar w3 = e(k_controls_sel)
	estadd scalar w4 = e(chi2)
	est store m4			
			
			
esttab m1 m2 m3 m4  using "$save_tables\FKG_males_JI.tex",  replace b(4) se(4) star(* 0.10 ** 0.05) r2   ///
		stats(N k_controls k_controls_sel chi2, label( "Observations" "Number potential controls" ///
		"Number controls selected" "$\chi^2(4)$") fmt( 0 0 0 %9.3f)) label nonumbers mtitle("DS Regress" "DS Regress (cv)" "DS Regress (adaptive)" "XPO Regress")
		
estimates clear			


** JO

dsregress FKG  log_num_authors  log_num_pages both_genders only_males pages_males authors_males  if jel_flag==1, ///
			controls(`journals' `jel_obs' y_2-y_20  c_2-c_215  jel_flag  `jel_male2') vce(cluster cluster)

							
	estadd scalar w1 = e(N) 
	estadd scalar w2 = e(k_controls) 
	estadd scalar w3 = e(k_controls_sel)
	estadd scalar w4 = e(chi2)
	est store m1
			
dsregress FKG log_num_authors  log_num_pages both_genders only_males pages_males authors_males  if jel_flag==1, ///
		controls(`journals' `jel_obs' y_2-y_20  c_2-c_215  jel_flag  `jel_male2') vce(cluster cluster) ///
			selection(cv) rseed(42)
			
	estadd scalar w1 = e(N) 
	estadd scalar w2 = e(k_controls) 
	estadd scalar w3 = e(k_controls_sel)
	estadd scalar w4 = e(chi2)
	est store m2			
			
			
dsregress FKG log_num_authors  log_num_pages both_genders only_males pages_males authors_males  if jel_flag==1, ///
		controls(`journals' `jel_obs' y_2-y_20  c_2-c_215  jel_flag  `jel_male2') vce(cluster cluster) ///
			selection(adaptive) rseed(42)
			
	estadd scalar w1 = e(N) 
	estadd scalar w2 = e(k_controls) 
	estadd scalar w3 = e(k_controls_sel)
	estadd scalar w4 = e(chi2)
	est store m3				
			
xporegress FKG  log_num_authors  log_num_pages both_genders only_males pages_males authors_males  if jel_flag==1, ///
			controls(`journals' `jel_obs' y_2-y_20  c_2-c_215  jel_flag  `jel_male2') vce(cluster cluster) rseed(42)

							
	estadd scalar w1 = e(N) 
	estadd scalar w2 = e(k_controls) 
	estadd scalar w3 = e(k_controls_sel)
	estadd scalar w4 = e(chi2)
	est store m4			
			
			
esttab m1 m2 m3 m4  using "$save_tables\FKG_males_JO.tex",  replace b(4) se(4) star(* 0.10 ** 0.05) r2   ///
		stats(N k_controls k_controls_sel chi2, label( "Observations" "Number potential controls" ///
		"Number controls selected" "$\chi^2(4)$") fmt( 0 0 0 %9.3f)) label nonumbers mtitle("DS Regress" "DS Regress (cv)" "DS Regress (adaptive)" "XPO Regress")
		
estimates clear		



*** FKG - PROPORTION WOMEN

** JI

dsregress FKG  log_num_authors  log_num_pages both_genders prop_women pages_prop authors_prop  , ///
			controls(`journals' `jel_imp' y_2-y_20  c_2-c_215  jel_flag  `jel_prop1') vce(cluster cluster)
							
	estadd scalar w1 = e(N) 
	estadd scalar w2 = e(k_controls) 
	estadd scalar w3 = e(k_controls_sel)
	estadd scalar w4 = e(chi2)
	est store m1
			
dsregress FKG log_num_authors  log_num_pages both_genders prop_women pages_prop authors_prop  , ///
		controls(`journals' `jel_imp' y_2-y_20  c_2-c_215  jel_flag  `jel_prop1') vce(cluster cluster) ///
			selection(cv) rseed(42)
			
	estadd scalar w1 = e(N) 
	estadd scalar w2 = e(k_controls) 
	estadd scalar w3 = e(k_controls_sel)
	estadd scalar w4 = e(chi2)
	est store m2			
			
			
dsregress FKG log_num_authors  log_num_pages both_genders prop_women pages_prop authors_prop  , ///
		controls(`journals' `jel_imp' y_2-y_20  c_2-c_215  jel_flag  `jel_prop1') vce(cluster cluster) ///
			selection(adaptive) rseed(42)
			
	estadd scalar w1 = e(N) 
	estadd scalar w2 = e(k_controls) 
	estadd scalar w3 = e(k_controls_sel)
	estadd scalar w4 = e(chi2)
	est store m3				
			
xporegress FKG  log_num_authors  log_num_pages both_genders prop_women pages_prop authors_prop  , ///
			controls(`journals' `jel_imp' y_2-y_20  c_2-c_215  jel_flag  `jel_prop1') vce(cluster cluster) rseed(42)

							
	estadd scalar w1 = e(N) 
	estadd scalar w2 = e(k_controls) 
	estadd scalar w3 = e(k_controls_sel)
	estadd scalar w4 = e(chi2)
	est store m4			
			
			
esttab m1 m2 m3 m4  using "$save_tables\FKG_prop_JI.tex",  replace b(4) se(4) star(* 0.10 ** 0.05) r2   ///
		stats(N k_controls k_controls_sel chi2, label( "Observations" "Number potential controls" ///
		"Number controls selected" "$\chi^2(4)$") fmt( 0 0 0 %9.3f)) label nonumbers mtitle("DS Regress" "DS Regress (cv)" "DS Regress (adaptive)" "XPO Regress")
		
estimates clear			


** JO

dsregress FKG  log_num_authors  log_num_pages both_genders prop_women pages_prop authors_prop  if jel_flag==1, ///
			controls(`journals' `jel_obs' y_2-y_20  c_2-c_215  jel_flag  `jel_prop2') vce(cluster cluster)

							
	estadd scalar w1 = e(N) 
	estadd scalar w2 = e(k_controls) 
	estadd scalar w3 = e(k_controls_sel)
	estadd scalar w4 = e(chi2)
	est store m1
			
dsregress FKG log_num_authors  log_num_pages both_genders prop_women pages_prop authors_prop  if jel_flag==1, ///
		controls(`journals' `jel_obs' y_2-y_20  c_2-c_215  jel_flag  `jel_prop2') vce(cluster cluster) ///
			selection(cv) rseed(42)
			
	estadd scalar w1 = e(N) 
	estadd scalar w2 = e(k_controls) 
	estadd scalar w3 = e(k_controls_sel)
	estadd scalar w4 = e(chi2)
	est store m2			
			
			
dsregress FKG log_num_authors  log_num_pages both_genders prop_women pages_prop authors_prop  if jel_flag==1, ///
		controls(`journals' `jel_obs' y_2-y_20  c_2-c_215  jel_flag  `jel_prop2') vce(cluster cluster) ///
			selection(adaptive) rseed(42)
			
	estadd scalar w1 = e(N) 
	estadd scalar w2 = e(k_controls) 
	estadd scalar w3 = e(k_controls_sel)
	estadd scalar w4 = e(chi2)
	est store m3				
			
xporegress FKG  log_num_authors  log_num_pages both_genders prop_women pages_prop authors_prop  if jel_flag==1, ///
			controls(`journals' `jel_obs' y_2-y_20  c_2-c_215  jel_flag  `jel_prop2') vce(cluster cluster) rseed(42)

							
	estadd scalar w1 = e(N) 
	estadd scalar w2 = e(k_controls) 
	estadd scalar w3 = e(k_controls_sel)
	estadd scalar w4 = e(chi2)
	est store m4			
			
			
esttab m1 m2 m3 m4  using "$save_tables\FKG_prop_JO.tex",  replace b(4) se(4) star(* 0.10 ** 0.05) r2   ///
		stats(N k_controls k_controls_sel chi2, label( "Observations" "Number potential controls" ///
		"Number controls selected" "$\chi^2(4)$") fmt( 0 0 0 %9.3f)) label nonumbers mtitle("DS Regress" "DS Regress (cv)" "DS Regress (adaptive)" "XPO Regress")
		
estimates clear		




*** DCH FEMALE

** JI

dsregress DCH  log_num_authors  log_num_pages both_genders only_females pages_females authors_females  , ///
			controls(`journals' `jel_imp' y_2-y_20  c_2-c_215 jel_flag  `jel_female1') vce(cluster cluster)

							
	estadd scalar w1 = e(N) 
	estadd scalar w2 = e(k_controls) 
	estadd scalar w3 = e(k_controls_sel)
	estadd scalar w4 = e(chi2)
	est store m1
			
dsregress DCH log_num_authors  log_num_pages both_genders only_females pages_females authors_females  , ///
		controls(`journals' `jel_imp' y_2-y_20  c_2-c_215  jel_flag  `jel_female1') vce(cluster cluster) ///
			selection(cv) rseed(42)
			
	estadd scalar w1 = e(N) 
	estadd scalar w2 = e(k_controls) 
	estadd scalar w3 = e(k_controls_sel)
	estadd scalar w4 = e(chi2)
	est store m2			
			
			
dsregress DCH log_num_authors  log_num_pages both_genders only_females pages_females authors_females  , ///
		controls(`journals' `jel_imp' y_2-y_20  c_2-c_215  jel_flag  `jel_female1') vce(cluster cluster) ///
			selection(adaptive) rseed(42)
			
	estadd scalar w1 = e(N) 
	estadd scalar w2 = e(k_controls) 
	estadd scalar w3 = e(k_controls_sel)
	estadd scalar w4 = e(chi2)
	est store m3				
			
xporegress DCH  log_num_authors  log_num_pages both_genders only_females pages_females authors_females  , ///
			controls(`journals' `jel_imp' y_2-y_20  c_2-c_215  jel_flag  `jel_female1') vce(cluster cluster) rseed(42)

							
	estadd scalar w1 = e(N) 
	estadd scalar w2 = e(k_controls) 
	estadd scalar w3 = e(k_controls_sel)
	estadd scalar w4 = e(chi2)
	est store m4			
			
			
esttab m1 m2 m3 m4  using "$save_tables\DCH_females_JI.tex",  replace b(4) se(4) star(* 0.10 ** 0.05) r2   ///
		stats(N k_controls k_controls_sel chi2, label( "Observations" "Number potential controls" ///
		"Number controls selected" "$\chi^2(4)$") fmt( 0 0 0 %9.3f)) label nonumbers mtitle("DS Regress" "DS Regress (cv)" "DS Regress (adaptive)" "XPO Regress")
		
estimates clear			


** JO

dsregress DCH  log_num_authors  log_num_pages both_genders only_females pages_females authors_females  if jel_flag==1, ///
			controls(`journals' `jel_obs' y_2-y_20  c_2-c_215  jel_flag  `jel_female2') vce(cluster cluster)

							
	estadd scalar w1 = e(N) 
	estadd scalar w2 = e(k_controls) 
	estadd scalar w3 = e(k_controls_sel)
	estadd scalar w4 = e(chi2)
	est store m1
			
dsregress DCH log_num_authors  log_num_pages both_genders only_females pages_females authors_females  if jel_flag==1, ///
		controls(`journals' `jel_obs' y_2-y_20  c_2-c_215  jel_flag  `jel_female2') vce(cluster cluster) ///
			selection(cv) rseed(42)
			
	estadd scalar w1 = e(N) 
	estadd scalar w2 = e(k_controls) 
	estadd scalar w3 = e(k_controls_sel)
	estadd scalar w4 = e(chi2)
	est store m2			
			
			
dsregress DCH log_num_authors  log_num_pages both_genders only_females pages_females authors_females  if jel_flag==1, ///
		controls(`journals' `jel_obs' y_2-y_20  c_2-c_215  jel_flag  `jel_female2') vce(cluster cluster) ///
			selection(adaptive) rseed(42)
			
	estadd scalar w1 = e(N) 
	estadd scalar w2 = e(k_controls) 
	estadd scalar w3 = e(k_controls_sel)
	estadd scalar w4 = e(chi2)
	est store m3				
			
xporegress DCH  log_num_authors  log_num_pages both_genders only_females pages_females authors_females  if jel_flag==1, ///
			controls(`journals' `jel_obs' y_2-y_20  c_2-c_215  jel_flag  `jel_female2') vce(cluster cluster) rseed(42)

							
	estadd scalar w1 = e(N) 
	estadd scalar w2 = e(k_controls) 
	estadd scalar w3 = e(k_controls_sel)
	estadd scalar w4 = e(chi2)
	est store m4			
			
			
esttab m1 m2 m3 m4  using "$save_tables\DCH_females_JO.tex",  replace b(4) se(4) star(* 0.10 ** 0.05) r2   ///
		stats(N k_controls k_controls_sel chi2, label( "Observations" "Number potential controls" ///
		"Number controls selected" "$\chi^2(4)$") fmt( 0 0 0 %9.3f)) label nonumbers mtitle("DS Regress" "DS Regress (cv)" "DS Regress (adaptive)" "XPO Regress")
		
estimates clear		


*** DSREGRESS MALE

** JI

dsregress DCH  log_num_authors  log_num_pages both_genders only_males pages_males authors_males  , ///
			controls(`journals' `jel_imp' y_2-y_20  c_2-c_215  jel_flag  `jel_male1') vce(cluster cluster)
							
	estadd scalar w1 = e(N) 
	estadd scalar w2 = e(k_controls) 
	estadd scalar w3 = e(k_controls_sel)
	estadd scalar w4 = e(chi2)
	est store m1
			
dsregress DCH log_num_authors  log_num_pages both_genders only_males pages_males authors_males  , ///
		controls(`journals' `jel_imp' y_2-y_20  c_2-c_215  jel_flag  `jel_male1') vce(cluster cluster) ///
			selection(cv) rseed(42)
			
	estadd scalar w1 = e(N) 
	estadd scalar w2 = e(k_controls) 
	estadd scalar w3 = e(k_controls_sel)
	estadd scalar w4 = e(chi2)
	est store m2			
			
			
dsregress DCH log_num_authors  log_num_pages both_genders only_males pages_males authors_males  , ///
		controls(`journals' `jel_imp' y_2-y_20  c_2-c_215  jel_flag  `jel_male1') vce(cluster cluster) ///
			selection(adaptive) rseed(42)
			
	estadd scalar w1 = e(N) 
	estadd scalar w2 = e(k_controls) 
	estadd scalar w3 = e(k_controls_sel)
	estadd scalar w4 = e(chi2)
	est store m3				
			
xporegress DCH  log_num_authors  log_num_pages both_genders only_males pages_males authors_males  , ///
			controls(`journals' `jel_imp' y_2-y_20  c_2-c_215  jel_flag  `jel_male1') vce(cluster cluster) rseed(42)

							
	estadd scalar w1 = e(N) 
	estadd scalar w2 = e(k_controls) 
	estadd scalar w3 = e(k_controls_sel)
	estadd scalar w4 = e(chi2)
	est store m4			
			
			
esttab m1 m2 m3 m4  using "$save_tables\DCH_males_JI.tex",  replace b(4) se(4) star(* 0.10 ** 0.05) r2   ///
		stats(N k_controls k_controls_sel chi2, label( "Observations" "Number potential controls" ///
		"Number controls selected" "$\chi^2(4)$") fmt( 0 0 0 %9.3f)) label nonumbers mtitle("DS Regress" "DS Regress (cv)" "DS Regress (adaptive)" "XPO Regress")
		
estimates clear			


** JO

dsregress DCH  log_num_authors  log_num_pages both_genders only_males pages_males authors_males  if jel_flag==1, ///
			controls(`journals' `jel_obs' y_2-y_20  c_2-c_215  jel_flag  `jel_male2') vce(cluster cluster)

							
	estadd scalar w1 = e(N) 
	estadd scalar w2 = e(k_controls) 
	estadd scalar w3 = e(k_controls_sel)
	estadd scalar w4 = e(chi2)
	est store m1
			
dsregress DCH log_num_authors  log_num_pages both_genders only_males pages_males authors_males  if jel_flag==1, ///
		controls(`journals' `jel_obs' y_2-y_20  c_2-c_215  jel_flag  `jel_male2') vce(cluster cluster) ///
			selection(cv) rseed(42)
			
	estadd scalar w1 = e(N) 
	estadd scalar w2 = e(k_controls) 
	estadd scalar w3 = e(k_controls_sel)
	estadd scalar w4 = e(chi2)
	est store m2			
			
			
dsregress DCH log_num_authors  log_num_pages both_genders only_males pages_males authors_males  if jel_flag==1, ///
		controls(`journals' `jel_obs' y_2-y_20  c_2-c_215  jel_flag  `jel_male2') vce(cluster cluster) ///
			selection(adaptive) rseed(42)
			
	estadd scalar w1 = e(N) 
	estadd scalar w2 = e(k_controls) 
	estadd scalar w3 = e(k_controls_sel)
	estadd scalar w4 = e(chi2)
	est store m3				
			
xporegress DCH  log_num_authors  log_num_pages both_genders only_males pages_males authors_males  if jel_flag==1, ///
			controls(`journals' `jel_obs' y_2-y_20  c_2-c_215  jel_flag  `jel_male2') vce(cluster cluster) rseed(42)

							
	estadd scalar w1 = e(N) 
	estadd scalar w2 = e(k_controls) 
	estadd scalar w3 = e(k_controls_sel)
	estadd scalar w4 = e(chi2)
	est store m4			
			
			
esttab m1 m2 m3 m4  using "$save_tables\DCH_males_JO.tex",  replace b(4) se(4) star(* 0.10 ** 0.05) r2   ///
		stats(N k_controls k_controls_sel chi2, label( "Observations" "Number potential controls" ///
		"Number controls selected" "$\chi^2(4)$") fmt( 0 0 0 %9.3f)) label nonumbers mtitle("DS Regress" "DS Regress (cv)" "DS Regress (adaptive)" "XPO Regress")
		
estimates clear		



*** FKG - PROPORTION WOMEN

** JI

dsregress DCH  log_num_authors  log_num_pages both_genders prop_women pages_prop authors_prop  , ///
			controls(`journals' `jel_imp' y_2-y_20  c_2-c_215  jel_flag  `jel_prop1') vce(cluster cluster)
							
	estadd scalar w1 = e(N) 
	estadd scalar w2 = e(k_controls) 
	estadd scalar w3 = e(k_controls_sel)
	estadd scalar w4 = e(chi2)
	est store m1
			
dsregress DCH log_num_authors  log_num_pages both_genders prop_women pages_prop authors_prop  , ///
		controls(`journals' `jel_imp' y_2-y_20  c_2-c_215  jel_flag  `jel_prop1') vce(cluster cluster) ///
			selection(cv) rseed(42)
			
	estadd scalar w1 = e(N) 
	estadd scalar w2 = e(k_controls) 
	estadd scalar w3 = e(k_controls_sel)
	estadd scalar w4 = e(chi2)
	est store m2			
			
			
dsregress DCH log_num_authors  log_num_pages both_genders prop_women pages_prop authors_prop  , ///
		controls(`journals' `jel_imp' y_2-y_20  c_2-c_215  jel_flag  `jel_prop1') vce(cluster cluster) ///
			selection(adaptive) rseed(42)
			
	estadd scalar w1 = e(N) 
	estadd scalar w2 = e(k_controls) 
	estadd scalar w3 = e(k_controls_sel)
	estadd scalar w4 = e(chi2)
	est store m3				
			
xporegress DCH  log_num_authors  log_num_pages both_genders prop_women pages_prop authors_prop  , ///
			controls(`journals' `jel_imp' y_2-y_20  c_2-c_215  jel_flag  `jel_prop1') vce(cluster cluster) rseed(42)

							
	estadd scalar w1 = e(N) 
	estadd scalar w2 = e(k_controls) 
	estadd scalar w3 = e(k_controls_sel)
	estadd scalar w4 = e(chi2)
	est store m4			
			
			
esttab m1 m2 m3 m4  using "$save_tables\DCH_prop_JI.tex",  replace b(4) se(4) star(* 0.10 ** 0.05) r2   ///
		stats(N k_controls k_controls_sel chi2, label( "Observations" "Number potential controls" ///
		"Number controls selected" "$\chi^2(4)$") fmt( 0 0 0 %9.3f)) label nonumbers mtitle("DS Regress" "DS Regress (cv)" "DS Regress (adaptive)" "XPO Regress")
		
estimates clear			


** JO

dsregress DCH  log_num_authors  log_num_pages both_genders prop_women pages_prop authors_prop  if jel_flag==1, ///
			controls(`journals' `jel_obs' y_2-y_20  c_2-c_215  jel_flag  `jel_prop2') vce(cluster cluster)

							
	estadd scalar w1 = e(N) 
	estadd scalar w2 = e(k_controls) 
	estadd scalar w3 = e(k_controls_sel)
	estadd scalar w4 = e(chi2)
	est store m1
			
dsregress DCH log_num_authors  log_num_pages both_genders prop_women pages_prop authors_prop  if jel_flag==1, ///
		controls(`journals' `jel_obs' y_2-y_20  c_2-c_215  jel_flag  `jel_prop2') vce(cluster cluster) ///
			selection(cv) rseed(42)
			
	estadd scalar w1 = e(N) 
	estadd scalar w2 = e(k_controls) 
	estadd scalar w3 = e(k_controls_sel)
	estadd scalar w4 = e(chi2)
	est store m2			
			
			
dsregress DCH log_num_authors  log_num_pages both_genders prop_women pages_prop authors_prop  if jel_flag==1, ///
		controls(`journals' `jel_obs' y_2-y_20  c_2-c_215  jel_flag  `jel_prop2') vce(cluster cluster) ///
			selection(adaptive) rseed(42)
			
	estadd scalar w1 = e(N) 
	estadd scalar w2 = e(k_controls) 
	estadd scalar w3 = e(k_controls_sel)
	estadd scalar w4 = e(chi2)
	est store m3				
			
xporegress DCH  log_num_authors  log_num_pages both_genders prop_women pages_prop authors_prop  if jel_flag==1, ///
			controls(`journals' `jel_obs' y_2-y_20  c_2-c_215  jel_flag  `jel_prop2') vce(cluster cluster) rseed(42)

							
	estadd scalar w1 = e(N) 
	estadd scalar w2 = e(k_controls) 
	estadd scalar w3 = e(k_controls_sel)
	estadd scalar w4 = e(chi2)
	est store m4			
			
			
esttab m1 m2 m3 m4  using "$save_tables\DCH_prop_JO.tex",  replace b(4) se(4) star(* 0.10 ** 0.05) r2   ///
		stats(N k_controls k_controls_sel chi2, label( "Observations" "Number potential controls" ///
		"Number controls selected" "$\chi^2(4)$") fmt( 0 0 0 %9.3f)) label  nonumbers mtitle("DS Regress" "DS Regress (cv)" "DS Regress (adaptive)" "XPO Regress")
		
estimates clear		



*********************************************************************************
*********************************************************************************
***not interactions

*** FKG FEMALE

** JI

dsregress FKG  log_num_authors  log_num_pages both_genders only_females   , ///
			controls(`journals' `jel_imp' y_2-y_20  c_2-c_215  jel_flag  `jel_female1') vce(cluster cluster)

							
	estadd scalar w1 = e(N) 
	estadd scalar w2 = e(k_controls) 
	estadd scalar w3 = e(k_controls_sel)
	estadd scalar w4 = e(chi2)
	est store m1
			
dsregress FKG log_num_authors  log_num_pages both_genders only_females   , ///
		controls(`journals' `jel_imp' y_2-y_20  c_2-c_215  jel_flag  `jel_female1') vce(cluster cluster) ///
			selection(cv) rseed(42)
			
	estadd scalar w1 = e(N) 
	estadd scalar w2 = e(k_controls) 
	estadd scalar w3 = e(k_controls_sel)
	estadd scalar w4 = e(chi2)
	est store m2			
			
			
dsregress FKG log_num_authors  log_num_pages both_genders only_females   , ///
		controls(`journals' `jel_imp' y_2-y_20  c_2-c_215  jel_flag  `jel_female1') vce(cluster cluster) ///
			selection(adaptive) rseed(42)
			
	estadd scalar w1 = e(N) 
	estadd scalar w2 = e(k_controls) 
	estadd scalar w3 = e(k_controls_sel)
	estadd scalar w4 = e(chi2)
	est store m3				
			
xporegress FKG  log_num_authors  log_num_pages both_genders only_females   , ///
			controls(`journals' `jel_imp' y_2-y_20  c_2-c_215  jel_flag  `jel_female1') vce(cluster cluster) rseed(42)

							
	estadd scalar w1 = e(N) 
	estadd scalar w2 = e(k_controls) 
	estadd scalar w3 = e(k_controls_sel)
	estadd scalar w4 = e(chi2)
	est store m4			
			
			
esttab m1 m2 m3 m4  using "$save_tables\FKG_females_JI_2.tex",  replace b(4) se(4) star(* 0.10 ** 0.05) r2   ///
		stats(N k_controls k_controls_sel chi2, label( "Observations" "Number potential controls" ///
		"Number controls selected" "$\chi^2(4)$") fmt( 0 0 0 %9.3f)) label nonumbers mtitle("DS Regress" "DS Regress (cv)" "DS Regress (adaptive)" "XPO Regress")
		
estimates clear			


** JO

dsregress FKG  log_num_authors  log_num_pages both_genders only_females   if jel_flag==1, ///
			controls(`journals' `jel_obs' y_2-y_20  c_2-c_215  jel_flag  `jel_female2') vce(cluster cluster)

							
	estadd scalar w1 = e(N) 
	estadd scalar w2 = e(k_controls) 
	estadd scalar w3 = e(k_controls_sel)
	estadd scalar w4 = e(chi2)
	est store m1
			
dsregress FKG log_num_authors  log_num_pages both_genders only_females   if jel_flag==1, ///
		controls(`journals' `jel_obs' y_2-y_20  c_2-c_215  jel_flag  `jel_female2') vce(cluster cluster) ///
			selection(cv) rseed(42)
			
	estadd scalar w1 = e(N) 
	estadd scalar w2 = e(k_controls) 
	estadd scalar w3 = e(k_controls_sel)
	estadd scalar w4 = e(chi2)
	est store m2			
			
			
dsregress FKG log_num_authors  log_num_pages both_genders only_females  if jel_flag==1, ///
		controls(`journals' `jel_obs' y_2-y_20  c_2-c_215  jel_flag  `jel_female2') vce(cluster cluster) ///
			selection(adaptive) rseed(42)
			
	estadd scalar w1 = e(N) 
	estadd scalar w2 = e(k_controls) 
	estadd scalar w3 = e(k_controls_sel)
	estadd scalar w4 = e(chi2)
	est store m3				
			
xporegress FKG  log_num_authors  log_num_pages both_genders only_females   if jel_flag==1, ///
			controls(`journals' `jel_obs' y_2-y_20  c_2-c_215  jel_flag  `jel_female2') vce(cluster cluster) rseed(42)

							
	estadd scalar w1 = e(N) 
	estadd scalar w2 = e(k_controls) 
	estadd scalar w3 = e(k_controls_sel)
	estadd scalar w4 = e(chi2)
	est store m4			
			
			
esttab m1 m2 m3 m4  using "$save_tables\FKG_females_JO_2.tex",  replace b(4) se(4) star(* 0.10 ** 0.05) r2   ///
		stats(N k_controls k_controls_sel chi2, label( "Observations" "Number potential controls" ///
		"Number controls selected" "$\chi^2(4)$") fmt( 0 0 0 %9.3f)) label nonumbers mtitle("DS Regress" "DS Regress (cv)" "DS Regress (adaptive)" "XPO Regress")
		
estimates clear		


*** DSREGRESS MALE

** JI

dsregress FKG  log_num_authors  log_num_pages both_genders only_males   , ///
			controls(`journals' `jel_imp' y_2-y_20  c_2-c_215  jel_flag `jel_male1') vce(cluster cluster)
							
	estadd scalar w1 = e(N) 
	estadd scalar w2 = e(k_controls) 
	estadd scalar w3 = e(k_controls_sel)
	estadd scalar w4 = e(chi2)
	est store m1
			
dsregress FKG log_num_authors  log_num_pages both_genders only_males  , ///
		controls(`journals' `jel_imp' y_2-y_20  c_2-c_215  jel_flag  `jel_male1') vce(cluster cluster) ///
			selection(cv) rseed(42)
			
	estadd scalar w1 = e(N) 
	estadd scalar w2 = e(k_controls) 
	estadd scalar w3 = e(k_controls_sel)
	estadd scalar w4 = e(chi2)
	est store m2			
			
			
dsregress FKG log_num_authors  log_num_pages both_genders only_males   , ///
		controls(`journals' `jel_imp' y_2-y_20  c_2-c_215  jel_flag  `jel_male1') vce(cluster cluster) ///
			selection(adaptive) rseed(42)
			
	estadd scalar w1 = e(N) 
	estadd scalar w2 = e(k_controls) 
	estadd scalar w3 = e(k_controls_sel)
	estadd scalar w4 = e(chi2)
	est store m3				
			
xporegress FKG  log_num_authors  log_num_pages both_genders only_males  , ///
			controls(`journals' `jel_imp' y_2-y_20  c_2-c_215  jel_flag  `jel_male1') vce(cluster cluster) rseed(42)

							
	estadd scalar w1 = e(N) 
	estadd scalar w2 = e(k_controls) 
	estadd scalar w3 = e(k_controls_sel)
	estadd scalar w4 = e(chi2)
	est store m4			
			
			
esttab m1 m2 m3 m4  using "$save_tables\FKG_males_JI_2.tex",  replace b(4) se(4) star(* 0.10 ** 0.05) r2   ///
		stats(N k_controls k_controls_sel chi2, label( "Observations" "Number potential controls" ///
		"Number controls selected" "$\chi^2(4)$") fmt( 0 0 0 %9.3f)) label nonumbers mtitle("DS Regress" "DS Regress (cv)" "DS Regress (adaptive)" "XPO Regress")
		
estimates clear			


** JO

dsregress FKG  log_num_authors  log_num_pages both_genders only_males   if jel_flag==1, ///
			controls(`journals' `jel_obs' y_2-y_20  c_2-c_215  jel_flag  `jel_male2') vce(cluster cluster)

							
	estadd scalar w1 = e(N) 
	estadd scalar w2 = e(k_controls) 
	estadd scalar w3 = e(k_controls_sel)
	estadd scalar w4 = e(chi2)
	est store m1
			
dsregress FKG log_num_authors  log_num_pages both_genders only_males   if jel_flag==1, ///
		controls(`journals' `jel_obs' y_2-y_20  c_2-c_215  jel_flag  `jel_male2') vce(cluster cluster) ///
			selection(cv) rseed(42)
			
	estadd scalar w1 = e(N) 
	estadd scalar w2 = e(k_controls) 
	estadd scalar w3 = e(k_controls_sel)
	estadd scalar w4 = e(chi2)
	est store m2			
			
			
dsregress FKG log_num_authors  log_num_pages both_genders only_males  if jel_flag==1, ///
		controls(`journals' `jel_obs' y_2-y_20  c_2-c_215  jel_flag  `jel_male2') vce(cluster cluster) ///
			selection(adaptive) rseed(42)
			
	estadd scalar w1 = e(N) 
	estadd scalar w2 = e(k_controls) 
	estadd scalar w3 = e(k_controls_sel)
	estadd scalar w4 = e(chi2)
	est store m3				
			
xporegress FKG  log_num_authors  log_num_pages both_genders only_males   if jel_flag==1, ///
			controls(`journals' `jel_obs' y_2-y_20  c_2-c_215  jel_flag  `jel_male2') vce(cluster cluster) rseed(42)

							
	estadd scalar w1 = e(N) 
	estadd scalar w2 = e(k_controls) 
	estadd scalar w3 = e(k_controls_sel)
	estadd scalar w4 = e(chi2)
	est store m4			
			
			
esttab m1 m2 m3 m4  using "$save_tables\FKG_males_JO_2.tex",  replace b(4) se(4) star(* 0.10 ** 0.05) r2   ///
		stats(N k_controls k_controls_sel chi2, label( "Observations" "Number potential controls" ///
		"Number controls selected" "$\chi^2(4)$") fmt( 0 0 0 %9.3f)) label nonumbers mtitle("DS Regress" "DS Regress (cv)" "DS Regress (adaptive)" "XPO Regress")
		
estimates clear		



*** FKG - PROPORTION WOMEN

** JI

dsregress FKG  log_num_authors  log_num_pages both_genders prop_women   , ///
			controls(`journals' `jel_imp' y_2-y_20  c_2-c_215  jel_flag  `jel_prop1') vce(cluster cluster)
							
	estadd scalar w1 = e(N) 
	estadd scalar w2 = e(k_controls) 
	estadd scalar w3 = e(k_controls_sel)
	estadd scalar w4 = e(chi2)
	est store m1
			
dsregress FKG log_num_authors  log_num_pages both_genders prop_women   , ///
		controls(`journals' `jel_imp' y_2-y_20  c_2-c_215  jel_flag  `jel_prop1') vce(cluster cluster) ///
			selection(cv) rseed(42)
			
	estadd scalar w1 = e(N) 
	estadd scalar w2 = e(k_controls) 
	estadd scalar w3 = e(k_controls_sel)
	estadd scalar w4 = e(chi2)
	est store m2			
			
			
dsregress FKG log_num_authors  log_num_pages both_genders prop_women   , ///
		controls(`journals' `jel_imp' y_2-y_20  c_2-c_215  jel_flag  `jel_prop1') vce(cluster cluster) ///
			selection(adaptive) rseed(42)
			
	estadd scalar w1 = e(N) 
	estadd scalar w2 = e(k_controls) 
	estadd scalar w3 = e(k_controls_sel)
	estadd scalar w4 = e(chi2)
	est store m3				
			
xporegress FKG  log_num_authors  log_num_pages both_genders prop_women  , ///
			controls(`journals' `jel_imp' y_2-y_20  c_2-c_215  jel_flag  `jel_prop1') vce(cluster cluster) rseed(42)

							
	estadd scalar w1 = e(N) 
	estadd scalar w2 = e(k_controls) 
	estadd scalar w3 = e(k_controls_sel)
	estadd scalar w4 = e(chi2)
	est store m4			
			
			
esttab m1 m2 m3 m4  using "$save_tables\FKG_prop_JI_2.tex",  replace b(4) se(4) star(* 0.10 ** 0.05) r2   ///
		stats(N k_controls k_controls_sel chi2, label( "Observations" "Number potential controls" ///
		"Number controls selected" "$\chi^2(4)$") fmt( 0 0 0 %9.3f)) label nonumbers mtitle("DS Regress" "DS Regress (cv)" "DS Regress (adaptive)" "XPO Regress")
		
estimates clear			


** JO

dsregress FKG  log_num_authors  log_num_pages both_genders prop_women   if jel_flag==1, ///
			controls(`journals' `jel_obs' y_2-y_20  c_2-c_215  jel_flag  `jel_prop2') vce(cluster cluster)

							
	estadd scalar w1 = e(N) 
	estadd scalar w2 = e(k_controls) 
	estadd scalar w3 = e(k_controls_sel)
	estadd scalar w4 = e(chi2)
	est store m1
			
dsregress FKG log_num_authors  log_num_pages both_genders prop_women   if jel_flag==1, ///
		controls(`journals' `jel_obs' y_2-y_20  c_2-c_215  jel_flag  `jel_prop2') vce(cluster cluster) ///
			selection(cv) rseed(42)
			
	estadd scalar w1 = e(N) 
	estadd scalar w2 = e(k_controls) 
	estadd scalar w3 = e(k_controls_sel)
	estadd scalar w4 = e(chi2)
	est store m2			
			
			
dsregress FKG log_num_authors  log_num_pages both_genders prop_women   if jel_flag==1, ///
		controls(`journals' `jel_obs' y_2-y_20  c_2-c_215  jel_flag  `jel_prop2') vce(cluster cluster) ///
			selection(adaptive) rseed(42)
			
	estadd scalar w1 = e(N) 
	estadd scalar w2 = e(k_controls) 
	estadd scalar w3 = e(k_controls_sel)
	estadd scalar w4 = e(chi2)
	est store m3				
			
xporegress FKG  log_num_authors  log_num_pages both_genders prop_women   if jel_flag==1, ///
			controls(`journals' `jel_obs' y_2-y_20  c_2-c_215  jel_flag  `jel_prop2') vce(cluster cluster) rseed(42)

							
	estadd scalar w1 = e(N) 
	estadd scalar w2 = e(k_controls) 
	estadd scalar w3 = e(k_controls_sel)
	estadd scalar w4 = e(chi2)
	est store m4			
			
			
esttab m1 m2 m3 m4  using "$save_tables\FKG_prop_JO_2.tex",  replace b(4) se(4) star(* 0.10 ** 0.05) r2   ///
		stats(N k_controls k_controls_sel chi2, label( "Observations" "Number potential controls" ///
		"Number controls selected" "$\chi^2(4)$") fmt( 0 0 0 %9.3f)) label nonumbers mtitle("DS Regress" "DS Regress (cv)" "DS Regress (adaptive)" "XPO Regress")
		
estimates clear		




*** DCH FEMALE

** JI

dsregress DCH  log_num_authors  log_num_pages both_genders only_females   , ///
			controls(`journals' `jel_imp' y_2-y_20  c_2-c_215  jel_flag  `jel_female1') vce(cluster cluster)

							
	estadd scalar w1 = e(N) 
	estadd scalar w2 = e(k_controls) 
	estadd scalar w3 = e(k_controls_sel)
	estadd scalar w4 = e(chi2)
	est store m1
			
dsregress DCH log_num_authors  log_num_pages both_genders only_females   , ///
		controls(`journals' `jel_imp' y_2-y_20  c_2-c_215  jel_flag  `jel_female1') vce(cluster cluster) ///
			selection(cv) rseed(42)
			
	estadd scalar w1 = e(N) 
	estadd scalar w2 = e(k_controls) 
	estadd scalar w3 = e(k_controls_sel)
	estadd scalar w4 = e(chi2)
	est store m2			
			
			
dsregress DCH log_num_authors  log_num_pages both_genders only_females   , ///
		controls(`journals' `jel_imp' y_2-y_20  c_2-c_215  jel_flag  `jel_female1') vce(cluster cluster) ///
			selection(adaptive) rseed(42)
			
	estadd scalar w1 = e(N) 
	estadd scalar w2 = e(k_controls) 
	estadd scalar w3 = e(k_controls_sel)
	estadd scalar w4 = e(chi2)
	est store m3				
			
xporegress DCH  log_num_authors  log_num_pages both_genders only_females  , ///
			controls(`journals' `jel_imp' y_2-y_20  c_2-c_215  jel_flag  `jel_female1') vce(cluster cluster) rseed(42)

							
	estadd scalar w1 = e(N) 
	estadd scalar w2 = e(k_controls) 
	estadd scalar w3 = e(k_controls_sel)
	estadd scalar w4 = e(chi2)
	est store m4			
			
			
esttab m1 m2 m3 m4  using "$save_tables\DCH_females_JI_2.tex",  replace b(4) se(4) star(* 0.10 ** 0.05) r2   ///
		stats(N k_controls k_controls_sel chi2, label( "Observations" "Number potential controls" ///
		"Number controls selected" "$\chi^2(4)$") fmt( 0 0 0 %9.3f)) label nonumbers mtitle("DS Regress" "DS Regress (cv)" "DS Regress (adaptive)" "XPO Regress")
		
estimates clear			


** JO

dsregress DCH  log_num_authors  log_num_pages both_genders only_females  if jel_flag==1, ///
			controls(`journals' `jel_obs' y_2-y_20  c_2-c_215  jel_flag  `jel_female2') vce(cluster cluster)

							
	estadd scalar w1 = e(N) 
	estadd scalar w2 = e(k_controls) 
	estadd scalar w3 = e(k_controls_sel)
	estadd scalar w4 = e(chi2)
	est store m1
			
dsregress DCH log_num_authors  log_num_pages both_genders only_females  if jel_flag==1, ///
		controls(`journals' `jel_obs' y_2-y_20  c_2-c_215 jel_flag  `jel_female2') vce(cluster cluster) ///
			selection(cv) rseed(42)
			
	estadd scalar w1 = e(N) 
	estadd scalar w2 = e(k_controls) 
	estadd scalar w3 = e(k_controls_sel)
	estadd scalar w4 = e(chi2)
	est store m2			
			
			
dsregress DCH log_num_authors  log_num_pages both_genders only_females  if jel_flag==1, ///
		controls(`journals' `jel_obs' y_2-y_20  c_2-c_215  jel_flag  `jel_female2') vce(cluster cluster) ///
			selection(adaptive) rseed(42)
			
	estadd scalar w1 = e(N) 
	estadd scalar w2 = e(k_controls) 
	estadd scalar w3 = e(k_controls_sel)
	estadd scalar w4 = e(chi2)
	est store m3				
			
xporegress DCH  log_num_authors  log_num_pages both_genders only_females  if jel_flag==1, ///
			controls(`journals' `jel_obs' y_2-y_20  c_2-c_215  jel_flag  `jel_female2') vce(cluster cluster) rseed(42)

							
	estadd scalar w1 = e(N) 
	estadd scalar w2 = e(k_controls) 
	estadd scalar w3 = e(k_controls_sel)
	estadd scalar w4 = e(chi2)
	est store m4			
			
			
esttab m1 m2 m3 m4  using "$save_tables\DCH_females_JO_2.tex",  replace b(4) se(4) star(* 0.10 ** 0.05) r2   ///
		stats(N k_controls k_controls_sel chi2, label( "Observations" "Number potential controls" ///
		"Number controls selected" "$\chi^2(4)$") fmt( 0 0 0 %9.3f)) label nonumbers mtitle("DS Regress" "DS Regress (cv)" "DS Regress (adaptive)" "XPO Regress")
		
estimates clear		


*** DSREGRESS MALE

** JI

dsregress DCH  log_num_authors  log_num_pages both_genders only_males   , ///
			controls(`journals' `jel_imp' y_2-y_20  c_2-c_215  jel_flag  `jel_male1') vce(cluster cluster)
							
	estadd scalar w1 = e(N) 
	estadd scalar w2 = e(k_controls) 
	estadd scalar w3 = e(k_controls_sel)
	estadd scalar w4 = e(chi2)
	est store m1
			
dsregress DCH log_num_authors  log_num_pages both_genders only_males  , ///
		controls(`journals' `jel_imp' y_2-y_20  c_2-c_215  jel_flag  `jel_male1') vce(cluster cluster) ///
			selection(cv) rseed(42)
			
	estadd scalar w1 = e(N) 
	estadd scalar w2 = e(k_controls) 
	estadd scalar w3 = e(k_controls_sel)
	estadd scalar w4 = e(chi2)
	est store m2			
			
			
dsregress DCH log_num_authors  log_num_pages both_genders only_males   , ///
		controls(`journals' `jel_imp' y_2-y_20  c_2-c_215  jel_flag  `jel_male1') vce(cluster cluster) ///
			selection(adaptive) rseed(42)
			
	estadd scalar w1 = e(N) 
	estadd scalar w2 = e(k_controls) 
	estadd scalar w3 = e(k_controls_sel)
	estadd scalar w4 = e(chi2)
	est store m3				
			
xporegress DCH  log_num_authors  log_num_pages both_genders only_males   , ///
			controls(`journals' `jel_imp' y_2-y_20  c_2-c_215  jel_flag  `jel_male1') vce(cluster cluster) rseed(42)

							
	estadd scalar w1 = e(N) 
	estadd scalar w2 = e(k_controls) 
	estadd scalar w3 = e(k_controls_sel)
	estadd scalar w4 = e(chi2)
	est store m4			
			
			
esttab m1 m2 m3 m4  using "$save_tables\DCH_males_JI_2.tex",  replace b(4) se(4) star(* 0.10 ** 0.05) r2   ///
		stats(N k_controls k_controls_sel chi2, label( "Observations" "Number potential controls" ///
		"Number controls selected" "$\chi^2(4)$") fmt( 0 0 0 %9.3f)) label nonumbers mtitle("DS Regress" "DS Regress (cv)" "DS Regress (adaptive)" "XPO Regress")
		
estimates clear			


** JO

dsregress DCH  log_num_authors  log_num_pages both_genders only_males   if jel_flag==1, ///
			controls(`journals' `jel_obs' y_2-y_20  c_2-c_215  jel_flag  `jel_male2') vce(cluster cluster)

							
	estadd scalar w1 = e(N) 
	estadd scalar w2 = e(k_controls) 
	estadd scalar w3 = e(k_controls_sel)
	estadd scalar w4 = e(chi2)
	est store m1
			
dsregress DCH log_num_authors  log_num_pages both_genders only_males   if jel_flag==1, ///
		controls(`journals' `jel_obs' y_2-y_20  c_2-c_215  jel_flag  `jel_male2') vce(cluster cluster) ///
			selection(cv) rseed(42)
			
	estadd scalar w1 = e(N) 
	estadd scalar w2 = e(k_controls) 
	estadd scalar w3 = e(k_controls_sel)
	estadd scalar w4 = e(chi2)
	est store m2			
			
			
dsregress DCH log_num_authors  log_num_pages both_genders only_males   if jel_flag==1, ///
		controls(`journals' `jel_obs' y_2-y_20  c_2-c_215  jel_flag  `jel_male2') vce(cluster cluster) ///
			selection(adaptive) rseed(42)
			
	estadd scalar w1 = e(N) 
	estadd scalar w2 = e(k_controls) 
	estadd scalar w3 = e(k_controls_sel)
	estadd scalar w4 = e(chi2)
	est store m3				
			
xporegress DCH  log_num_authors  log_num_pages both_genders only_males  if jel_flag==1, ///
			controls(`journals' `jel_obs' y_2-y_20  c_2-c_215  jel_flag  `jel_male2') vce(cluster cluster) rseed(42)

							
	estadd scalar w1 = e(N) 
	estadd scalar w2 = e(k_controls) 
	estadd scalar w3 = e(k_controls_sel)
	estadd scalar w4 = e(chi2)
	est store m4			
			
			
esttab m1 m2 m3 m4  using "$save_tables\DCH_males_JO_2.tex",  replace b(4) se(4) star(* 0.10 ** 0.05) r2   ///
		stats(N k_controls k_controls_sel chi2, label( "Observations" "Number potential controls" ///
		"Number controls selected" "$\chi^2(4)$") fmt( 0 0 0 %9.3f)) label nonumbers mtitle("DS Regress" "DS Regress (cv)" "DS Regress (adaptive)" "XPO Regress")
		
estimates clear		



*** FKG - PROPORTION WOMEN

** JI

dsregress DCH  log_num_authors  log_num_pages both_genders prop_women  , ///
			controls(`journals' `jel_imp' y_2-y_20  c_2-c_215 jel_flag  `jel_prop1') vce(cluster cluster)
							
	estadd scalar w1 = e(N) 
	estadd scalar w2 = e(k_controls) 
	estadd scalar w3 = e(k_controls_sel)
	estadd scalar w4 = e(chi2)
	est store m1
			
dsregress DCH log_num_authors  log_num_pages both_genders prop_women   , ///
		controls(`journals' `jel_imp' y_2-y_20  c_2-c_215 jel_flag  `jel_prop1') vce(cluster cluster) ///
			selection(cv) rseed(42)
			
	estadd scalar w1 = e(N) 
	estadd scalar w2 = e(k_controls) 
	estadd scalar w3 = e(k_controls_sel)
	estadd scalar w4 = e(chi2)
	est store m2			
			
			
dsregress DCH log_num_authors  log_num_pages both_genders prop_women   , ///
		controls(`journals' `jel_imp' y_2-y_20  c_2-c_215 jel_flag  `jel_prop1') vce(cluster cluster) ///
			selection(adaptive) rseed(42)
			
	estadd scalar w1 = e(N) 
	estadd scalar w2 = e(k_controls) 
	estadd scalar w3 = e(k_controls_sel)
	estadd scalar w4 = e(chi2)
	est store m3				
			
xporegress DCH  log_num_authors  log_num_pages both_genders prop_women   , ///
			controls(`journals' `jel_imp' y_2-y_20  c_2-c_215 jel_flag  `jel_prop1') vce(cluster cluster) rseed(42)

							
	estadd scalar w1 = e(N) 
	estadd scalar w2 = e(k_controls) 
	estadd scalar w3 = e(k_controls_sel)
	estadd scalar w4 = e(chi2)
	est store m4			
			
			
esttab m1 m2 m3 m4  using "$save_tables\DCH_prop_JI_2.tex",  replace b(4) se(4) star(* 0.10 ** 0.05) r2   ///
		stats(N k_controls k_controls_sel chi2, label( "Observations" "Number potential controls" ///
		"Number controls selected" "$\chi^2(4)$") fmt( 0 0 0 %9.3f)) label nonumbers mtitle("DS Regress" "DS Regress (cv)" "DS Regress (adaptive)" "XPO Regress")
		
estimates clear			


** JO

dsregress DCH  log_num_authors  log_num_pages both_genders prop_women   if jel_flag==1, ///
			controls(`journals' `jel_obs' y_2-y_20  c_2-c_215 jel_flag  `jel_prop2') vce(cluster cluster)

							
	estadd scalar w1 = e(N) 
	estadd scalar w2 = e(k_controls) 
	estadd scalar w3 = e(k_controls_sel)
	estadd scalar w4 = e(chi2)
	est store m1

			
dsregress DCH log_num_authors  log_num_pages both_genders prop_women   if jel_flag==1, ///
		controls(`journals' `jel_obs' y_2-y_20  c_2-c_215  jel_flag  `jel_prop2') vce(cluster cluster) ///
			selection(cv) rseed(42)
			
	estadd scalar w1 = e(N) 
	estadd scalar w2 = e(k_controls) 
	estadd scalar w3 = e(k_controls_sel)
	estadd scalar w4 = e(chi2)
	est store m2	
			
			
dsregress DCH log_num_authors  log_num_pages both_genders prop_women   if jel_flag==1, ///
		controls(`journals' `jel_obs' y_2-y_20  c_2-c_215  jel_flag  `jel_prop2') vce(cluster cluster) ///
			selection(adaptive) rseed(42)
			
	estadd scalar w1 = e(N) 
	estadd scalar w2 = e(k_controls) 
	estadd scalar w3 = e(k_controls_sel)
	estadd scalar w4 = e(chi2)
	est store m3
				
			
xporegress DCH  log_num_authors  log_num_pages both_genders prop_women   if jel_flag==1, ///
			controls(`journals' `jel_obs' y_2-y_20  c_2-c_215  jel_flag  `jel_prop2') vce(cluster cluster) rseed(42)

							
	estadd scalar w1 = e(N) 
	estadd scalar w2 = e(k_controls) 
	estadd scalar w3 = e(k_controls_sel)
	estadd scalar w4 = e(chi2)
	est store m4
			
			
			
esttab m1 m2 m3 m4  using "$save_tables\DCH_prop_JO_2.tex",  replace b(4) se(4) star(* 0.10 ** 0.05) ///
		stats(N k_controls k_controls_sel chi2,   label( "Observations" "Number potential controls" ///
		"Number controls selected" "$\chi^2(4)$" ) fmt( 0 0 0 %9.3f)) label nonumbers mtitle("DS Regress" "DS Regress (cv)" "DS Regress (adaptive)" "XPO Regress")
		
estimates clear		