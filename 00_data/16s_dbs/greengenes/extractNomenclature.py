import re

myfile = './gg_13_5_taxonomy.txt'

genera = []
species = []
genus_species = []
with open(myfile, 'r', encoding='utf-8') as infile:
	for line in infile:
		split_line = line.split(";")			
		if "g__;" not in line:	# g__; indicates no genus level classification
			id_num = line.split("\t")[0]
			genus_name = split_line[5]
			if "Candidatus" not in genus_name:
				genus_name = genus_name.replace("[","").replace("]", "").replace("g__", "")
				id_genus_name = id_num + "," + genus_name.lstrip()
				genera.append(id_genus_name)

		pattern = r"s__.+" # s__ used to designate species name in Greengenes
		species_name = split_line[6].strip()
		if re.search(pattern, split_line[6]):		
			id_num = line.split("\t")[0]
			species_name= species_name.replace("s__", "")

			genus_name = split_line[5] # Get genus name (not genus epithet in species name)
			if "Candidatus" not in genus_name:
				genus_name = genus_name.replace("[","").replace("]", "").replace("g__", "")
				genus_name = genus_name.lstrip()

			genus_epithet = split_line[5] # Get genus epithet from species name
			if "Candidatus" not in genus_epithet and  "endosymbiont" not in species_name:
				genus_epithet = genus_epithet.replace("[","").replace("]", "").replace("g__", "")
				id_genus_species_name = id_num + "," + genus_epithet.lstrip() + " " + species_name
				species.append(id_genus_species_name)
				

				id_genus_species = id_num + "," + genus_name + "," + genus_epithet.lstrip() + " " + species_name # add genus rank rank, and species names to string
				genus_species.append(id_genus_species)

with open('./nomenclature/genera.csv', 'w', encoding='utf-8') as outfile:
	outfile.write("\n".join(genera))

with open('./nomenclature/species.csv', 'w', encoding='utf-8') as outfile:
	outfile.write("\n".join(species))

with open('./nomenclature/genus_species.csv', 'w', encoding='utf-8') as outfile:
	outfile.write("\n".join(genus_species))
