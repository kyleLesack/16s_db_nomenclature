grep -vFf 03_coresets/manual_changes/remove_from_genus_discrepancies.txt 03_coresets/output/discrepancies/all_genera.txt > 03_coresets/output/discrepancies/final/all_genera_final.txt
grep -vFf 03_coresets/manual_changes/remove_from_species_discrepancies.txt 03_coresets/output/discrepancies/all_species.txt > 03_coresets/output/discrepancies/final/all_species_final.txt


cat 03_coresets/manual_changes/remove_from_genus_discrepancies.txt 03_coresets/output/final/invalid_genera_coreset.txt | sort -u  > tmp
mv tmp 03_coresets/output/final/invalid_genera_coreset.txt

cat 03_coresets/manual_changes/remove_from_species_discrepancies.txt 03_coresets/output/final/invalid_species_coreset.txt | sort -u  > tmp
mv tmp 03_coresets/output/final/invalid_species_coreset.txt


