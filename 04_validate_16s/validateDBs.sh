mkdir 04_validate_16s/results; mkdir 04_validate_16s/results/gg; mkdir 04_validate_16s/results/silva; mkdir 04_validate_16s/results/rdp; mkdir 04_validate_16s/results/silva/silva_unclassified

# Greengenes

grep -wiFf 04_validate_16s/coresets/valid_genera_coreset.txt 04_validate_16s/16s_dbs/gg/genera.csv > 04_validate_16s/results/gg/gg_valid_genera.csv
grep -wiFf 04_validate_16s/coresets/invalid_genera_coreset.txt 04_validate_16s/16s_dbs/gg/genera.csv > 04_validate_16s/results/gg/gg_invalid_genera.csv

# Find nomenclature that isn't in valid or invalid lists. Categorized as discrepancies between LPSN and UpToDate or unclassifiable

grep -vwiFf 04_validate_16s/coresets/valid_genera_coreset.txt 04_validate_16s/16s_dbs/gg/genera.csv | grep -vwiFf 04_validate_16s/coresets/invalid_genera_coreset.txt | grep -wiFf 04_validate_16s/discrepancies/all_genera_final.txt > 04_validate_16s/results/gg/gg_discrepancies_genera.csv
grep -vwiFf 04_validate_16s/coresets/valid_genera_coreset.txt 04_validate_16s/16s_dbs/gg/genera.csv | grep -vwiFf 04_validate_16s/coresets/invalid_genera_coreset.txt | grep -vwiFf 04_validate_16s/discrepancies/all_genera_final.txt > 04_validate_16s/results/gg/gg_unclassified_genera.csv


grep -wiFf 04_validate_16s/coresets/valid_species_coreset.txt 04_validate_16s/16s_dbs/gg/species.csv > 04_validate_16s/results/gg/gg_valid_species.csv
grep -wiFf 04_validate_16s/coresets/invalid_species_coreset.txt 04_validate_16s/16s_dbs/gg/species.csv > 04_validate_16s/results/gg/gg_invalid_species.csv

# Find nomenclature that isn't in valid or invalid lists. Categorized as discrepancies between LPSN and UpToDate or unclassifiable
grep -vwiFf 04_validate_16s/coresets/valid_species_coreset.txt 04_validate_16s/16s_dbs/gg/species.csv | grep -vwiFf 04_validate_16s/coresets/invalid_species_coreset.txt | grep -wiFf 04_validate_16s/discrepancies/all_species_final.txt > 04_validate_16s/results/gg/gg_discrepancies_species.csv
grep -vwiFf 04_validate_16s/coresets/valid_species_coreset.txt 04_validate_16s/16s_dbs/gg/species.csv | grep -vwiFf 04_validate_16s/coresets/invalid_species_coreset.txt | grep -vwiFf 04_validate_16s/discrepancies/all_species_final.txt > 04_validate_16s/results/gg/gg_unclassified_species.csv

# RDP

grep -wiFf 04_validate_16s/coresets/valid_genera_coreset.txt 04_validate_16s/16s_dbs/rdp/rdp_genera.csv > 04_validate_16s/results/rdp/rdp_valid_genera.csv
grep -wiFf 04_validate_16s/coresets/invalid_genera_coreset.txt 04_validate_16s/16s_dbs/rdp/rdp_genera.csv > 04_validate_16s/results/rdp/rdp_invalid_genera.csv

# Find nomenclature that isn't in valid or invalid lists. Categorized as discrepancies between LPSN and UpToDate or unclassifiable
grep -vwiFf 04_validate_16s/coresets/valid_genera_coreset.txt 04_validate_16s/16s_dbs/rdp/rdp_genera.csv | grep -vwiFf 04_validate_16s/coresets/invalid_genera_coreset.txt | grep -wiFf 04_validate_16s/discrepancies/all_genera_final.txt > 04_validate_16s/results/rdp/rdp_discrepancies_genera.csv
grep -vwiFf 04_validate_16s/coresets/valid_genera_coreset.txt 04_validate_16s/16s_dbs/rdp/rdp_genera.csv | grep -vwiFf 04_validate_16s/coresets/invalid_genera_coreset.txt | grep -vwiFf 04_validate_16s/discrepancies/all_genera_final.txt > 04_validate_16s/results/rdp/rdp_unclassified_genera.csv

# SILVA

grep -wiFf 04_validate_16s/coresets/valid_genera_coreset.txt  04_validate_16s/16s_dbs/silva/silva_genera.csv > 04_validate_16s/results/silva/silva_valid_genera.csv
grep -wiFf 04_validate_16s/coresets/invalid_genera_coreset.txt  04_validate_16s/16s_dbs/silva/silva_genera.csv > 04_validate_16s/results/silva/silva_invalid_genera.csv

# Find nomenclature that isn't in valid or invalid lists. Categorized as discrepancies between LPSN and UpToDate or unclassifiable
grep -vwiFf 04_validate_16s/coresets/valid_genera_coreset.txt  04_validate_16s/16s_dbs/silva/silva_genera.csv | grep -vwiFf 04_validate_16s/coresets/invalid_genera_coreset.txt | grep -wiFf 04_validate_16s/discrepancies/all_genera_final.txt > 04_validate_16s/results/silva/silva_discrepancies_genera.csv
grep -vwiFf 04_validate_16s/coresets/valid_genera_coreset.txt  04_validate_16s/16s_dbs/silva/silva_genera.csv | grep -vwiFf 04_validate_16s/coresets/invalid_genera_coreset.txt | grep -vwiFf 04_validate_16s/discrepancies/all_genera_final.txt > 04_validate_16s/results/silva/silva_unclassified_genera.csv


grep -wiFf 04_validate_16s/coresets/valid_species_coreset.txt  04_validate_16s/16s_dbs/silva/silva_species.csv > 04_validate_16s/results/silva/silva_valid_species.csv
grep -wiFf 04_validate_16s/coresets/invalid_species_coreset.txt  04_validate_16s/16s_dbs/silva/silva_species.csv > 04_validate_16s/results/silva/silva_invalid_species.csv
# Find nomenclature that isn't in valid or invalid lists. Categorized as discrepancies between LPSN and UpToDate or unclassifiable
grep -vwiFf 04_validate_16s/coresets/valid_species_coreset.txt  04_validate_16s/16s_dbs/silva/silva_species.csv | grep -vwiFf 04_validate_16s/coresets/invalid_species_coreset.txt | grep -wiFf 04_validate_16s/discrepancies/all_species_final.txt > 04_validate_16s/results/silva/silva_discrepancies_species.csv
grep -vwiFf 04_validate_16s/coresets/valid_species_coreset.txt  04_validate_16s/16s_dbs/silva/silva_species.csv | grep -vwiFf 04_validate_16s/coresets/invalid_species_coreset.txt | grep -vwiFf 04_validate_16s/discrepancies/all_species_final.txt > 04_validate_16s/results/silva/silva_unclassified_species.csv


# SILVA Unclassified Genera
# Note: The genus column has many names with 2 or more terms. Some of these are species names, strain designations, etc. A separate analysis is performed below to recheck these.

cut -d " " -f 1,2 04_validate_16s/results/silva/silva_unclassified_genera.csv | awk -F' ' 'NF==2{print}{}'  > 04_validate_16s/results/silva/silva_unclassified/silva_unclassified_genera_with_two_terms.csv 
grep -wiFf 04_validate_16s/coresets/valid_species_coreset.txt 04_validate_16s/results/silva/silva_unclassified/silva_unclassified_genera_with_two_terms.csv > 04_validate_16s/results/silva/silva_unclassified/silva_unclassified_genera_valid_species.csv
grep -wiFf 04_validate_16s/coresets/invalid_species_coreset.txt 04_validate_16s/results/silva/silva_unclassified/silva_unclassified_genera_with_two_terms.csv > 04_validate_16s/results/silva/silva_unclassified/silva_unclassified_genera_invalid_species.csv


# Knowing which unclassifed genera have only one term will be used later to check if these are non-prokaryotic genera
cut -d " " -f 1,2 04_validate_16s/results/silva/silva_unclassified_genera.csv | awk -F' ' 'NF==1{print}{}'  > 04_validate_16s/results/silva/silva_unclassified/silva_unclassified_genera_with_one_term.csv 


# Look for invalid/valid species names in SILVA sequences that only contained annotations to the genus level (many species names were observed there)
#grep -wiFf 04_validate_16s/coresets/valid_species_coreset.txt silva/other_ranks.csv > 04_validate_16s/results/silva/silva_valid_other_ranks.csv
#grep -wiFf 04_validate_16s/coresets/invalid_species_coreset.txt silva/other_ranks.csv > 04_validate_16s/results/silva/silva_invalid_other_ranks.csv

# Find nomenclature that isn't in valid or invalid lists. Categorized as discrepancies between LPSN and UpToDate or unclassifiable
#grep -vwiFf 04_validate_16s/coresets/valid_species_coreset.txt silva/other_ranks.csv | grep -vwiFf 04_validate_16s/coresets/invalid_species_coreset.txt | grep -wiFf 04_validate_16s/discrepancies/all_genera_final.txt > 04_validate_16s/results/silva/silva_discrepancies_other_ranks.csv
#grep -vwiFf 04_validate_16s/coresets/valid_species_coreset.txt silva/other_ranks.csv | grep -vwiFf 04_validate_16s/coresets/invalid_species_coreset.txt | grep -vwiFf 04_validate_16s/discrepancies/all_genera_final.txt > 04_validate_16s/results/silva/silva_unclassified_other_ranks.csv


