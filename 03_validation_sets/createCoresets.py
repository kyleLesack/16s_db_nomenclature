from datetime import date, datetime

# Paths to LPSN Results
LPSN_VALID_GENERA = './03_coresets/lpsn/genera_total.txt'
LPSN_VALID_SPECIES = './03_coresets/lpsn/species_total.txt'
LPSN_INVALID_GENERA =  './03_coresets/lpsn/invalid_genus.txt'
LPSN_INVALID_SPECIES = './03_coresets/lpsn/invalid_species.txt'

# Paths to Prokaryote Nomenclature UpToDate Results
UPTODATE_VALID_GENERA = './03_coresets/up2date/genera_final.txt'
UPTODATE_VALID_SPECIES = './03_coresets/up2date/species_final.txt'
UPTODATE_INVALID_GENERA =  './03_coresets/up2date/invalid_genera_names.txt'
UPTODATE_INVALID_SPECIES = './03_coresets/up2date/invalid_species_names.txt'

# Paths to CyanoDB Results
CYANODB_INVALID_GENERA = './03_coresets/cyanodb/invalid_genera.txt'
CYANODB_VALID_GENERA = './03_coresets/cyanodb/valid_genera.txt' 
CYANODB_VALID_SPECIES = './03_coresets/cyanodb/valid_species.txt'

# Output Path
OUTPATH = './03_coresets/output/'

def writeFile(listfile, filename):
	my_list = list(listfile)
	my_list.sort()
	my_list = filter(None, my_list)
	outfile = OUTPATH + filename
	with open(outfile, 'w') as f:
		f.write('\n'.join(my_list) + '\n')


def importTaxa(filename):
	taxa_list = []
	with open(filename) as f:
		taxon_data = f.readlines()
		for line in taxon_data:		
			if line not in taxa_list and "subsp." not in line:
				taxa_list.append(line.strip())
	taxa_list.sort()
	
	return(taxa_list)

def getIntersection(list1,list2):
	set1 = set(list1)
	set2 = set(list2)
	intersection = set1 & set2
	return(intersection)

def getDifference(list1,list2):
	set1 = set(list1)
	set2 = set(list2)
	difference = set1-set2
	return(difference)

def getUnion(list1, list2):
	set1 = set(list1)
	set2 = set(list2)
	union = set1|set2
	return(union)		

def compareTwoSets(set1, set2, set1_name, set2_name):

	diff = getDifference(set1, set2)
	diff2 = getDifference(set2, set1)

	summary_text = ("Comparing " + set1_name + " with " + set2_name + "\n")
	summary_text+=("\n\t" + set1_name + "\t" + set2_name)
	summary_text+=("\nSize: \t\t" + str(len(set1)) + "\t\t\t" + str(len(set2))) 		

	summary_text+=("\n\nDiff " + set1_name + "  - " + set2_name + ":   " + str(len(diff)))
	summary_text+=("\nDiff " + set2_name + "  - " + set1_name + ":   " + str(len(diff2)))
	summary_text+=("\n\n\n")
	
	return summary_text

def compareThreeSets(set1, set2, set3, set1_name, set2_name, set3_name):

	diff_1_2 = getDifference(set1, set2)
	diff_2_1 = getDifference(set2, set1)

	summary_text = ("Comparing " + set1_name + " with " + set2_name + "\n")
	summary_text+=("\n\t" + set1_name + "\t" + set2_name)
	summary_text+=("\nSize: \t\t" + str(len(set1)) + "\t\t\t" + str(len(set2))) 		

	summary_text+=("\n\nDiff " + set1_name + "  - " + set2_name + ":   " + str(len(diff_1_2)))
	summary_text+=("\nDiff " + set2_name + "  - " + set1_name + ":   " + str(len(diff_2_1)))
	summary_text+=("\n\n\n")
	
	diff_1_3 = getDifference(set1, set3)
	diff_3_1 = getDifference(set3, set1)

	summary_text+= ("Comparing " + set1_name + " with " + set3_name + "\n")
	summary_text+=("\n\t" + set1_name + "\t" + set3_name)
	summary_text+=("\nSize: \t\t" + str(len(set1)) + "\t\t\t" + str(len(set3))) 		

	summary_text+=("\n\nDiff " + set1_name + "  - " + set3_name + ":   " + str(len(diff_1_3)))
	summary_text+=("\nDiff " + set3_name + "  - " + set1_name + ":   " + str(len(diff_3_1)))
	summary_text+=("\n\n\n")


	diff_2_3 = getDifference(set2, set3)
	diff_3_2 = getDifference(set3, set2)

	summary_text+= ("Comparing " + set2_name + " with " + set3_name + "\n")
	summary_text+=("\n\t" + set2_name + "\t" + set3_name)
	summary_text+=("\nSize: \t\t" + str(len(set2)) + "\t\t\t" + str(len(set3))) 		

	summary_text+=("\n\nDiff " + set2_name + "  - " + set3_name + ":   " + str(len(diff_2_3)))
	summary_text+=("\nDiff " + set3_name + "  - " + set2_name + ":   " + str(len(diff_3_2)))
	summary_text+=("\n\n\n")

	return summary_text

def writeSummary(filename, text):
	filename=OUTPATH +  filename
	with open(filename, "w") as text_file:
		text_file.write(text)

def createInvalidGeneraCoreset(lpsn, up2date, cyanodb):
	invalid_lpsn_up2date = getUnion(lpsn, up2date)
	invalids = getUnion(invalid_lpsn_up2date, cyanodb)	
	
	return(invalids)	

def createInvalidGeneraCoresetNoDiscrepancies(genera, discrepancies):
	
	genus_set = set(genera)
	discrepancy_set = set(discrepancies)	
	genera_no_discrepancies = genus_set - discrepancy_set	
	invalid_names = "Invalid genus names excluding discrepancies between nomenclature DBs: " + str(len(genera_no_discrepancies)) + "\n" 
	return(genera_no_discrepancies, invalid_names)

def createInvalidSpeciesCoresetNoDiscrepancies(species, discrepancies):
	species_set = set(species)
	discrepancy_set = set(discrepancies)	
	species_no_discrepancies = species_set - discrepancy_set	
	invalid_names = "Invalid species names excluding discrepancies between nomenclature DBs: " + str(len(species_no_discrepancies)) + "\n" 
	return(species_no_discrepancies, invalid_names)

def createInvalidSpeciesCoreset(lpsn, up2date):
	invalids = getUnion(lpsn, up2date)	
	#invalid_names = "Invalid species names excluding discrepancies between nomenclature DBs: " + str(len(invalids)) + "\n" 
	#return(invalids, invalid_names)	
	return(invalids)	

def createValidCoreset(list1, list2, list3, exclude_list, valid_taxon):
	valid_union_1_2 = getUnion(list1, list2)
	valid_union = getUnion(valid_union_1_2,list3)
	valid_screened = getDifference(valid_union, exclude_list)
	combined_names = "Combined (union) " + valid_taxon +" names before screening: " + str(len(valid_union))
	screened_names = "Valid " + valid_taxon +" names excluding discrepancies between nomenclature DBs: " + str(len(valid_screened)) + "\n"

	return(valid_screened, combined_names, screened_names)

def getUnionDiscrepanciesGenera(list1,list2,list3, list4, list5, list6):
	set1 = set(list1)
	set2 = set(list2)
	set3 = set(list3)
	set4 = set(list4)
	set5 = set(list5)
	set6 = set(list6)

	union = set1 | set2 | set3 | set4  | set5 | set6

	summary = "Genus name discrepancies between nomenclature DBs: " + str(len(union)) + "\n"
 
	return(union, summary)

def getUnionDiscrepanciesSpecies(list1,list2,list3, list4):
	set1 = set(list1)
	set2 = set(list2)
	set3 = set(list3)
	set4 = set(list4)
	union = set1 | set2 | set3 | set4  

	summary = "Species name discrepancies between nomenclature DBs: " + str(len(union)) + "\n"
 
	return(union, summary)

if __name__ == "__main__":

# Create valid names lists
	lpsn_genera_valid = importTaxa(LPSN_VALID_GENERA)
	lpsn_species_valid = importTaxa(LPSN_VALID_SPECIES)
	up2date_genera_valid = importTaxa(UPTODATE_VALID_GENERA)
	up2date_species_valid = importTaxa(UPTODATE_VALID_SPECIES)
	cyanodb_genera_valid = importTaxa(CYANODB_VALID_GENERA)
	cyanodb_species_valid = importTaxa(CYANODB_VALID_SPECIES)
	valid_genus_summary = compareThreeSets(lpsn_genera_valid, up2date_genera_valid,cyanodb_genera_valid, "LPSN Genera Valid", "Up2date Genera Valid", "CyanoDB Genera Valid")
	valid_species_summary = compareThreeSets(lpsn_species_valid, up2date_species_valid,cyanodb_species_valid, "LPSN Species Valid", "Up2date Species Valid", "CyanoDB Species Valid")
	
	
# Create invalid names lists
	lpsn_genera_invalid = importTaxa(LPSN_INVALID_GENERA)
	lpsn_species_invalid = importTaxa(LPSN_INVALID_SPECIES)
	up2date_genera_invalid = importTaxa(UPTODATE_INVALID_GENERA)
	up2date_species_invalid = importTaxa(UPTODATE_INVALID_SPECIES)
	cyanodb_genera_invalid = importTaxa(CYANODB_INVALID_GENERA)
	invalid_genus_summary = compareThreeSets(lpsn_genera_invalid, up2date_genera_invalid, cyanodb_genera_invalid, "LPSN Genera Invalid", "Up2date Genera Invalid", "CyanoDB Genera Invalid")
	invalid_species_summary = compareTwoSets(lpsn_species_invalid, up2date_species_invalid, "LPSN Species Invalid", "Up2date Species Invalid")

# Create coresets

	invalid_genera_coreset = createInvalidGeneraCoreset(lpsn_genera_invalid, up2date_genera_invalid, cyanodb_genera_invalid)
	valid_genera_coreset = createValidCoreset(lpsn_genera_valid, up2date_genera_valid, cyanodb_genera_valid, invalid_genera_coreset, "genus")
	writeFile(valid_genera_coreset[0], "final/valid_genera_coreset.txt")	

	invalid_species_coreset = createInvalidSpeciesCoreset(lpsn_species_invalid, up2date_species_invalid)
	valid_species_coreset = createValidCoreset(lpsn_species_valid, up2date_species_valid, cyanodb_species_valid, invalid_species_coreset, "species")

	writeFile(valid_species_coreset[0], "final/valid_species_coreset.txt")	

	# Compare LPSN Valid to UpToDate Invalid, and vice versa
	lpsnvalid_uptodateinvalid_genera = getIntersection(lpsn_genera_valid,up2date_genera_invalid)
	lpsnvalid_uptodateinvalid_species = getIntersection(lpsn_species_valid, up2date_species_invalid)

	writeFile(lpsnvalid_uptodateinvalid_genera, "discrepancies/lpsnvalid_uptodateinvalid_genera.txt")	
	writeFile(lpsnvalid_uptodateinvalid_species, "discrepancies/lpsnvalid_uptodateinvalid_species.txt")	

	uptodatevalid_lpsninvalid_genera = getIntersection(up2date_genera_valid, lpsn_genera_invalid)
	uptodatevalid_lpsninvalid_species = getIntersection(up2date_species_valid, lpsn_species_invalid)

	writeFile(uptodatevalid_lpsninvalid_genera, "discrepancies/uptodatevalid_lpsninvalid_genera.txt")	
	writeFile(uptodatevalid_lpsninvalid_species, "discrepancies/uptodatevalid_lpsninvalid_species.txt")

	# Compare LPSN Valid to CyanoDB Invalid, and vice versa
	lpsn_valid_cyanodb_invalid_genera = getIntersection(lpsn_genera_valid,cyanodb_genera_invalid)
	writeFile(lpsn_valid_cyanodb_invalid_genera, "discrepancies/lpsnvalid_cyanodbinvalid_genera.txt")	

	cyanodb_valid_lpsn_invalid_genera = getIntersection(cyanodb_genera_valid, lpsn_genera_invalid)
	cyanodb_valid_lpsn_invalid_species = getIntersection(cyanodb_species_valid, lpsn_species_invalid)

	writeFile(cyanodb_valid_lpsn_invalid_genera, "discrepancies/cyanodbvalid_lpsninvalid_genera.txt")	
	writeFile(cyanodb_valid_lpsn_invalid_species, "discrepancies/cyanodbvalid_lpsninvalid_species.txt")

	# Compare LPSN Valid to CyanoDB Invalid, and vice versa
	up2date_valid_cyanodb_invalid_genera = getIntersection(up2date_genera_valid,cyanodb_genera_invalid)
	writeFile(up2date_valid_cyanodb_invalid_genera, "discrepancies/up2datevalid_cyanodbinvalid_genera.txt")	

	cyanodb_valid_up2date_invalid_genera = getIntersection(cyanodb_genera_valid, up2date_genera_invalid)
	cyanodb_valid_up2date_invalid_species = getIntersection(cyanodb_species_valid, up2date_species_invalid)

	writeFile(cyanodb_valid_up2date_invalid_genera, "discrepancies/cyanodbvalid_up2dateinvalid_genera.txt")	
	writeFile(cyanodb_valid_up2date_invalid_species, "discrepancies/cyanodbvalid_up2dateinvalid_species.txt")

	# Combine all discrepancies and filter from invalid variables

	genus_discrepancies = getUnionDiscrepanciesGenera(lpsnvalid_uptodateinvalid_genera,uptodatevalid_lpsninvalid_genera,lpsn_valid_cyanodb_invalid_genera,cyanodb_valid_lpsn_invalid_genera,up2date_valid_cyanodb_invalid_genera,cyanodb_valid_up2date_invalid_genera)
	writeFile(genus_discrepancies[0], "discrepancies/all_genera.txt")

	invalid_genera_coreset_no_discrepancies = createInvalidGeneraCoresetNoDiscrepancies(invalid_genera_coreset,genus_discrepancies[0])
	writeFile(invalid_genera_coreset_no_discrepancies[0], "final/invalid_genera_coreset.txt")
	
	species_discrepancies = getUnionDiscrepanciesSpecies(lpsnvalid_uptodateinvalid_species,uptodatevalid_lpsninvalid_species,cyanodb_valid_lpsn_invalid_species,cyanodb_valid_up2date_invalid_species)
	writeFile(species_discrepancies[0], "discrepancies/all_species.txt")

	invalid_species_coreset_no_discrepancies = createInvalidSpeciesCoresetNoDiscrepancies(invalid_species_coreset,species_discrepancies[0])
	writeFile(invalid_species_coreset_no_discrepancies[0], "final/invalid_species_coreset.txt")

# 	Write summary file
	discrepancy_summary = valid_genus_summary + valid_species_summary + invalid_genus_summary + invalid_species_summary  
	logFile =  date.isoformat(datetime.today()) + "_discrepancy_summary.txt"
	writeSummary( logFile , discrepancy_summary)	

	summary_text = "Final Coreset Stats:\n\n"
	summary_text +=  str(valid_genera_coreset[2]) + str(valid_species_coreset[2]) + str(invalid_genera_coreset_no_discrepancies[1]) + str(invalid_species_coreset_no_discrepancies[1]) + str(genus_discrepancies[1]) + str(species_discrepancies[1])
	logFile =  date.isoformat(datetime.today()) + "_summary.txt"
	writeSummary( logFile , summary_text)	
