clear all


cd "C:/Users/leona/OneDrive/1_WP/Net_journals/econ_letters"



use "./data/data.dta", clear


egen journal1 = group(journal)


specurve using "./code/readability_graph_specurve.yml", outcmd

