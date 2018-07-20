def importTaxa(filename):
	binomial_fail_list = []
	binomial_merged_genera_list = []
	binomial_space_separated_list = []


	with open(filename) as f:
		taxon_data = f.readlines()
		for line in taxon_data:		
			taxon_id = line.split(";")[0]
			genus = line.split(";")[1]
			species = line.split(";")[2]
			genus_epithet = species.split()[0]

			if genus != genus_epithet:
				if "-" in genus and " " not in genus: # SILVA contains merged groups that are separated by hyphens (eg Escherichia-Shigella)
					genus_split = genus.split("-") # split the merged group into separate genera; check that genus epithet belongs to one of the group's genera
					if genus_epithet not in genus_split:
						binomial_fail_list.append(line.strip())
					else:
						binomial_merged_genera_list.append(line.strip())
				else:
					if " " in genus: # Some genus annotations contain the same genus as the genus epithet, but fail due to having >1 terms (eg Spirochaeta 2)
						genus_split = genus.split(" ") # split the merged group into separate genera; check that genus epithet belongs to first genus term
						if genus_epithet != genus_split[0]:
							binomial_fail_list.append(line.strip())
						else:
							binomial_space_separated_list.append(line.strip())
					else:
						binomial_fail_list.append(line.strip())


	binomial_fail_list.sort()
	binomial_merged_genera_list.sort()
	binomial_space_separated_list.sort()
	return([binomial_fail_list,binomial_merged_genera_list,binomial_space_separated_list])


def exportTaxa(taxon_list, filename):
	with open(filename, 'w') as f:
		f.write('\n'.join(taxon_list) + '\n')

binomial_fail_list = importTaxa("./06_binomial_nomenclature/16s_dbs/silva_filtered_genus_species.csv")
exportTaxa(binomial_fail_list[0], "./06_binomial_nomenclature/results/silva_binomial_errors") # Fails binomial nomenclature check, and doesn't include any of the special cases described below
exportTaxa(binomial_fail_list[1], "./06_binomial_nomenclature/results/silva_binomial_errors_merged_genera") # Genus and genus epithet don't match because genus is a merged group (hyphen separated)
exportTaxa(binomial_fail_list[2], "./06_binomial_nomenclature/results/silva_binomial_errors_space_separated_genus")# Genus and genus epithet don't match because the genus name has >1 terms



