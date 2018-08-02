import re

myfile = './gg_13_5_taxonomy.txt'

genera = []
genus_species = []
species = []
candidatus_genera = []
candidatus_species = []
metadata_species = []


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
			else:
				genus_name = genus_name.replace("[","").replace("]", "").replace("g__", "")
				id_genus_name = id_num + "," + genus_name.lstrip()
				candidatus_genera.append(id_genus_name)



		pattern = r"s__.+" # s__ used to designate species name in Greengenes
		species_name = split_line[6].strip()
		if re.search(pattern, split_line[6]):		
			id_num = line.split("\t")[0]
			species_name= species_name.replace("s__", "")

			genus_name = split_line[5] # Get genus name (not genus epithet in species name)
#			if "Candidatus" not in genus_name:
			genus_name = genus_name.replace("[","").replace("]", "").replace("g__", "")
			genus_name = genus_name.lstrip()

			id_species = id_num + "," + genus_name + " " + species_name # add id, genus rank rank, and species name to string
			id_genus_species = id_num + "," + genus_name + "," + genus_name + " " + species_name # add id, species name to string			

			if "Candidatus" not in genus_name and "endosymbiont" not in species_name and "genosp." not in species_name and "genomosp." not in species_name:
				genus_species.append(id_genus_species)
				species.append(id_species)								
			elif "Candidatus" in genus_name and  "endosymbiont" not in species_name and "genosp." not in species_name and "genomosp." not in species_name:
				candidatus_species.append(id_genus_species)
			else: 
				metadata_species.append(id_genus_species)			
			


with open('./nomenclature/genera.csv', 'w', encoding='utf-8') as outfile:
	outfile.write("\n".join(genera))

with open('./nomenclature/candidatus_genera.csv', 'w', encoding='utf-8') as outfile:
	outfile.write("\n".join(candidatus_genera))

with open('./nomenclature/species.csv', 'w', encoding='utf-8') as outfile:
	outfile.write("\n".join(species))

with open('./nomenclature/genus_species.csv', 'w', encoding='utf-8') as outfile:
	outfile.write("\n".join(genus_species))

with open('./nomenclature/candidatus_species.csv', 'w', encoding='utf-8') as outfile:
	outfile.write("\n".join(candidatus_species))

with open('./nomenclature/metadata_species.csv', 'w', encoding='utf-8') as outfile:
	outfile.write("\n".join(metadata_species))

