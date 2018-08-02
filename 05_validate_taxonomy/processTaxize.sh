# Greengenes

# Obtain the taxon names that mapped to viruses or eukaryotes from Taxize
tail -n +2 05_validate_taxonomy/results/taxize/non_prokaryotes/gg_genera_superkingdoms_non_prokaryotes.txt | grep "Viruses" |  cut -d "," -f 3 | tr -d '"'  > 05_validate_taxonomy/results/taxize/non_prokaryotes/gg/gg_genera_viruses_taxa.txt
tail -n +2 05_validate_taxonomy/results/taxize/non_prokaryotes/gg_genera_superkingdoms_non_prokaryotes.txt | grep "Eukaryota" | cut -d "," -f 3 | tr -d '"'  > 05_validate_taxonomy/results/taxize/non_prokaryotes/gg/gg_genera_eukaryota_taxa.txt

tail -n +2 05_validate_taxonomy/results/taxize/non_prokaryotes/gg_species_superkingdoms_non_prokaryotes.txt | grep "Viruses" | cut -d "," -f 3 | tr -d '"'  > 05_validate_taxonomy/results/taxize/non_prokaryotes/gg/gg_species_viruses_taxa.txt
tail -n +2 05_validate_taxonomy/results/taxize/non_prokaryotes/gg_species_superkingdoms_non_prokaryotes.txt | grep "Eukaryota" | cut -d "," -f 3 | tr -d '"'  > 05_validate_taxonomy/results/taxize/non_prokaryotes/gg/gg_species_eukaryota_taxa.txt



# Obtain the GG records containing non-prokaryote taxa
grep -wFf 05_validate_taxonomy/results/taxize/non_prokaryotes/gg/gg_genera_viruses_taxa.txt 05_validate_taxonomy/16s_dbs/gg/validation_results/gg_unclassified_genera.csv > 05_validate_taxonomy/results/taxize/non_prokaryotes/gg/gg_genera_viruses_records.txt

grep -wFf 05_validate_taxonomy/results/taxize/non_prokaryotes/gg/gg_genera_eukaryota_taxa.txt 05_validate_taxonomy/16s_dbs/gg/validation_results/gg_unclassified_genera.csv > 05_validate_taxonomy/results/taxize/non_prokaryotes/gg/gg_genera_eukaryota_records.txt

grep -wFf 05_validate_taxonomy/results/taxize/non_prokaryotes/gg/gg_genera_viruses_taxa.txt 05_validate_taxonomy/16s_dbs/gg/validation_results/gg_unclassified_species.csv > 05_validate_taxonomy/results/taxize/non_prokaryotes/gg/gg_species_viruses_records.txt

grep -wFf 05_validate_taxonomy/results/taxize/non_prokaryotes/gg/gg_genera_eukaryota_taxa.txt 05_validate_taxonomy/16s_dbs/gg/validation_results/gg_unclassified_species.csv > 05_validate_taxonomy/results/taxize/non_prokaryotes/gg/gg_species_eukaryota_records.txt


# RDP

# Obtain the taxon names that mapped to viruses or eukaryotes from Taxize
tail -n +2 05_validate_taxonomy/results/taxize/non_prokaryotes/rdp_genera_superkingdoms_non_prokaryotes.txt | grep "Viruses" |  cut -d "," -f 3 | tr -d '"'  > 05_validate_taxonomy/results/taxize/non_prokaryotes/rdp/rdp_genera_viruses_taxa.txt

tail -n +2 05_validate_taxonomy/results/taxize/non_prokaryotes/rdp_genera_superkingdoms_non_prokaryotes.txt | grep "Eukaryota" | cut -d "," -f 3 | tr -d '"'  > 05_validate_taxonomy/results/taxize/non_prokaryotes/rdp/rdp_genera_eukaryota_taxa.txt


# Obtain the RDP records containing non-prokaryote taxa
grep -wFf 05_validate_taxonomy/results/taxize/non_prokaryotes/rdp/rdp_genera_viruses_taxa.txt 05_validate_taxonomy/16s_dbs/rdp/validation_results/rdp_unclassified_genera.csv > 05_validate_taxonomy/results/taxize/non_prokaryotes/rdp/rdp_genera_viruses_records.txt

grep -wFf 05_validate_taxonomy/results/taxize/non_prokaryotes/rdp/rdp_genera_eukaryota_taxa.txt 05_validate_taxonomy/16s_dbs/rdp/validation_results/rdp_unclassified_genera.csv > 05_validate_taxonomy/results/taxize/non_prokaryotes/rdp/rdp_genera_eukaryota_records.txt

# SILVA

# Obtain the taxon names that mapped to viruses or eukaryotes from Taxize
tail -n +2 05_validate_taxonomy/results/taxize/non_prokaryotes/silva_genera_superkingdoms_non_prokaryotes.txt | grep "Viruses" |  cut -d "," -f 3 | tr -d '"'  > 05_validate_taxonomy/results/taxize/non_prokaryotes/silva/silva_genera_one_term_viruses_taxa.txt
tail -n +2 05_validate_taxonomy/results/taxize/non_prokaryotes/silva_genera_superkingdoms_non_prokaryotes.txt | grep "Eukaryota" | cut -d "," -f 3 | tr -d '"'  > 05_validate_taxonomy/results/taxize/non_prokaryotes/silva/silva_genera_one_term_eukaryota_taxa.txt

tail -n +2 05_validate_taxonomy/results/taxize/non_prokaryotes/silva_genera_two_terms_superkingdoms_non_prokaryotes.txt | grep "Viruses" |  cut -d "," -f 3 | tr -d '"'  > 05_validate_taxonomy/results/taxize/non_prokaryotes/silva/silva_genera_two_terms_viruses_taxa.txt
tail -n +2 05_validate_taxonomy/results/taxize/non_prokaryotes/silva_genera_two_terms_superkingdoms_non_prokaryotes.txt | grep "Eukaryota" | cut -d "," -f 3 | tr -d '"'  > 05_validate_taxonomy/results/taxize/non_prokaryotes/silva/silva_genera_two_terms_eukaryota_taxa.txt

tail -n +2 05_validate_taxonomy/results/taxize/non_prokaryotes/silva_species_superkingdoms_non_prokaryotes.txt | grep "Viruses" | cut -d "," -f 3 | tr -d '"'  > 05_validate_taxonomy/results/taxize/non_prokaryotes/silva/silva_species_viruses_taxa.txt
tail -n +2 05_validate_taxonomy/results/taxize/non_prokaryotes/silva_species_superkingdoms_non_prokaryotes.txt | grep "Eukaryota" | cut -d "," -f 3 | tr -d '"'  > 05_validate_taxonomy/results/taxize/non_prokaryotes/silva/silva_species_eukaryota_taxa.txt


# Obtain the SILVA records containing non-prokaryote taxa
grep -wFf 05_validate_taxonomy/results/taxize/non_prokaryotes/silva/silva_genera_one_term_viruses_taxa.txt 05_validate_taxonomy/16s_dbs/silva/validation_results/silva_unclassified_genera_with_one_term.csv > 05_validate_taxonomy/results/taxize/non_prokaryotes/silva/silva_genera_one_term_viruses_records.txt

grep -wFf 05_validate_taxonomy/results/taxize/non_prokaryotes/silva/silva_genera_one_term_eukaryota_taxa.txt 05_validate_taxonomy/16s_dbs/silva/validation_results/silva_unclassified_genera_with_one_term.csv > 05_validate_taxonomy/results/taxize/non_prokaryotes/silva/silva_genera_one_term_eukaryota_records.txt

grep -wFf 05_validate_taxonomy/results/taxize/non_prokaryotes/silva/silva_genera_two_terms_viruses_taxa.txt 05_validate_taxonomy/16s_dbs/silva/validation_results/silva_unclassified_genera_with_two_terms.csv > 05_validate_taxonomy/results/taxize/non_prokaryotes/silva/silva_genera_two_terms_viruses_records.txt

grep -wFf 05_validate_taxonomy/results/taxize/non_prokaryotes/silva/silva_genera_two_terms_eukaryota_taxa.txt 05_validate_taxonomy/16s_dbs/silva/validation_results/silva_unclassified_genera_with_two_terms.csv > 05_validate_taxonomy/results/taxize/non_prokaryotes/silva/silva_genera_two_terms_eukaryota_records.txt

grep -wFf 05_validate_taxonomy/results/taxize/non_prokaryotes/silva/silva_species_viruses_taxa.txt 05_validate_taxonomy/16s_dbs/silva/validation_results/silva_unclassified_species.csv > 05_validate_taxonomy/results/taxize/non_prokaryotes/silva/silva_species_viruses_records.txt

grep -wFf 05_validate_taxonomy/results/taxize/non_prokaryotes/silva/silva_species_eukaryota_taxa.txt 05_validate_taxonomy/16s_dbs/silva/validation_results/silva_unclassified_species.csv > 05_validate_taxonomy/results/taxize/non_prokaryotes/silva/silva_species_eukaryota_records.txt


# Combine one term and two term silva genera results

cat 05_validate_taxonomy/results/taxize/non_prokaryotes/silva/silva_genera_one_term_viruses_records.txt 05_validate_taxonomy/results/taxize/non_prokaryotes/silva/silva_genera_two_terms_viruses_records.txt > 05_validate_taxonomy/results/taxize/non_prokaryotes/silva/silva_genera_total_viruses_records.txt

cat 05_validate_taxonomy/results/taxize/non_prokaryotes/silva/silva_genera_one_term_eukaryota_records.txt 05_validate_taxonomy/results/taxize/non_prokaryotes/silva/silva_genera_two_terms_eukaryota_records.txt > 05_validate_taxonomy/results/taxize/non_prokaryotes/silva/silva_genera_total_eukaryota_records.txt

cat 05_validate_taxonomy/results/taxize/non_prokaryotes/silva/silva_genera_one_term_viruses_taxa.txt 05_validate_taxonomy/results/taxize/non_prokaryotes/silva/silva_genera_two_terms_viruses_taxa.txt > 05_validate_taxonomy/results/taxize/non_prokaryotes/silva/silva_genera_total_viruses_taxa.txt

cat 05_validate_taxonomy/results/taxize/non_prokaryotes/silva/silva_genera_one_term_eukaryota_taxa.txt 05_validate_taxonomy/results/taxize/non_prokaryotes/silva/silva_genera_two_terms_eukaryota_taxa.txt > 05_validate_taxonomy/results/taxize/non_prokaryotes/silva/silva_genera_total_eukaryota_taxa.txt


# Summarize results
date > 05_validate_taxonomy/results/summary_taxize.txt

echo -n "\n\nUnique Eukaryote taxonomic names detected in Greengenes genus annotations: " >> 05_validate_taxonomy/results/summary_taxize.txt
cat 05_validate_taxonomy/results/taxize/non_prokaryotes/gg/gg_genera_eukaryota_taxa.txt | wc -l >> 05_validate_taxonomy/results/summary_taxize.txt
echo -n "Total Greengenes genus annotations annotated with eukaryote taxonomic names: " >> 05_validate_taxonomy/results/summary_taxize.txt
cat 05_validate_taxonomy/results/taxize/non_prokaryotes/gg/gg_genera_eukaryota_records.txt  | wc -l >> 05_validate_taxonomy/results/summary_taxize.txt
echo -n "\nUnique Eukaryote taxonomic names detected in Greengenes species annotations: " >> 05_validate_taxonomy/results/summary_taxize.txt
cat 05_validate_taxonomy/results/taxize/non_prokaryotes/gg/gg_species_eukaryota_taxa.txt | wc -l >> 05_validate_taxonomy/results/summary_taxize.txt
echo -n "Total Greengenes species annotations annotated with eukaryote taxonomic names: " >> 05_validate_taxonomy/results/summary_taxize.txt
cat 05_validate_taxonomy/results/taxize/non_prokaryotes/gg/gg_species_eukaryota_records.txt | wc -l >> 05_validate_taxonomy/results/summary_taxize.txt 


echo -n "\n\nUnique Eukaryote taxonomic names detected in RDP genus annotations: " >> 05_validate_taxonomy/results/summary_taxize.txt
cat 05_validate_taxonomy/results/taxize/non_prokaryotes/rdp/rdp_genera_eukaryota_taxa.txt | wc -l >> 05_validate_taxonomy/results/summary_taxize.txt 
echo -n "Total RDP genus annotations annotated with eukaryote taxonomic names: " >> 05_validate_taxonomy/results/summary_taxize.txt
cat 05_validate_taxonomy/results/taxize/non_prokaryotes/rdp/rdp_genera_eukaryota_records.txt | wc -l >> 05_validate_taxonomy/results/summary_taxize.txt  


echo -n "\n\nUnique Eukaryote taxonomic names detected in SILVA genus annotations: " >> 05_validate_taxonomy/results/summary_taxize.txt
cat 05_validate_taxonomy/results/taxize/non_prokaryotes/silva/silva_genera_total_eukaryota_taxa.txt | wc -l >> 05_validate_taxonomy/results/summary_taxize.txt
echo -n "Total SILVA genus annotations annotated with eukaryote taxonomic names: " >> 05_validate_taxonomy/results/summary_taxize.txt
cat 05_validate_taxonomy/results/taxize/non_prokaryotes/silva/silva_genera_total_eukaryota_records.txt | wc -l >> 05_validate_taxonomy/results/summary_taxize.txt  
echo -n "\nUnique Eukaryote taxonomic names detected in SILVA species annotations: " >> 05_validate_taxonomy/results/summary_taxize.txt
cat 05_validate_taxonomy/results/taxize/non_prokaryotes/silva/silva_species_eukaryota_taxa.txt | wc -l >> 05_validate_taxonomy/results/summary_taxize.txt
echo -n "Total SILVA species annotations annotated with eukaryote taxonomic names: " >> 05_validate_taxonomy/results/summary_taxize.txt
cat 05_validate_taxonomy/results/taxize/non_prokaryotes/silva/silva_species_eukaryota_records.txt | wc -l >> 05_validate_taxonomy/results/summary_taxize.txt




