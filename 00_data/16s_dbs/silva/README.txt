# Overview

The nomenclature annotations were extracted from the SILVA (v. 132) SSURef database available at https://www.arb-silva.de/fileadmin/silva_databases/current/Exports/SILVA_132_SSURef_tax_silva.fasta.gz


grep ">" SILVA_132_SSURef_tax_silva.fasta | grep -v "Eukaryota" > SILVA_132_SSURef_prokaryotes

cat SILVA_132_SSURef_prokaryotes | cut -d ";" -f1,6,7 | grep ";" | cut -d ">" -f2 | sed  's/ Bacteria;/;/g' | sed  's/ Archaea;/;/g' | awk -F';' 'NF==3{print}{}' > ./nomenclature/SILVA_132_genus_species.csv
cat SILVA_132_SSURef_prokaryotes | cut -d ";" -f1,6 | grep ";" | cut -d ">" -f2 | sed  's/ Bacteria;/;/g' | sed  's/ Archaea;/;/g'   | awk -F';' 'NF==2{print}{}' > ./nomenclature/SILVA_132_genera.csv
cat SILVA_132_SSURef_prokaryotes | cut -d ";" -f1,6,7 | grep ";" | cut -d ">" -f2 | sed  's/ Bacteria;/;/g' | sed  's/ Archaea;/;/g' | awk -F';' 'NF!=3{print}{}'  > ./nomenclature/SILVA_132_genera_no_species_annotations.csv

Note: The preceding extracts the records that are annotated down to the genus level, but do not contain species annotations. However, there appears to be a number of species names in the genus fields.


There are are number of annotations that are obviosly not a taxon name (eg enrichment culture clone, metagenome). A number of these were included in the taxon_filter file, and were used to filter out these records:

grep -v -wFf ./taxon_filters ./nomenclature/SILVA_132_genera.csv  | tr -d "[" | tr -d "]" > ./nomenclature/filtered/SILVA_132_genera.filtered.csv
grep -v -wFf ./taxon_filters ./nomenclature/SILVA_132_genus_species.csv | tr -d "[" | tr -d "]" > ./nomenclature/filtered/SILVA_132_genus_species.filtered.csv
grep -v -wFf ./taxon_filters ./nomenclature/SILVA_132_genera_no_species_annotations.csv | tr -d "[" | tr -d "]" > ./nomenclature/filtered/SILVA_132_genera_no_species_annotations.filtered
cat ./nomenclature/filtered/SILVA_132_genus_species.filtered.csv | cut -d ";" -f 1,3 > ./nomenclature/filtered/SILVA_132_species.filtered.csv 

Obtain counts of records filtered out due to being candidatus or metadata


grep -wFf ./taxon_filters ./nomenclature/SILVA_132_genera.csv | grep -i "candidatus" | tr -d "[" | tr -d "]" > ./nomenclature/filtered_out/SILVA_132_genera_candidatus.csv
grep -wFf ./taxon_filters ./nomenclature/SILVA_132_genus_species.csv | grep -i "candidatus" | tr -d "[" | tr -d "]" > ./nomenclature/filtered_out/SILVA_132_species_candidatus.csv
grep -wFf ./taxon_filters ./nomenclature/SILVA_132_genera_no_species_annotations.csv | grep -i "candidatus" | tr -d "[" | tr -d "]" > ./nomenclature/filtered_out/SILVA_132_genera_no_species_annotations_candidatus.csv

grep -wFf ./taxon_filters ./nomenclature/SILVA_132_genera.csv | grep -vi "candidatus" | tr -d "[" | tr -d "]" > ./nomenclature/filtered_out/SILVA_132_genera_metadata.csv
grep -wFf ./taxon_filters ./nomenclature/SILVA_132_genus_species.csv | grep -vi "candidatus" | tr -d "[" | tr -d "]" > ./nomenclature/filtered_out/SILVA_132_species_metadata.csv
grep -wFf ./taxon_filters ./nomenclature/SILVA_132_genera_no_species_annotations.csv | grep -vi "candidatus" | tr -d "[" | tr -d "]" > ./nomenclature/filtered_out/SILVA_132_genera_no_species_annotations_metadata.csv


The filtered files were used to extract unique names:

cut -d ";" -f 2  ./nomenclature/filtered/SILVA_132_genera.filtered.csv | cut -d " " -f1 | sort -u >  nomenclature/filtered/unique_names/SILVA_132_genera.names.txt
cut -d ";" -f 2  ./nomenclature/filtered/SILVA_132_species.filtered.csv | cut -d " " -f1,2 | sort -u >  nomenclature/filtered/unique_names/SILVA_132_species.names.txt
cut -d ";" -f 2  ./nomenclature/filtered/SILVA_132_genera_no_species_annotations.filtered | cut -d " " -f1,2 | sort -u >  nomenclature/filtered/unique_names/SILVA_132_genera_no_species_annotations.names.txt




