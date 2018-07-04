# 16s_db_nomenclature
Repository for 16S Database Nomenclature Validation

## Overview

## Requirements

This repository includes Python (tested on Python v. 3.7.0) and Bash scripts to collect reference data from prokaryote nomenclature databases, and validate the nomenclature annotations contained in public 16S rRNA gene databases. Pipenv (https://www.python.org/getit/) was used for Python package management. 

Higher level taxonomic placements were determined using the R (tested on R v. 3.4.2) Taxize package (https://cran.r-project.org/web/packages/taxize/index.html). 

### APIs 

The higher level taxonomic placement steps require thousands of queries to the NCBI Entrez system. Users are allowed up to 3 requests per second without an API key. This limit can be increased to 10 requests per second with an API key. For more information see:

https://ncbiinsights.ncbi.nlm.nih.gov/2017/11/02/new-api-keys-for-the-e-utilities/

The R script included here obtains the API key from an environment variable. For more information see:

https://cran.r-project.org/web/packages/taxize/taxize.pdf


The Prokaryote nomenclature resource requires an API key. For more information see:

https://bacdive.dsmz.de/api/pnu/



### 16S rRNA gene Reference Data




## Instructions

The required Python packages can be installed using Pipenv:

pipenv install
