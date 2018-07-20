# Check Greengenes
grep -i "mitochondria" 05_validate_taxonomy/16s_dbs/gg/taxonomy/gg_13_5_taxonomy.txt > 05_validate_taxonomy/results/organelles/gg_13_5_mitochondria.txt
grep -i "chloroplast" 05_validate_taxonomy/16s_dbs/gg/taxonomy/gg_13_5_taxonomy.txt > 05_validate_taxonomy/results/organelles/gg_13_5_chloroplasts.txt
# Check RDP
grep -i "chloroplast" 05_validate_taxonomy/16s_dbs/rdp/rdp_taxonomy.txt > 05_validate_taxonomy/results/organelles/rdp_chloroplasts.txt
# Check SILVA
grep -i "mitochondria" 05_validate_taxonomy/16s_dbs/silva/silva_taxonomy.txt > 05_validate_taxonomy/results/organelles/silva_mitochondria.txt
grep -i "chloroplast" 05_validate_taxonomy/16s_dbs/silva/silva_taxonomy.txt > 05_validate_taxonomy/results/organelles/silva_chloroplasts.txt
