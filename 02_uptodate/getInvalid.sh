awk 'BEGIN {FS="\t"};$5~/orthographically incorrect name/' 02_uptodate/DSMZ_bactnames.tsv > 02_uptodate/output/orthographically_incorrect_name.tsv
awk 'BEGIN {FS="\t"};$5~/illegitimate name/' 02_uptodate/DSMZ_bactnames.tsv > 02_uptodate/output/illegitimate_name.tsv
awk 'BEGIN {FS="\t"};$5~/rejected name/' 02_uptodate/DSMZ_bactnames.tsv > 02_uptodate/output/rejected_name.tsv

cat 02_uptodate/output/orthographically_incorrect_name.tsv 02_uptodate/output/illegitimate_name.tsv 02_uptodate/output/rejected_name.tsv | sort -u > 02_uptodate/output/invalid_total.tsv
cat 02_uptodate/output/invalid_total.tsv | cut -f 1-3 > 02_uptodate/output/invalid_total_names_only.tsv


awk 'BEGIN {FS="\t"};$3=="" && $2==""' 02_uptodate/output/invalid_total_names_only.tsv > 02_uptodate/output/final/invalid_genera_names.txt
awk 'BEGIN {FS="\t"};$3=="" && $2!=""' 02_uptodate/output/invalid_total_names_only.tsv |  tr '\t' ' ' > 02_uptodate/output/final/invalid_species_names.txt
awk 'BEGIN {FS="\t"};$3!=""' 02_uptodate/output/invalid_total_names_only.tsv |  tr '\t' ' ' > 02_uptodate/output/final/invalid_subspecies_names.txt


