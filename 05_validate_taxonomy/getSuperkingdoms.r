library("taxize")

getkey(service="entrez")

gg_genera <- scan("./intermediate_files/gg_unclassified_genus_names_uniq.txt", what="", sep="\n")
gg_species <- scan("./intermediate_files/gg_unclassified_species_names_uniq.txt", what="", sep="\n")
rdp_genera <- scan("./intermediate_files/rdp_unclassified_genus_names_uniq.txt", what="", sep="\n")
silva_genera_one_term <- scan("./intermediate_files/silva_unclassified_genera_one_term_uniq.txt", what="", sep="\n")
silva_genera_two_terms <- scan("./intermediate_files/silva_unclassified_genera_two_terms_uniq.txt", what="", sep="\n")
silva_species <- scan("./intermediate_files/silva_unclassified_species_uniq.txt", what="", sep="\n")


# Greengenes

gg_genera_superkingdoms <- tax_name(query = gg_genera, get = "superkingdom", db = "ncbi")
gg_genera_superkingdoms.df <- data.frame(gg_genera_superkingdoms)
non_prokaryotes_gg_genera <- subset(gg_genera_superkingdoms.df, superkingdom != "Bacteria" & superkingdom != "Archaea")
#non_prokaryotes_gg_genera

write.csv(gg_genera_superkingdoms, file = "./results/taxize/gg_genera_superkingdoms.txt")
write.csv(non_prokaryotes_gg_genera, file = "./results/taxize/non_prokaryotes/gg_genera_superkingdoms_non_prokaryotes.txt")

gg_species_superkingdoms <- tax_name(query = gg_species, get = "superkingdom", db = "ncbi")
gg_species_superkingdoms.df <- data.frame(gg_species_superkingdoms)
non_prokaryotes_gg_species <- subset(gg_species_superkingdoms.df, superkingdom != "Bacteria" & superkingdom != "Archaea")
#non_prokaryotes_gg_species

write.csv(gg_species_superkingdoms, file = "./results/taxize/gg_species_superkingdoms.txt")
write.csv(non_prokaryotes_gg_species, file = "./results/taxize/non_prokaryotes/gg_species_superkingdoms_non_prokaryotes.txt")


# RDP 
rdp_genera_superkingdoms <- tax_name(query = rdp_genera, get = "superkingdom", db = "ncbi")
rdp_genera_superkingdoms.df <- data.frame(rdp_genera_superkingdoms)
non_prokaryotes_rdp_genera <- subset(rdp_genera_superkingdoms.df, superkingdom != "Bacteria" & superkingdom != "Archaea")
#non_prokaryotes_rdp_genera


write.csv(rdp_genera_superkingdoms, file = "./results/taxize/rdp_genera_superkingdoms.txt")
write.csv(non_prokaryotes_rdp_genera, file = "./results/taxize/non_prokaryotes/rdp_genera_superkingdoms_non_prokaryotes.txt")


# SILVA

silva_genera_superkingdoms <- tax_name(query = silva_genera_one_term, get = "superkingdom", db = "ncbi")
silva_genera_superkingdoms.df <- data.frame(silva_genera_superkingdoms)
non_prokaryotes_silva_genera <- subset(silva_genera_superkingdoms.df, superkingdom != "Bacteria" & superkingdom != "Archaea")
#non_prokaryotes_silva_genera

write.csv(silva_genera_superkingdoms, file = "./results/taxize/silva_genera_superkingdoms.txt")
write.csv(non_prokaryotes_silva_genera, file = "./results/taxize/non_prokaryotes/silva_genera_superkingdoms_non_prokaryotes.txt")

silva_genera_two_terms_superkingdoms <- tax_name(query = silva_genera_two_terms, get = "superkingdom", db = "ncbi")
silva_genera_two_terms_superkingdoms.df <- data.frame(silva_genera_two_terms_superkingdoms)
non_prokaryotes_silva_genera_two_terms <- subset(silva_genera_two_terms_superkingdoms.df, superkingdom != "Bacteria" & superkingdom != "Archaea")
#non_prokaryotes_silva_genera

write.csv(silva_genera_two_terms_superkingdoms, file = "./results/taxize/silva_genera_two_terms_superkingdoms.txt")
write.csv(non_prokaryotes_silva_genera_two_terms, file = "./results/taxize/non_prokaryotes/silva_genera_two_terms_superkingdoms_non_prokaryotes.txt")


silva_species_superkingdoms <- tax_name(query = silva_species, get = "superkingdom", db = "ncbi")
silva_species_superkingdoms.df <- data.frame(silva_species_superkingdoms)
non_prokaryotes_silva_species <- subset(silva_species_superkingdoms.df, superkingdom != "Bacteria" & superkingdom != "Archaea")
#non_prokaryotes_silva_species

write.csv(silva_species_superkingdoms, file = "./results/taxize/silva_species_superkingdoms.txt")
write.csv(non_prokaryotes_silva_species, file = "./results/taxize/non_prokaryotes/silva_species_superkingdoms_non_prokaryotes.txt")

