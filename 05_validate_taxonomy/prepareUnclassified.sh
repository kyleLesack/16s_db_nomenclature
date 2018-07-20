# Get uniq names that were unclassified in Greengenes; ignore names with _ characters (these are merged groups, which won't map to knwown taxa)
cat 05_validate_taxonomy/16s_dbs/gg/validation_results/gg_unclassified_genera.csv | cut -f 2 -d "," | grep -v "_" |  sort -u > 05_validate_taxonomy/intermediate_files/gg_unclassified_genus_names_uniq.txt
cat 05_validate_taxonomy/16s_dbs/gg/validation_results/gg_unclassified_species.csv | cut -f 2 -d "," | sort -u > 05_validate_taxonomy/intermediate_files/gg_unclassified_species_names_uniq.txt


# Get uniq names that were unclassified in RDP
cat 05_validate_taxonomy/16s_dbs/rdp/validation_results/rdp_unclassified_genera.csv | cut -f 2 -d ","  | sort -u > 05_validate_taxonomy/intermediate_files/rdp_unclassified_genus_names_uniq.txt


# Get uniq names that were unclassified in SILVA

grep -vFf 05_validate_taxonomy/16s_dbs/silva/taxon_filters 05_validate_taxonomy/16s_dbs/silva/validation_results/silva_unclassified_genera_with_one_term.csv | cut -f 2 -d ";"  | sort -u > 05_validate_taxonomy/intermediate_files/silva_unclassified_genera_one_term_uniq.txt

grep -vFf 05_validate_taxonomy/16s_dbs/silva/taxon_filters 05_validate_taxonomy/16s_dbs/silva/validation_results/silva_unclassified_genera_with_two_terms.csv | cut -f 2 -d ";"  | sort -u | grep -iv "bacterium" > 05_validate_taxonomy/intermediate_files/silva_unclassified_genera_two_terms_uniq.txt


grep -vFf 05_validate_taxonomy/16s_dbs/silva/taxon_filters 05_validate_taxonomy/16s_dbs/silva/validation_results/silva_unclassified_species.csv | cut -f 3 -d ";" | cut -d " " -f 1,2  | sort -u | tr -d [ | tr -d ] | awk -F' ' 'NF==2{print}{}' | grep -viw "bacterium" | grep -ivw "symbiont" > 05_validate_taxonomy/intermediate_files/silva_unclassified_species_uniq.txt
