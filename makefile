.PHONY: all clean 

all: 01_lpsn 02_uptodate 03_coresets


01_lpsn: FORCE
	pipenv run python 01_lpsn/main.py ./01_lpsn/output
	cat 01_lpsn/output/genera_* > 01_lpsn/output/final/genera_total.txt
	cat 01_lpsn/output/species_* > 01_lpsn/output/final/species_total.txt
	cat 01_lpsn/output/candidatus_species.csv | sort -u > 01_lpsn/output/final/candidatus_species.csv
	cp 01_lpsn/output/invalid*.txt 01_lpsn/output/final/
	sh 01_lpsn/manual_changes.sh

02_uptodate: FORCE
	python 02_uptodate/getData.py
	sh 02_uptodate/processData.sh
	sh 02_uptodate/getInvalid.sh

03_coresets: ./03_coresets/lpsn/genera_total.txt ./03_coresets/lpsn/species_total.txt  ./03_coresets/lpsn/invalid_genus.txt ./03_coresets/lpsn/invalid_species.txt ./03_coresets/up2date/genera_final.txt ./03_coresets/up2date/species_final.txt  ./03_coresets/up2date/invalid_genera_names.txt ./03_coresets/up2date/invalid_species_names.txt ./03_coresets/cyanodb/invalid_genera.txt ./03_coresets/cyanodb/valid_genera.txt ./03_coresets/cyanodb/valid_species.txt
	pipenv run python 03_coresets/createCoresets.py	
	sh 03_coresets/manual_changes.sh

04_validate_16s: 03_coresets/output/final/invalid_genera_coreset.txt 03_coresets/output/final/invalid_species_coreset.txt 03_coresets/output/final/valid_genera_coreset.txt 03_coresets/output/final/valid_species_coreset.txt 03_coresets/output/discrepancies/final/all_genera_final.txt 03_coresets/output/discrepancies/final/all_species_final.txt
	sh 04_validate_16s/validateDBs.sh

05_validate_taxonomy: 05_validate_taxonomy/16s_dbs/gg/taxonomy/gg_13_5_taxonomy.txt 05_validate_taxonomy/16s_dbs/rdp/rdp_taxonomy.txt 05_validate_taxonomy/16s_dbs/silva/silva_taxonomy.txt 05_validate_taxonomy/16s_dbs/gg/validation_results/gg_unclassified_genera.csv 05_validate_taxonomy/16s_dbs/gg/validation_results/gg_unclassified_species.csv 05_validate_taxonomy/16s_dbs/rdp/validation_results/rdp_unclassified_genera.csv 05_validate_taxonomy/16s_dbs/silva/validation_results/silva_unclassified_genera_with_one_term.csv 05_validate_taxonomy/16s_dbs/silva/validation_results/silva_unclassified_genera_with_two_terms.csv
	sh 05_validate_taxonomy/checkOrganelles.sh
	sh 05_validate_taxonomy/prepareUnclassified.sh	
	sh 05_validate_taxonomy/summarizeResults.sh
	
06_binomial_nomenclature: 06_binomial_nomenclature/16s_dbs/gg_genus_species.csv 06_binomial_nomenclature/16s_dbs/silva_filtered_genus_species.csv
	python ./06_binomial_nomenclature/checkBinomialGG.py  
	python ./06_binomial_nomenclature/checkBinomialSILVA.py


FORCE:

clean:
	-rm 01_lpsn/output/*.html; rm 01_lpsn/output/*.txt; rm 01_lpsn/output/*.csv; rm 01_lpsn/output/final/*
	-rm 02_uptodate/output/*.txt; rm 02_uptodate/output/*.tsv; rm 02_uptodate/output/final/*.txt
	-rm 03_coresets/output/*.txt; rm 03_coresets/output/discrepancies/*.txt; rm 03_coresets/output/final/*.txt

