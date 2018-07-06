mkdir results; mkdir results/gg; mkdir results/silva; mkdir results/rdp; mkdir results/silva/silva_unclassified

# Greengenes

grep -wiFf coresets/valid_genera_coreset.txt gg/genera.csv > results/gg/gg_valid_genera.csv
grep -wiFf coresets/invalid_genera_coreset.txt gg/genera.csv > results/gg/gg_invalid_genera.csv
grep -vwiFf coresets/valid_genera_coreset.txt gg/genera.csv | grep -vwiFf coresets/invalid_genera_coreset.txt | grep -wiFf discrepancies/all_genera.txt > results/gg/gg_discrepancies_genera.csv
grep -vwiFf coresets/valid_genera_coreset.txt gg/genera.csv | grep -vwiFf coresets/invalid_genera_coreset.txt | grep -vwiFf discrepancies/all_genera.txt > results/gg/gg_unclassified_genera.csv


grep -wiFf coresets/valid_species_coreset.txt gg/species.csv > results/gg/gg_valid_species.csv
grep -wiFf coresets/invalid_species_coreset.txt gg/species.csv > results/gg/gg_invalid_species.csv
grep -vwiFf coresets/valid_species_coreset.txt gg/species.csv | grep -vwiFf coresets/invalid_species_coreset.txt | grep -wiFf discrepancies/all_species.txt > results/gg/gg_discrepancies_species.csv
grep -vwiFf coresets/valid_species_coreset.txt gg/species.csv | grep -vwiFf coresets/invalid_species_coreset.txt | grep -vwiFf discrepancies/all_species.txt > results/gg/gg_unclassified_species.csv

# RDP

grep -wiFf coresets/valid_genera_coreset.txt rdp/rdp_genera.csv > results/rdp/rdp_valid_genera.csv
grep -wiFf coresets/invalid_genera_coreset.txt rdp/rdp_genera.csv > results/rdp/rdp_invalid_genera.csv
grep -vwiFf coresets/valid_genera_coreset.txt rdp/rdp_genera.csv | grep -vwiFf coresets/invalid_genera_coreset.txt | grep -wiFf discrepancies/all_genera.txt > results/rdp/rdp_discrepancies_genera.csv
grep -vwiFf coresets/valid_genera_coreset.txt rdp/rdp_genera.csv | grep -vwiFf coresets/invalid_genera_coreset.txt | grep -vwiFf discrepancies/all_genera.txt > results/rdp/rdp_unclassified_genera.csv

# SILVA

grep -wiFf coresets/valid_genera_coreset.txt silva/genera.csv > results/silva/silva_valid_genera.csv
grep -wiFf coresets/invalid_genera_coreset.txt silva/genera.csv > results/silva/silva_invalid_genera.csv
grep -vwiFf coresets/valid_genera_coreset.txt silva/genera.csv | grep -vwiFf coresets/invalid_genera_coreset.txt | grep -wiFf discrepancies/all_genera.txt > results/silva/silva_discrepancies_genera.csv
grep -vwiFf coresets/valid_genera_coreset.txt silva/genera.csv | grep -vwiFf coresets/invalid_genera_coreset.txt | grep -vwiFf discrepancies/all_genera.txt > results/silva/silva_unclassified_genera.csv


grep -wiFf coresets/valid_species_coreset.txt silva/species.csv > results/silva/silva_valid_species.csv
grep -wiFf coresets/invalid_species_coreset.txt silva/species.csv > results/silva/silva_invalid_species.csv
grep -vwiFf coresets/valid_species_coreset.txt silva/species.csv | grep -vwiFf coresets/invalid_species_coreset.txt | grep -wiFf discrepancies/all_species.txt > results/silva/silva_discrepancies_species.csv
grep -vwiFf coresets/valid_species_coreset.txt silva/species.csv | grep -vwiFf coresets/invalid_species_coreset.txt | grep -vwiFf discrepancies/all_species.txt > results/silva/silva_unclassified_species.csv

grep -wiFf coresets/valid_species_coreset.txt silva/other_ranks.csv > results/silva/silva_valid_other_ranks.csv
grep -wiFf coresets/invalid_species_coreset.txt silva/other_ranks.csv > results/silva/silva_invalid_other_ranks.csv
grep -vwiFf coresets/valid_species_coreset.txt silva/other_ranks.csv | grep -vwiFf coresets/invalid_species_coreset.txt | grep -wiFf discrepancies/all_genera.txt > results/silva/silva_discrepancies_other_ranks.csv
grep -vwiFf coresets/valid_species_coreset.txt silva/other_ranks.csv | grep -vwiFf coresets/invalid_species_coreset.txt | grep -vwiFf discrepancies/all_genera.txt > results/silva/silva_unclassified_other_ranks.csv


# SILVA Unclassified Genera
# Note: The genus column has many names with 2 or more terms. Some of these are species names, strain designations. A separate analysis is performed below to recheck these.

cut -d " " -f 1,2 results/silva/silva_unclassified_genera.csv > results/silva/silva_unclassified/silva_unclassified_genera_first_two_terms.csv 
grep -wiFf coresets/valid_species_coreset.txt results/silva/silva_unclassified/silva_unclassified_genera_first_two_terms.csv > results/silva/silva_unclassified/silva_unclassified_genera_valid_species.csv
grep -wiFf coresets/invalid_species_coreset.txt results/silva/silva_unclassified/silva_unclassified_genera_first_two_terms.csv > results/silva/silva_unclassified/silva_unclassified_genera_invalid_species.csv

cut -d " " -f 1 results/silva/silva_unclassified_genera.csv > results/silva/silva_unclassified/silva_unclassified_genera_first_term.csv 
grep -wiFf coresets/valid_genera_coreset.txt results/silva/silva_unclassified/silva_unclassified_genera_first_term.csv > results/silva/silva_unclassified/silva_unclassified_genera_valid_genera.csv
grep -wiFf coresets/invalid_genera_coreset.txt results/silva/silva_unclassified/silva_unclassified_genera_first_term.csv > results/silva/silva_unclassified/silva_unclassified_genera_invalid_genera.csv


