date > ./05_validate_taxonomy/results/summary.txt

echo "\nMitochondria and chloroplasts categorized as bacteria or archaea" >> ./05_validate_taxonomy/results/summary.txt

echo -n "\nChloroplasts found in Greengenes: " >> ./05_validate_taxonomy/results/summary.txt
cat 05_validate_taxonomy/results/organelles/gg_13_5_chloroplasts.txt | wc -l >> ./05_validate_taxonomy/results/summary.txt
echo -n "Mitochondria found in Greengenes: " >> ./05_validate_taxonomy/results/summary.txt
cat 05_validate_taxonomy/results/organelles/gg_13_5_mitochondria.txt | wc -l >> ./05_validate_taxonomy/results/summary.txt

echo -n "\nChloroplasts found in RDP: " >> ./05_validate_taxonomy/results/summary.txt
cat 05_validate_taxonomy/results/organelles/rdp_chloroplasts.txt | wc -l >> ./05_validate_taxonomy/results/summary.txt

echo -n "\nChloroplasts found in SILVA: " >> ./05_validate_taxonomy/results/summary.txt
cat 05_validate_taxonomy/results/organelles/silva_chloroplasts.txt | wc -l >> ./05_validate_taxonomy/results/summary.txt
echo -n "Mitochondria found in SILVA: " >> ./05_validate_taxonomy/results/summary.txt
cat 05_validate_taxonomy/results/organelles/silva_mitochondria.txt | wc -l >> ./05_validate_taxonomy/results/summary.txt

echo "\n\nTaxize charactization of unclassified names by superkingdom" >> ./05_validate_taxonomy/results/summary.txt


echo "\nUnclassified genera in Greengenes" >>./05_validate_taxonomy/results/summary.txt
tail -n +2 ./05_validate_taxonomy/results/taxize/gg_genera_superkingdoms.txt | cut -d "," -f4 | sort | uniq -c | sort -n >> ./05_validate_taxonomy/results/summary.txt
echo "\nUnclassified species in Greengenes" >>./05_validate_taxonomy/results/summary.txt
tail -n +2 ./05_validate_taxonomy/results/taxize/gg_species_superkingdoms.txt | cut -d "," -f4 | sort | uniq -c | sort -n >> ./05_validate_taxonomy/results/summary.txt

echo "\nUnclassified genera in RDP" >>./05_validate_taxonomy/results/summary.txt
tail -n +2 ./05_validate_taxonomy/results/taxize/rdp_genera_superkingdoms.txt | cut -d "," -f4 | sort | uniq -c | sort -n >> ./05_validate_taxonomy/results/summary.txt

echo "\nUnclassified genera in SILVA" >>./05_validate_taxonomy/results/summary.txt
tail -n +2 ./05_validate_taxonomy/results/taxize/silva_genera_superkingdoms.txt | cut -d "," -f4 | sort | uniq -c | sort -n >> ./05_validate_taxonomy/results/summary.txt
echo "\nUnclassified genera in SILVA, for genus annotations containing 2 or more terms" >>./05_validate_taxonomy/results/summary.txt # Some species annotations were noticed in the genus annotations
tail -n +2 ./05_validate_taxonomy/results/taxize/silva_genera_two_terms_superkingdoms.txt | cut -d "," -f4 | sort | uniq -c | sort -n >> ./05_validate_taxonomy/results/summary.txt
echo "\nUnclassified species in SILVA" >>./05_validate_taxonomy/results/summary.txt
tail -n +2 ./05_validate_taxonomy/results/taxize/silva_species_superkingdoms.txt | cut -d "," -f4 | sort | uniq -c | sort -n >> ./05_validate_taxonomy/results/summary.txt


       
