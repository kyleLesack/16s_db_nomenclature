# Overview

RDP nomenclature was extracted from RDP Release 11, Update 5 :: September 30, 2016

The unaligned 16S fasta files for bacteria and archaea were downloaded from:

https://rdp.cme.msu.edu/download/current_Bacteria_unaligned.fa.gz

https://rdp.cme.msu.edu/download/current_Archaea_unaligned.fa.gz

The files containing the RDP nomenclature for genus level classifications are found in the nomenclature folder:

rdp_genera_ids_names.csv.tar.gz contains both the sequence ids and assigned names **Note: this was compressed due to Github's size recommendation. Should be extracted before using the pipeline

rdp_genus_names.txt contains only the unique genus names in RDP



# Nomenclature extraction

The fasta headers contain the nomenclature annotations and were extracted from the RDP fasta files using:

grep ">" current_Bacteria_unaligned.fa > ./current_Bacteria.header
grep ">" current_Archaea_unaligned.fa > ./current_Archaea.header

The IDs, descriptors, and names for sequences with genus level classifications were extracted using:

python getGenera.py 

The output files contain the sequence descriptors which may contain organism names that could lead to false positives. These were removed as follows:

awk -F'[ |;]' '{print $1 "," $NF }' rdp_genera_descriptions.csv > rdp_genera_ids_names.csv
awk -F'[ |;]' '{print $1 "," $NF }' rdp_genera_candidatus_descriptions.csv > rdp_candidatus_genera_ids_names.csv
awk -F'[ |;]' '{print $1 "," $NF }' rdp_genera_incertae_sedis_descriptions.csv > rdp_incertae_genera_ids_names.csv


Unique names were extracted using:

cat rdp_genera_ids_names.csv | cut -f2 -d "," | sort | uniq > rdp_genus_names.txt


## Organelle check 

Note: The RDP database includes organelles as taxonomic classifications. The 05_validate_taxonomy/checkOrganelles.sh script requires the complete RDP taxonomy (not included here due to size), which can be created as follows:

cat current_Archaea.header current_Bacteria.header | sort > rdp_taxonomy.txt

