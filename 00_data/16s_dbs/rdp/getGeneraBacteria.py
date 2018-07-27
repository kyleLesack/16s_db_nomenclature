bacteria_file = './current_Bacteria.header'
archaea_file = './current_Archaea.header'

EXCLUDE_TERMS = ['Candidatus' , 'incertae_sedis', 'Incertae Sedis']

genera = []
candidatus_genera = []
incertae_sedis = []

with open(bacteria_file, 'r', encoding='utf-8') as infile:
	for line in infile:
		if not any(exclude in line for exclude in EXCLUDE_TERMS): # Exclude Candidatus and incertae sedis annotations

			if ";genus" in line: # check if line has genus level annotation
				line_split = line.split(";")
				line_split_len = len(line_split)
				if line_split[line_split_len-1].rstrip() == "genus":
					accession_description = str(line_split[0]).replace("Lineage=Root", "") 
					genus_name = str(line_split[line_split_len-2]).replace('"', '')
					genus_record = accession_description.rstrip() + ";" + genus_name
					genera.append(genus_record)

		elif 'Candidatus' in line:
			if ";genus" in line: # check if line has genus level annotation
				line_split = line.split(";")
				line_split_len = len(line_split)
				if line_split[line_split_len-1].rstrip() == "genus":
					accession_description = str(line_split[0]).replace("Lineage=Root", "") 
					genus_name = str(line_split[line_split_len-2]).replace('"', '')
					candidatus_record= accession_description.rstrip() + ";" + genus_name
					candidatus_genera.append(candidatus_record)

		elif 'incertae_sedis' in line or 'Incertae Sedis' in line:
			
			if ";genus" in line: # check if line has genus level annotation
				line_split = line.split(";")
				line_split_len = len(line_split)
				if line_split[line_split_len-1].rstrip() == "genus":
					accession_description = str(line_split[0]).replace("Lineage=Root", "") 
					genus_name = str(line_split[line_split_len-2]).replace('"', '')
					incertae_record = accession_description.rstrip() + ";" + genus_name 
					incertae_record.append(incertae_record)

with open(archaea_file, 'r', encoding='utf-8') as infile:
	for line in infile:
		if not any(exclude in line for exclude in EXCLUDE_TERMS): # Exclude Candidatus and incertae sedis annotations

			if ";genus" in line: # check if line has genus level annotation
				line_split = line.split(";")
				line_split_len = len(line_split)
				if line_split[line_split_len-1].rstrip() == "genus":
					accession_description = str(line_split[0]).replace("Lineage=Root", "") 
					genus_name = str(line_split[line_split_len-2]).replace('"', '')
					genus_record = accession_description.rstrip() + ";" + genus_name
					genera.append(genus_record)

		elif 'Candidatus' in line:
			if ";genus" in line: # check if line has genus level annotation
				line_split = line.split(";")
				line_split_len = len(line_split)
				if line_split[line_split_len-1].rstrip() == "genus":
					accession_description = str(line_split[0]).replace("Lineage=Root", "") 
					genus_name = str(line_split[line_split_len-2]).replace('"', '')
					candidatus_record= accession_description.rstrip() + ";" + genus_name
					candidatus_genera.append(candidatus_record)

		elif 'incertae_sedis' in line or 'Incertae Sedis' in line:
			if ";genus" in line: # check if line has genus level annotation
				line_split = line.split(";")
				line_split_len = len(line_split)
				if line_split[line_split_len-1].rstrip() == "genus":
					accession_description = str(line_split[0]).replace("Lineage=Root", "") 
					genus_name = str(line_split[line_split_len-2]).replace('"', '')
					incertae_record = accession_description.rstrip() + ";" + genus_name 
					incertae_record.append(incertae_record)

with open('./nomenclature/rdp_genera_ids_names.csv', 'w', encoding='utf-8') as outfile:
	outfile.write("\n".join(genera.sort()))

with open('./nomenclature/rdp_genera_candidatus_ids_names.csv', 'w', encoding='utf-8') as outfile:
	outfile.write("\n".join(candidatus_genera.sort()))

with open('./nomenclature/rdp_genera_incertae_sedis_ids_names.csv', 'w', encoding='utf-8') as outfile:
	outfile.write("\n".join(incertae_sedis .sort()))
 
