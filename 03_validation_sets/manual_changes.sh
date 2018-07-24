# Remove known invalid names (that were miscategorized) from discrepancy files
grep -vFf 03_coresets/manual_changes/remove_from_genus_discrepancies.txt 03_coresets/output/discrepancies/all_genera.txt > 03_coresets/output/discrepancies/final/all_genera_final.txt
grep -vFf 03_coresets/manual_changes/remove_from_species_discrepancies.txt 03_coresets/output/discrepancies/all_species.txt > 03_coresets/output/discrepancies/final/all_species_final.txt

# Add known invalid names (that were miscategorizedas discrepancies) to invalid files
cat 03_coresets/manual_changes/remove_from_genus_discrepancies.txt 03_coresets/output/final/invalid_genera_coreset.txt | sort -u  > tmp
mv tmp 03_coresets/output/final/invalid_genera_coreset.txt

cat 03_coresets/manual_changes/remove_from_species_discrepancies.txt 03_coresets/output/final/invalid_species_coreset.txt | sort -u  > tmp
mv tmp 03_coresets/output/final/invalid_species_coreset.txt

# Remove illeg. string from invalid species coreset
sed -e "s/ (illeg.)//g" -i 03_coresets/output/final/invalid_species_coreset.txt

# Fix errors in valid species list
grep -vFxf 03_coresets/manual_changes/remove_from_valid_species_coreset.txt 03_coresets/output/final/valid_species_coreset.txt > tmp
mv tmp 03_coresets/output/final/valid_species_coreset.txt
echo "Pseudochrobactrum lubricantis" | sort -o 03_coresets/output/final/valid_species_coreset.txt - 03_coresets/output/final/valid_species_coreset.txt



