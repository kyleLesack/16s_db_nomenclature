# Greengenes

cat 04_validate_16s/results/gg/gg_discrepancies_genera.csv | cut -d "," -f2 | sort | uniq -c | sort -nr > 04_validate_16s/results/gg/summaries/gg_discrepancies_genera_counts.txt
cat 04_validate_16s/results/gg/gg_invalid_genera.csv | cut -d "," -f2 | sort | uniq -c | sort -nr > 04_validate_16s/results/gg/summaries/gg_invalid_genera_counts.txt
cat 04_validate_16s/results/gg/gg_unclassified_genera.csv | cut -d "," -f2 | sort | uniq -c | sort -nr > 04_validate_16s/results/gg/summaries/gg_unclassified_genera_counts.txt

cat 04_validate_16s/results/gg/gg_discrepancies_species.csv | cut -d "," -f2 | sort | uniq -c | sort -nr > 04_validate_16s/results/gg/summaries/gg_discrepancies_species_counts.txt
cat 04_validate_16s/results/gg/gg_invalid_species.csv | cut -d "," -f2 | sort | uniq -c | sort -nr > 04_validate_16s/results/gg/summaries/gg_invalid_species_counts.txt
cat 04_validate_16s/results/gg/gg_unclassified_species.csv | cut -d "," -f2 | sort | uniq -c | sort -nr > 04_validate_16s/results/gg/summaries/gg_unclassified_species_counts.txt


## Top Ten

cat 04_validate_16s/results/gg/gg_discrepancies_genera.csv | cut -d "," -f2 | sort | uniq -c | sort -nr | head -n 10  > 04_validate_16s/results/gg/summaries/gg_discrepancies_genera_topten.txt
cat 04_validate_16s/results/gg/gg_invalid_genera.csv | cut -d "," -f2 | sort | uniq -c | sort -nr | head -n 10  > 04_validate_16s/results/gg/summaries/gg_invalid_genera_topten.txt
cat 04_validate_16s/results/gg/gg_unclassified_genera.csv | cut -d "," -f2 | sort | uniq -c | sort -nr | head -n 10  > 04_validate_16s/results/gg/summaries/gg_unclassfied_genera_topten.txt

cat 04_validate_16s/results/gg/gg_discrepancies_species.csv | cut -d "," -f2 | sort | uniq -c | sort -nr | head -n 10  > 04_validate_16s/results/gg/summaries/gg_discrepancies_species_topten.txt
cat 04_validate_16s/results/gg/gg_invalid_species.csv | cut -d "," -f2 | sort | uniq -c | sort -nr | head -n 10  > 04_validate_16s/results/gg/summaries/gg_invalid_species_topten.txt
cat 04_validate_16s/results/gg/gg_unclassified_species.csv | cut -d "," -f2 | sort | uniq -c | sort -nr | head -n 10  > 04_validate_16s/results/gg/summaries/gg_unclassfied_species_topten.txt


# RDP

cat 04_validate_16s/results/rdp/rdp_discrepancies_genera.csv | cut -d "," -f2 | sort | uniq -c | sort -nr > 04_validate_16s/results/rdp/summaries/rdp_discrepancies_genera_counts.txt
cat 04_validate_16s/results/rdp/rdp_invalid_genera.csv | cut -d "," -f2 | sort | uniq -c | sort -nr > 04_validate_16s/results/rdp/summaries/rdp_invalid_genera_counts.txt
cat 04_validate_16s/results/rdp/rdp_unclassified_genera.csv | cut -d "," -f2 | sort | uniq -c | sort -nr > 04_validate_16s/results/rdp/summaries/rdp_unclassified_genera_counts.txt

## Top Ten

cat 04_validate_16s/results/rdp/rdp_discrepancies_genera.csv | cut -d "," -f2 | sort | uniq -c | sort -nr | head -n 10  > 04_validate_16s/results/rdp/summaries/rdp_discrepancies_genera_topten.txt
cat 04_validate_16s/results/rdp/rdp_invalid_genera.csv | cut -d "," -f2 | sort | uniq -c | sort -nr | head -n 10  > 04_validate_16s/results/rdp/summaries/rdp_invalid_genera_topten.txt
cat 04_validate_16s/results/rdp/rdp_unclassified_genera.csv | cut -d "," -f2 | sort | uniq -c | sort -nr | head -n 10  > 04_validate_16s/results/rdp/summaries/rdp_unclassfied_genera_topten.txt

# SILVA

cat 04_validate_16s/results/silva/silva_discrepancies_genera.csv | cut -d "," -f2 | sort | uniq -c | sort -nr > 04_validate_16s/results/silva/summaries/silva_discrepancies_genera_counts.txt
cat 04_validate_16s/results/silva/silva_invalid_genera.csv | cut -d "," -f2 | sort | uniq -c | sort -nr > 04_validate_16s/results/silva/summaries/silva_invalid_genera_counts.txt
cat 04_validate_16s/results/silva/silva_unclassified_genera.csv | cut -d "," -f2 | sort | uniq -c | sort -nr > 04_validate_16s/results/silva/summaries/silva_unclassified_genera_counts.txt

cat 04_validate_16s/results/silva/silva_discrepancies_species.csv | cut -d "," -f2 | sort | uniq -c | sort -nr > 04_validate_16s/results/silva/summaries/silva_discrepancies_species_counts.txt
cat 04_validate_16s/results/silva/silva_invalid_species.csv | cut -d "," -f2 | sort | uniq -c | sort -nr > 04_validate_16s/results/silva/summaries/silva_invalid_species_counts.txt
cat 04_validate_16s/results/silva/silva_unclassified_species.csv | cut -d "," -f2 | sort | uniq -c | sort -nr > 04_validate_16s/results/silva/summaries/silva_unclassified_species_counts.txt


## Top Ten

cat 04_validate_16s/results/silva/silva_discrepancies_genera.csv | cut -d "," -f2 | sort | uniq -c | sort -nr | head -n 10  > 04_validate_16s/results/silva/summaries/silva_discrepancies_genera_topten.txt
cat 04_validate_16s/results/silva/silva_invalid_genera.csv | cut -d "," -f2 | sort | uniq -c | sort -nr | head -n 10  > 04_validate_16s/results/silva/summaries/silva_invalid_genera_topten.txt
cat 04_validate_16s/results/silva/silva_unclassified_genera.csv | cut -d "," -f2 | sort | uniq -c | sort -nr | head -n 10  > 04_validate_16s/results/silva/summaries/silva_unclassfied_genera_topten.txt

cat 04_validate_16s/results/silva/silva_discrepancies_species.csv | cut -d "," -f2 | sort | uniq -c | sort -nr | head -n 10  > 04_validate_16s/results/silva/summaries/silva_discrepancies_species_topten.txt
cat 04_validate_16s/results/silva/silva_invalid_species.csv | cut -d "," -f2 | sort | uniq -c | sort -nr | head -n 10  > 04_validate_16s/results/silva/summaries/silva_invalid_species_topten.txt
cat 04_validate_16s/results/silva/silva_unclassified_species.csv | cut -d "," -f2 | sort | uniq -c | sort -nr | head -n 10  > 04_validate_16s/results/silva/summaries/silva_unclassfied_species_topten.txt


