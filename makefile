.PHONY: all clean 

all: 01_lpsn 02_uptodate


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

	


FORCE:

clean:
	-rm 01_lpsn/output/*.html; rm 01_lpsn/output/*.txt; rm 01_lpsn/output/*.csv; rm 01_lpsn/output/final/*
	-rm 02_uptodate/output/*.txt; rm 02_uptodate/output/*.tsv; rm 02_uptodate/output/final/*.txt

