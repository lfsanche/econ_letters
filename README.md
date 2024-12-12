# econ_letters

## Manuscripts

- [Abstract readability: Evidence from top-5 economics journals](<Rodriguez, et al, 2024.pdf>)
- [Abstract Readability: Evidence from Top-5 Economics Journals – Supplemental Materials –](<Rodriguez, et al, 2024, supp material.pdf>)

## Code folder

- [**0_tables_main.ipynb**](code/0_tables_main.ipynb): It generates all tables included in the main manuscript. The output is saved into *tables* folder within this repository. The input is ```data.csv``` which is stored into *data* folder, also within this repository.

- [**0_tables_supp.ipynb**](code/0_tables_supp.ipynb): It generates all tables included in the supplemental materials. The output is saved into *tables* folder within this repository. The input is ```data.csv``` which is stored into *data* folder, also within this repository.
  
- [**1_regress_main.ipynb**](code/1_regress_main.ipynb):  It generates all regression outputs in the main manuscript. The output is saved into *tables* folder within this repository. The input is ```data.dta``` (stata format) which is stored into *data* folder, also within this repository.

- [**1_regress_supp.ipynb**](code/1_regress_supp.ipynb):  It generates all regression outputs in the supplemental materials. The output is saved into *tables* folder within this repository. The input is ```data.dta``` (stata format) which is stored into *data* folder, also within this repository.

- [**2_specurve_main.ipynb**](code/2_specurve_main.ipynb):  It generates Figure 1 in the main manuscript

- [**2_specurve_extra_supp.ipynb**](code/2_specurve_supp.ipynb)  It generates Figure 1 in the supplementary materials.

- [**readability_graph_specurve.yml**](code/readability_graph_specurve.yml): This file contains the parameters needed by the user-written [```specurve```](https://github.com/mgao6767/specurve) Stata command to run ```2_specurve_main.ipynb``` and ```2_specurve_extra_supp.ipynb```

## Data folder

- [```data.csv```](data/data.csv)
- [```data.dta```](data/data.dta)
- [```vars_description.md```](data/vars_description.md)

## Tables folder

### Main Manuscript
- [Table 1](tables/table1.tex) 
- [Table 2](tables/table2.tex) 
- [Table 3](tables/oaxaca.tex) 
- [Table 4](tables/dgregress_FKG_JI.tex)

### Supplemental Materials
- [Table 1](tables/table1_sm.tex) 
- [Table 2](tables/table2_sm.tex) 
- [Table 3](tables/table3_sm.tex) 
- [Table 4](tables/dgregress_FKG_JO.tex) 
- [Table 5](tables/dsregress_sel_FKG_JI.tex) 
- [Table 6](tables/dsregress_sel_FKG_JO.tex) 
- [Table 7](tables/xporegress_FKG_JI.tex) 
- [Table 8](tables/xporegress_FKG_JO.tex) 
- [Table 9](tables/dgregress_DCH_JI.tex) 
- [Table 10](tables/dgregress_DCH_JO.tex) 
- [Table 11](tables/dsregress_sel_DCH_JI.tex) 
- [Table 12](tables/dsregress_sel_DCH_JO.tex) 
- [Table 13](tables/xporegress_DCH_JI.tex) 
- [Table 14](tables/xporegress_DCH_JO.tex) 