validfile = './valid.txt'

with open(validfile, 'r', encoding='utf-8') as infile:
	for line in infile:
		if len(line) > 2:
			firstword = line.split(' ', 1)[0]
			if firstword == "T:":
				species_line = line.split("T:",1)[1].lstrip().rstrip()
				species_line2= species_line.split(' ' , 2)
				species = ' '.join(species_line2[0:2])
				print(species)
				
