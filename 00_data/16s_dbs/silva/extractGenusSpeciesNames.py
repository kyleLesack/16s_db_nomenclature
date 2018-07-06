import re

genus_file = './nomenclature/filtered/names_only/SILVA_132_SSURef_prokaryotes.genera.filtered.names'
species_file = './nomenclature/filtered/names_only/SILVA_132_SSURef_prokaryotes.species.filtered.names'
other_file = './nomenclature/filtered/names_only/SILVA_132_SSURef_prokaryotes.no_species_annotations.filtered.names'

genera = []
species = []
other = []

with open(genus_file, 'r', encoding='utf-8') as infile:
	for line in infile:
		split_line = line.rstrip().split(" ")
		if len(split_line) > 1:
			genera.append(split_line[0]  + " " + split_line[1])

		else:
			genera.append(split_line[0])
					

with open(species_file, 'r', encoding='utf-8') as infile:
	for line in infile:
		split_line = line.rstrip().split(" ")
		if len(split_line) > 1:
			species.append(split_line[0]  + " " + split_line[1])

		else:
			species.append(split_line[0])

with open(other_file, 'r', encoding='utf-8') as infile:
	for line in infile:
		split_line = line.rstrip().split(" ")
		if len(split_line) > 1:
			other.append(split_line[0]  + " " + split_line[1])

		else:
			other.append(split_line[0])



with open('./nomenclature/filtered/names_only/genera.txt', 'w', encoding='utf-8') as outfile:
	outfile.write("\n".join(genera))

with open('./nomenclature/filtered/names_only/species.txt', 'w', encoding='utf-8') as outfile:
	outfile.write("\n".join(species))

with open('./nomenclature/filtered/names_only/no_species_annotations.txt', 'w', encoding='utf-8') as outfile:
	outfile.write("\n".join(other))
