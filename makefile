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


FORCE:

clean:
	-rm 01_lpsn/output/*.html; rm 01_lpsn/output/*.txt; rm 01_lpsn/output/*.csv; rm 01_lpsn/output/final/*
	-rm 02_uptodate/output/*.txt; rm 02_uptodate/output/*.tsv; rm 02_uptodate/output/final/*.txt
	-rm 03_coresets/output/*.txt; rm 03_coresets/output/discrepancies/*.txt; rm 03_coresets/output/final/*.txt

