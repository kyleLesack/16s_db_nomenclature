def importTaxa(filename):
	binomial_fail_list = []

	with open(filename) as f:
		taxon_data = f.readlines()
		for line in taxon_data:	
			taxon_id = line.split(",")[0]
			genus = line.split(",")[1]
			species = line.split(",")[2]
			genus_epithet = species.split()[0]

			if genus != genus_epithet: 
				binomial_fail_list.append(line.strip())

	binomial_fail_list.sort()
	return(binomial_fail_list)


def exportTaxa(taxon_list, filename):
	with open(filename, 'w') as f:
		f.write('\n'.join(taxon_list) + '\n')

binomial_fail_list = importTaxa("./06_binomial_nomenclature/16s_dbs/gg_genus_species.csv")
if len(binomial_fail_list) > 0:
	exportTaxa(binomial_fail_list, "./06_binomial_nomenclature/results/gg_genus_species_binomial_errors")

