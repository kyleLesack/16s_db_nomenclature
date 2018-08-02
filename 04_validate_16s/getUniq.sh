cat 04_validate_16s/results/gg/gg_unclassified_genera.csv | cut -f2 -d "," | sort -u > 04_validate_16s/results/gg/unique/gg_unclassified_genera_uniq.csv
cat 04_validate_16s/results/gg/gg_unclassified_species.csv | cut -f2 -d "," | sort -u > 04_validate_16s/results/gg/unique/gg_unclassified_species_uniq.csv

cat 04_validate_16s/results/rdp/rdp_unclassified_genera.csv | cut -d "," -f2 | sort -u > 04_validate_16s/results/rdp/unique/rdp_unclassified_genera_uniq.csv

cat 04_validate_16s/results/silva/silva_unclassified/silva_unclassified_genera_with_one_term.csv | cut -d ";" -f2 | sort -u > 04_validate_16s/results/silva/silva_unclassified/unique/silva_unclassified_genera_with_one_term_uniq.csv
cat 04_validate_16s/results/silva/silva_unclassified/silva_unclassified_genera_with_two_terms.csv | cut -d ";" -f2 | sort -u > 04_validate_16s/results/silva/silva_unclassified/unique/silva_unclassified_genera_with_two_terms_uniq.csv

cat 04_validate_16s/results/silva/silva_unclassified_species.csv | cut -f 2 -d ";" | cut -d " " -f1,2 | sort -u > 04_validate_16s/results/silva/silva_unclassified/unique/silva_unclassified_species_uniq.csv

