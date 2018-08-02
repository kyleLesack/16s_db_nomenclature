# Check Greengenes
grep -i "mitochondria" 05_validate_taxonomy/16s_dbs/gg/taxonomy/gg_13_5_taxonomy.txt > 05_validate_taxonomy/results/organelles/gg_13_5_mitochondria.txt
grep -i "chloroplast" 05_validate_taxonomy/16s_dbs/gg/taxonomy/gg_13_5_taxonomy.txt > 05_validate_taxonomy/results/organelles/gg_13_5_chloroplasts.txt
# Check RDP
grep -i "chloroplast" 05_validate_taxonomy/16s_dbs/rdp/rdp_taxonomy.txt > 05_validate_taxonomy/results/organelles/rdp_chloroplasts.txt
# Check SILVA
grep -i "mitochondria" 05_validate_taxonomy/16s_dbs/silva/silva_taxonomy.txt > 05_validate_taxonomy/results/organelles/silva_mitochondria.txt
grep -i "chloroplast" 05_validate_taxonomy/16s_dbs/silva/silva_taxonomy.txt > 05_validate_taxonomy/results/organelles/silva_chloroplasts.txt

# Summarize results
date > ./05_validate_taxonomy/results/summary_organelles.txt

echo "\nMitochondria and chloroplasts categorized as bacteria or archaea" >> ./05_validate_taxonomy/results/summary_organelles.txt

echo -n "\nChloroplasts found in Greengenes: " >> ./05_validate_taxonomy/results/summary_organelles.txt
cat 05_validate_taxonomy/results/organelles/gg_13_5_chloroplasts.txt | wc -l >> ./05_validate_taxonomy/results/summary_organelles.txt
echo -n "Mitochondria found in Greengenes: " >> ./05_validate_taxonomy/results/summary_organelles.txt
cat 05_validate_taxonomy/results/organelles/gg_13_5_mitochondria.txt | wc -l >> ./05_validate_taxonomy/results/summary_organelles.txt

echo -n "\nChloroplasts found in RDP: " >> ./05_validate_taxonomy/results/summary_organelles.txt
cat 05_validate_taxonomy/results/organelles/rdp_chloroplasts.txt | wc -l >> ./05_validate_taxonomy/results/summary_organelles.txt

echo -n "\nChloroplasts found in SILVA: " >> ./05_validate_taxonomy/results/summary_organelles.txt
cat 05_validate_taxonomy/results/organelles/silva_chloroplasts.txt | wc -l >> ./05_validate_taxonomy/results/summary_organelles.txt
echo -n "Mitochondria found in SILVA: " >> ./05_validate_taxonomy/results/summary_organelles.txt
cat 05_validate_taxonomy/results/organelles/silva_mitochondria.txt | wc -l >> ./05_validate_taxonomy/results/summary_organelles.txt

echo "\n\nTaxize charactization of unclassified names by superkingdom" >> ./05_validate_taxonomy/results/summary_organelles.txt
