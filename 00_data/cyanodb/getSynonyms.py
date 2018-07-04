synonymfile = './synonyms.txt'

with open(synonymfile, 'r', encoding='utf-8') as infile:
	for line in infile:
		if len(line) > 2:
			
			line_stripped = line.strip() 
			firstword = line_stripped.split(' ', 1)[0]

			if firstword.isupper():
				print(firstword.title().strip('”'))




