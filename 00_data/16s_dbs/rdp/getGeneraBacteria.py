myfile = './current_Bacteria.header'

EXCLUDE_TERMS = ['Candidatus' , 'incertae_sedis']

with open(myfile, 'r', encoding='utf-8') as infile:
	for line in infile:
		if not any(exclude in line for exclude in EXCLUDE_TERMS): # Exclude Candidatus and incertae sedis annotations

			if ";genus" in line: # check if line has genus level annotation
				line_split = line.split(";")
				line_split_len = len(line_split)
				if line_split[line_split_len-1].rstrip() == "genus":
					accession_description = str(line_split[0]).replace("Lineage=Root", "") 
					genus_name = str(line_split[line_split_len-2]).replace('"', '')
					print(accession_description.rstrip() + ";" + genus_name)
	

