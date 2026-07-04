## Overview

The code in this replication package use Stata to produce all results of the paper "Understanding school management with public data: A new measurement approach and application". The master file run all data creation and analysis do files, generating all exhibits in the paper. The replicator should expect the code to run for about four days. Instructions on how to download the data are included in this package. The data itself is public, but not included as the files total over 360GB. Please contact Daniela Scur if you cannot find any of the files online. 

Due to the long run time from the cleaning part, the analysis dataset are also provided (folder analysis/data). All exhibits can be produced from those datasets. We provided the data set "MgmtIndex_ProvaBrasil_StdtYear.dta" divided in 15 parts due to Dataverse's size limitation. If the replicator chooses to start from the analysis dataset, the first step is to append those files.

## Data Availability and Provenance Statements

This section lists the sources used for the paper's analysis. For each one, a description, details on how to download the data and the folder location in the replication repository are provided. The paper uses only public data. The sheet "Input Dataset List" sheet of Excel file "replication_files.xlsx" lists all datasets used as input.


### Statement about Rights

- [X] I certify that the author(s) of the manuscript have legitimate access to and permission to use the data used in this manuscript. 
- [x] I certify that the author(s) of the manuscript have documented permission to redistribute/publish the data contained within this replication package. Appropriate permission are documented in the [LICENSE.txt](LICENSE.txt) file.


### License for Data

The data are licensed under a Creative Commons/CC-BY license. See LICENSE.txt for details.

### Summary of Availability

- [X] All data **are** publicly available.
- [ ] Some data **cannot be made** publicly available.
- [ ] **No data can be made** publicly available.


### Details on each Data Source

A summary table of every data file used as input for this paper is present in "Input Dataset List" sheet of Excel file "replication_files.xlsx".


### PISA
PISA (Programme for International Student Assessment) is a international education assessment conducted by the OECD. The raw files are publicly available. For 2012, the raw files (zipped .txt) can be downloaded from https://www.oecd.org/en/data/datasets/pisa-2012-database.html. A copy of those files is provided as part of this archive.

**Location in repository:** input/PISA2012
**License: ** [CC-BY 4.0](https://creativecommons.org/licenses/by/4.0/)
**Citation: ** OECD (2012)

For 2022, the raw files (zipped .sas7bdat) can be downloaded from https://www.oecd.org/en/data/datasets/pisa-2022-database.html. A copy of those files is provided as part of this archive.

**Location in repository:** input/PISA2022
**License: ** [CC-BY 4.0](https://creativecommons.org/licenses/by/4.0/)
**Citation: ** OECD (2022)


### Prova Brasil
Prova Brasil (renamed Sistema de Avaliacao da Educacao Basica (Saeb) in 2018) is test for assessing the level of education in Brazilian schools conducted by the Instituto Nacional de Estudos e Pesquisas Educacionais Anisio Teixeira (INEP) every two years. We utilized data from 2005 to 2017. The raw files are publicly available. All raw files can be downloaded in INEP's website (https://www.gov.br/inep/pt-br/acesso-a-informacao/dados-abertos/microdados/saeb) by clicking in "Microdados do Saeb {year}". A copy of these files can provided upon request if they cannot be found online. The school identification code where masked in the currently available public files, because of changes in the Brazilian Data Protection Law (*Lei Geral de Proteção de Dados*, LGPD, Law number 13.709 from 2018).  

**Location in repository:** input/PB
**License: ** [CC BY-ND 3.0 Attribution-NoDerivs 3.0 Unported](https://creativecommons.org/licenses/by-nd/3.0/deed.en)
**Citation: ** INEP (2005-2017a)


### Censo Escolar
Censo Escolar is a census conducted year in every Brazilian school by the INEP, gathering data about infrastructure, teacher and student enrollment. We use data from 2005 to 2017. Some of raw files are publicly available. They can be downloaded in INEP's website (https://www.gov.br/inep/pt-br/acesso-a-informacao/dados-abertos/microdados/censo-escolar) by clicking in "Microdados do Censo Escolar {year}". However, **the student-level tables**, that used to be public available are no longer available because of changes in the Brazilian Data Protection Law (*Lei Geral de Proteção de Dados*, LGPD, Law number 13.709 from 2018). A copy of those files can be provided upon request, but they can also be accessed via [Base dos Dados](https://basedosdados.org/dataset/dae21af4-4b6a-42f4-b94a-4c2061ea9de5?table=a1cdb042-073e-4891-ad98-67e0bef5d18e).

**Location in repository:** input/Censo Escolar
**License: ** [CC BY-ND 3.0 Attribution-NoDerivs 3.0 Unported](https://creativecommons.org/licenses/by-nd/3.0/deed.en)
**Citation: ** INEP (2005-2017b)


### Prova Brasil WMS
These datasets represent the combination of World Management Survey (WMS) (Bloom et al., 2021) made in Brazilian Schools with Prova Brasil's grades. They were provided by the WMS team upon request, which can be made at https://worldmanagementsurvey.org/data/request-special-access-to-the-wms-data-form/

**Location in repository:**  input/Prova Brasil - WMS 
**License: ** [CC0 1.0](https://creativecommons.org/publicdomain/zero/1.0/)
**Citation: ** Bloom et al. (2021)


### Replication File of Akhtari et al. (2022)
The replication file (Moreira et al., 2021) of the paper 'Political Turnover, Bureaucratic Turnover and the Quality of Public Services' by Mitra Akhtari, Diana Moreira and Laura Trucco provides us with data of elections in Brazilian municipalities. The replication file can be downloaded from https://www.openicpsr.org/openicpsr/project/150323/version/V1/view. 

**Location in repository:** input/Akhtari et al. (2022)
**License: ** [CC BY-NC 4.0 Attribution-NonCommercial 4.0 International](https://creativecommons.org/licenses/by-nc/4.0/)
**Citation: ** Moreira et al. (2021)





## Dataset list

A list of all datasets available in this archive is presented in "Replication Files" sheet of Excel file "replication_files.xlsx".


## Computational requirements

### Software Requirements

- [X] The replication package contains one or more programs to install all dependencies and set up the necessary directory structure. The first lines of master.do install the programs listed below.

- Stata (code was last run with version 18)
  - `estout` 
  - `binscatter`
  - `rdrobust`
  - `pv`
  - `repest`
  - `icw_index`
  - `grc1leg`
  - `cibar`
  - `fs`
  

### Controlled Randomness

- [ ] Random seed is set at line _____ of program ______
- [X] No Pseudo random generator is used in the analysis described here.

### Memory, Runtime, Storage Requirements

#### Summary

Approximate time needed to reproduce the analyses on a standard 2026 desktop machine:

- [ ] <10 minutes
- [ ] 10-60 minutes
- [ ] 1-2 hours
- [ ] 2-8 hours
- [ ] 8-24 hours
- [ ] 1-3 days
- [X] 3-14 days

Approximate storage space needed:

- [ ] < 25 MBytes
- [ ] 25 MB - 250 MB
- [ ] 250 MB - 2 GB
- [ ] 2 GB - 25 GB
- [X] 25 GB - 250 GB
- [ ] > 250 GB (approximately 360 GB)

- [ ] Not feasible to run on a desktop machine, as described below.

#### Details

The code was last run on a 32-core Linux-based server with Rocky Linux with 256GB of RAM (about 32GB should be enough). Computation took about 4 days.

Researchers may not need to run all the codes, especially if they intend to replicate our management measurement methodology in other countries. This approach can save both time and storage space. The PISA analysis (specifically, calculating scores using plausible values with the repest module) takes approximately three days to run (about one and a half day per PISA wave) while requiring minimal storage space (< 10 GB). Running the code for Brazilian schools only takes around one day but requires approximately 20 GB of storage. The replication and analysis using the Moreira et al. (2021) datasets takes just a few hours and requires about 1 GB of storage.



  
## Description of programs/code

### License for Code

The code is licensed under a Modified BSD license. See "LICENSE.txt" for details.

## Instructions to Replicators

- Edit the first lines of `master.do` to adjust the default path
- Run once on a new system to set up the working environment. 
- Download the data files referenced above. Each should be stored directories listed in the Data Availability section, in the format that you download them in. Do not unzip. No further action is needed on the replicator's part.
- Run `master.do` to run all codes in sequence.

### Details

- `master.do`: is the do-file that calls all others. Running it must create every single output file. As described above, changing the first lines of it is all you need to do manually.

- `cleaning/`: contains code related to preparing data
   - `1_pb_cleaning.do`:is the code used to clean Prova Brasil data.
   - `2_pol_turnover_cleaning.do`: is the code used to clean Political Turnover data, adapted from Moreira et al. (2021).
   - `3_pisa2012_cleaning.do`: is the code used to clean the PISA data. Longest part, takes about 3 days to run
   - `4_pisa2022_cleaning`: is the code used to clean Censo Escolar (School Census) data.
   - codes starting with "aux_" are auxiliary codes that are called inside the codes mentioned above.
   
- `analysis/`: Contain code related to analyzing the data and producing the paper's exhibits 
  - all codes are named based on the figures they produce


## List of tables and programs

The provided code reproduces:

- [X] All numbers provided in text in the paper
- [X] All tables and figures in the paper
- [ ] Selected tables and figures in the paper, as explained and justified below.

A detail list of all exhibits and the code that produce them is available in "Paper Exhibits" sheet of Excel file "replication_files.xlsx".



## References

Akhtari, Mitra, Moreira, Diana, and Trucco, Laura (2022). "Political Turnover, Bureaucratic Turnover, and the Quality of Public Services." American Economic Review, 112 (2): 442–93. 

Bloom, Nicholas, Lemos, Renata, Sadun, Raffaella, Scur, Daniela, and Van Reenen, John (2021). "World Management Survey - Manufacturing", https://doi.org/10.7910/DVN/OY6CBK, Harvard Dataverse, V1

Instituto Nacional de Estudos e Pesquisas Educacionais Anísio Teixeira (INEP) (2005-2017a). Sistema de Avaliação da Educação Básica (Saeb) Microdata. Available at https://www.gov.br/inep/pt-br/acesso-a-informacao/dados-abertos/microdados/saeb.

Instituto Nacional de Estudos e Pesquisas Educacionais Anísio Teixeira (INEP) (2005-2017b). Censo Escolar Microdata. Available at https://www.gov.br/inep/pt-br/acesso-a-informacao/dados-abertos/microdados/censo-escolar.

Moreira, Diana, Akhtari, Mitra, and Trucco, Laura (2021). Data and Code for: Political Turnover, Bureaucratic Turnover and the Quality of Public Services. https://doi.org/10.3886/E150323V1

Organisation for Economic Co-operation and Development (OECD) (2012). Programme for International Student Assessment (PISA) 2012 Database. Available at https://www.oecd.org/en/data/datasets/pisa-2012-database.html.

Organisation for Economic Co-operation and Development (OECD) (2022). Programme for International Student Assessment (PISA) 2022 Database. Available at https://www.oecd.org/en/data/datasets/pisa-2022-database.html.





