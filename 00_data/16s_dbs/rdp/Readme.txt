# Overview

RDP nomenclature was extracted from RDP Release 11, Update 5 :: September 30, 2016

The unaligned 16S fasta files for bacteria and archaea were downloaded from:

https://rdp.cme.msu.edu/download/current_Bacteria_unaligned.fa.gz
https://rdp.cme.msu.edu/download/current_Archaea_unaligned.fa.gz

The files containing the RDP nomenclature for genus level classifications are found in the nomenclature folder. 
rdp_genera_ids_names.csv contains both the sequence ids and assigned names
rdp_genus_names.txt contains only the unique genus names in 


# Nomenclature extraction

The fasta headers contain the nomenclature annotations and were extracted from the RDP fasta files using:

grep ">" current_Bacteria_unaligned.fa > ./current_Bacteria.header
grep ">" current_Archaea_unaligned.fa > ./current_Archaea.header

The IDs, descriptors, and names for sequences with genus level classifications were extracted using:

python getGeneraBacteria.py > current_Bacteria_genera_descriptions.txt 
python getGeneraArchaea.py > current_Archaea_genera_descriptions.txt 

These files contain the sequence descriptors which may contain organism names that could lead to false positives. These were removed as follows:

awk -F'[ |;]' '{print $1 "," $NF }' current_Bacteria_genera_descriptions.txt > current_Bacteria_genera_ids.csv
awk -F'[ |;]' '{print $1 "," $NF }' current_Archaea_genera_descriptions.txt > current_Archaea_genera_ids.csv

Archaea and bacteria were combined using: 

cat current_Archaea_genera_ids.csv current_Bacteria_genera_ids.csv | sort > rdp_genera_ids_names.csv

Unique names were extracted using:

cat rdp_genera_ids_names.csv | cut -f2 -d "," | sort | uniq > rdp_genus_names.txt

