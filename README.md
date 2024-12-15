# Abstract Readability: Evidence from Top-5 Economics Journals

Rodriguez, Belicia, Kim P. Huynh, David Tomás Jacho-Chávez, and Leonardo Sánchez-Aragón, (2024), "_Abstract Readability: Evidence from Top-5 Economics Journals_," **Economics Letters**, 111541.

## Requirements
Both [Python](https://www.python.org/) [version 3.9.0] or above and [Stata](https://www.stata.com/) [version 17.0] or above are needed as well as the following libraries:

| **Stata** | **Python** |
|-----------|------------|
| [oaxaca](https://github.com/benjann/oaxaca) [version 4.1.1]   | [pyyaml](https://pypi.org/project/PyYAML/) [version 6.0.2]       |
| [reghdfe](https://github.com/sergiocorreia/reghdfe) [version 6.12.3]   | [pystata](https://www.stata.com/python/pystata18/index.html) [version 0.1.3]    |
| [specurve](https://github.com/mgao6767/specurve)  | [pandas](https://pandas.pydata.org/) [version 1.3.2]     |
|           | [numpy](https://numpy.org/) [version 1.21.1]      |

Note: These are the versions of packages installed on a computer where we successfully ran all the notebooks without errors. We make no guarantee that the notebooks will work on other local installations or with different versions of these packages.

## Description

This repository contains all necessary files to reproduce all results published in [Rodriguez, et. al (2024, _Economics Letters_)](https://linkinghub.elsevier.com/retrieve/pii/S0165176524000259) as well as its [Supplemental Materials](<Rodriguez, et al, 2024, supp material.pdf>) in the:

- [Code Folder](#Code-Folder)
- [Data Folder](#Data-Folder)
- [Tables Folder](#Tables-Folder)

Note: Please note that the code is distributed in the form of Jupyter Notebooks in the [Code Folder](#Code-Folder).

## Code Folder

- [**0_tables_main.ipynb**](code/0_tables_main.ipynb): It generates all tables included in the main manuscript. The output is saved into *tables* folder within this repository. The input is ```data.csv``` which is stored into *data* folder, also within this repository.

- [**0_tables_supp.ipynb**](code/0_tables_supp.ipynb): It generates all tables included in the supplemental materials. The output is saved into *tables* folder within this repository. The input is ```data.csv``` which is stored into *data* folder, also within this repository.
  
- [**1_regress_main.ipynb**](code/1_regress_main.ipynb):  It generates all regression outputs in the main manuscript. The output is saved into *tables* folder within this repository. The input is ```data.dta``` (stata format) which is stored into *data* folder, also within this repository.

- [**1_regress_supp.ipynb**](code/1_regress_supp.ipynb):  It generates all regression outputs in the supplemental materials. The output is saved into *tables* folder within this repository. The input is ```data.dta``` (stata format) which is stored into *data* folder, also within this repository.

- [**2_specurve_main.ipynb**](code/2_specurve_main.ipynb):  It generates Figure 1 in the main manuscript

- [**2_specurve_extra_supp.ipynb**](code/2_specurve_supp.ipynb)  It generates Figure 1 in the supplementary materials.

- [**readability_graph_specurve.yml**](code/readability_graph_specurve.yml): This file contains the parameters needed by the user-written [```specurve```](https://github.com/mgao6767/specurve) Stata command to run [```2_specurve_main.ipynb```](code/2_specurve_main.ipynb) and [```2_specurve_extra_supp.ipynb```](code/2_specurve_supp.ipynb).

## Data Folder
This folder contains the original data set used in the main manuscript in comma separated variable format (```data.csv```) as well as in Stata ```dta-format 118 from Stata 14, 15, 16, or 17```. It also contains a markdown file with the variable names and descriptions.

- [```data.csv```](data/data.csv)
- [```data.dta```](data/data.dta)
- [```vars_description.md```](data/vars_description.md)

## Tables Folder

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