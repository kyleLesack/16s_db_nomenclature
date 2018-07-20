# Non-prokaryote nomenclature in 16s rRNA reference databases

A manual evaluation of the unclassified sequences in Greengenes, RDP, and SILVA revealed the presence of eukaryote names. Therefore, the R package Taxize was used to query the NCBI E-utilities API for taxonomic information. The getSuperkingdoms.r script retrieves the superkingdom (eg Bacteria, Eukaryota) for the unclassified genus and species names from the previous validation step. The getSuperkingdoms.r script was not included in the makefile, as it requires user input and runs interactively. 

Using an API-key for E-utilities is recommended, as it increases the API request limit to 10 requests per second. The Taxize getkey command can be used to import this key from the Rprofile, Renviron, or a shell variable using the getkey command. For more information see:

https://www.rdocumentation.org/packages/taxize/versions/0.9.3/topics/getkey
https://ncbiinsights.ncbi.nlm.nih.gov/2017/11/02/new-api-keys-for-the-e-utilities/

# Organelles

Mitochondria and chloroplasts were included in the 16S databases as taxa. These organelles were identified using the checkOrganelles.sh script.
