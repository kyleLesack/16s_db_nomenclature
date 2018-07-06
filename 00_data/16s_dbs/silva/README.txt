# Overview

The nomenclature annotations were extracted from the SILVA (v. 132) SSURef database available at https://www.arb-silva.de/fileadmin/silva_databases/current/Exports/SILVA_132_SSURef_tax_silva.fasta.gz


SILVA_132_SSURef_tax_silva.fasta


grep ">" SILVA_132_SSURef_tax_silva.fasta | grep -v "Eukaryota" > SILVA_132_SSURef_prokaryotes


cat SILVA_132_SSURef_prokaryotes | cut -d ";" -f1,6,7 | grep ";" | cut -d ">" -f2 | sed  's/ Bacteria;/;/g' | sed  's/ Archaea;/;/g' | awk -F';' 'length($3)' > ./nomenclature/SILVA_132_species.csv
cat SILVA_132_SSURef_prokaryotes | cut -d ";" -f1,6 | grep ";" | cut -d ">" -f2 | sed  's/ Bacteria;/;/g' | sed  's/ Archaea;/;/g' | awk -F';' 'length($2)' > ./nomenclature/SILVA_132_genera.csv
cat SILVA_132_SSURef_prokaryotes | cut -d ";" -f1,6,7 | grep ";" | cut -d ">" -f2 | sed  's/ Bacteria;/;/g' | sed  's/ Archaea;/;/g' | awk -F';' '!length($3)' > ./nomenclature/SILVA_132_genera_no_species_annotations.csv

Note: The preceding extracts the records that are annotated down to the genus level, but do not contain species annotations. However, there appears to be a number of species names in the genus fields.


There are are number of annotations that are obviosly not a taxon name (eg enrichment culture clone, metagenome). A number of these were included in the taxon_filter file, and were used to filter out these records:

grep -v -Ff ./taxon_filters ./nomenclature/SILVA_132_genera.csv | grep -vw "bacterium" | tr -d "[" | tr -d "]" > ./nomenclature/filtered/SILVA_132_genera.filtered.csv
grep -v -Ff ./taxon_filters ./nomenclature/SILVA_132_species.csv | grep -vw "bacterium" | tr -d "[" | tr -d "]" > ./nomenclature/filtered/SILVA_132_species.filtered.csv
grep -v -Ff ./taxon_filters ./nomenclature/SILVA_132_genera_no_species_annotations.csv | grep -vw "bacterium" | tr -d "[" | tr -d "]" > ./nomenclature/filtered/SILVA_132_genera_no_species_annotations.filtered

The filtered files were used to extract unique names:

cut -d ";" -f 2  ./nomenclature/filtered/SILVA_132_genera.filtered.csv | cut -d " " -f1 | sort -u >  nomenclature/filtered/unique_names/SILVA_132_genera.names.txt
cut -d ";" -f 3  ./nomenclature/filtered/SILVA_132_species.filtered.csv | cut -d " " -f1,2 | sort -u >  nomenclature/filtered/unique_names/SILVA_132_genera.names.txt
cut -d ";" -f 2  ./nomenclature/filtered/SILVA_132_genera_no_species_annotations.filtered | cut -d " " -f1,2 | sort -u >  nomenclature/filtered/unique_names/SILVA_132_genera_no_species_annotations.names.txt

