cat 02_uptodate/output/genera.txt | sort -u > 02_uptodate/output/genera_final.txt
cat 02_uptodate/output/species.txt | sort -u | grep "subsp." > 02_uptodate/output/subspecies_final.txt
cat 02_uptodate/output/species.txt | sort -u | grep -v "subsp." > 02_uptodate/output/species_final.txt
cat 02_uptodate/output/reclassified.txt | sort -u > 02_uptodate/output/reclassified_final.txt
mv 02_uptodate/output/*final.txt 02_uptodate/output/final
