# Compare valid genera
grep -iwFf ./03_validation_sets/up2date/genera_final.txt ./03_validation_sets/lpsn/genera_total.txt > ./03_validation_sets/setComparison/valid_genera_lpsn_up2date_intersection.txt
grep -iwvFf ./03_validation_sets/up2date/genera_final.txt ./03_validation_sets/lpsn/genera_total.txt > ./03_validation_sets/setComparison/valid_genera_set_element_lpsn_only.txt
grep -iwvFf ./03_validation_sets/lpsn/genera_total.txt ./03_validation_sets/up2date/genera_final.txt > ./03_validation_sets/setComparison/valid_genera_set_element_up2date_only.txt

# Compare invalid genera
grep -iwFf ./03_validation_sets/up2date/invalid_genera_names.txt ./03_validation_sets/lpsn/invalid_genus.txt > ./03_validation_sets/setComparison/invalid_genera_lpsn_up2date_intersection.txt
grep -iwvFf ./03_validation_sets/up2date/invalid_genera_names.txt ./03_validation_sets/lpsn/invalid_genus.txt > ./03_validation_sets/setComparison/invalid_genera_lpsn_set_element_only.txt
grep -iwvFf ./03_validation_sets/lpsn/invalid_genus.txt ./03_validation_sets/up2date/invalid_genera_names.txt > ./03_validation_sets/setComparison/invalid_genera_up2date_set_element_only.txt

# Compare valid species
grep -iwFf ./03_validation_sets/up2date/species_final.txt ./03_validation_sets/lpsn/species_total.txt > ./03_validation_sets/setComparison/valid_species_lpsn_up2date_intersection.txt
grep -iwvFf ./03_validation_sets/up2date/species_final.txt ./03_validation_sets/lpsn/species_total.txt > ./03_validation_sets/setComparison/valid_species_set_element_lpsn_only.txt
grep -iwvFf ./03_validation_sets/lpsn/species_total.txt ./03_validation_sets/up2date/species_final.txt > ./03_validation_sets/setComparison/valid_species_set_element_up2date_only.txt

# Compare invalid species
grep -iwFf ./03_validation_sets/up2date/invalid_species_names.txt ./03_validation_sets/lpsn/invalid_species.txt > ./03_validation_sets/setComparison/invalid_species_lpsn_up2date_intersection.txt
grep -iwvFf ./03_validation_sets/up2date/invalid_species_names.txt ./03_validation_sets/lpsn/invalid_species.txt > ./03_validation_sets/setComparison/invalid_species_set_element_lpsn_only.txt
grep -iwvFf ./03_validation_sets/lpsn/invalid_species.txt ./03_validation_sets/up2date/invalid_species_names.txt > ./03_validation_sets/setComparison/invalid_species_set_element_up2date_only.txt


# Summarize Results

date > ./03_validation_sets/setComparison/summary.txt
echo "Valid genera comparison\n" >> ./03_validation_sets/setComparison/summary.txt
echo -n "Intersection of valid genera in LPSN and Up-to-date: "  >> ./03_validation_sets/setComparison/summary.txt
cat ./03_validation_sets/setComparison/valid_genera_lpsn_up2date_intersection.txt | wc -l  >> ./03_validation_sets/setComparison/summary.txt
echo -n "Valid genera in LPSN only: " >> ./03_validation_sets/setComparison/summary.txt
cat ./03_validation_sets/setComparison/valid_genera_set_element_lpsn_only.txt | wc -l >> ./03_validation_sets/setComparison/summary.txt
echo -n "Valid genera in Up-to-date only: " >> ./03_validation_sets/setComparison/summary.txt
cat ./03_validation_sets/setComparison/valid_genera_set_element_up2date_only.txt | wc -l >> ./03_validation_sets/setComparison/summary.txt

echo "\n\nInvalid genera comparison\n" >> ./03_validation_sets/setComparison/summary.txt
echo -n "Intersection of invalid genera in LPSN and Up-to-date: "  >> ./03_validation_sets/setComparison/summary.txt
cat ./03_validation_sets/setComparison/invalid_genera_lpsn_up2date_intersection.txt | wc -l  >> ./03_validation_sets/setComparison/summary.txt
echo -n "Invalid genera in LPSN only: " >> ./03_validation_sets/setComparison/summary.txt
cat ./03_validation_sets/setComparison/invalid_genera_lpsn_set_element_only.txt | wc -l >> ./03_validation_sets/setComparison/summary.txt
echo -n "Invalid genera in Up-to-date only: " >> ./03_validation_sets/setComparison/summary.txt
cat ./03_validation_sets/setComparison/invalid_genera_up2date_set_element_only.txt | wc -l >> ./03_validation_sets/setComparison/summary.txt

echo "\n\nValid species comparison\n" >> ./03_validation_sets/setComparison/summary.txt
echo -n "Intersection of valid species in LPSN and Up-to-date: "  >> ./03_validation_sets/setComparison/summary.txt
cat ./03_validation_sets/setComparison/valid_species_lpsn_up2date_intersection.txt | wc -l  >> ./03_validation_sets/setComparison/summary.txt
echo -n "Valid species in LPSN only: " >> ./03_validation_sets/setComparison/summary.txt
cat ./03_validation_sets/setComparison/valid_species_set_element_lpsn_only.txt | wc -l >> ./03_validation_sets/setComparison/summary.txt
echo -n "Valid species in Up-to-date only: " >> ./03_validation_sets/setComparison/summary.txt
cat ./03_validation_sets/setComparison/valid_species_set_element_up2date_only.txt | wc -l >> ./03_validation_sets/setComparison/summary.txt

echo "\n\nInvalid species comparison\n" >> ./03_validation_sets/setComparison/summary.txt
echo -n "Intersection of invalid species in LPSN and Up-to-date: "  >> ./03_validation_sets/setComparison/summary.txt
cat ./03_validation_sets/setComparison/invalid_species_lpsn_up2date_intersection.txt | wc -l  >> ./03_validation_sets/setComparison/summary.txt
echo -n "Invalid species in LPSN only: " >> ./03_validation_sets/setComparison/summary.txt
cat ./03_validation_sets/setComparison/invalid_species_set_element_lpsn_only.txt | wc -l >> ./03_validation_sets/setComparison/summary.txt
echo -n "Invalid species in Up-to-date only: " >> ./03_validation_sets/setComparison/summary.txt
cat ./03_validation_sets/setComparison/invalid_species_set_element_up2date_only.txt | wc -l >> ./03_validation_sets/setComparison/summary.txt


