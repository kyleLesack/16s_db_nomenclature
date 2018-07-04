validfile = './valid.txt'

with open(validfile, 'r', encoding='utf-8') as infile:
	for line in infile:
		if len(line) > 2:
			
			line_stripped = line.strip('*#').strip() 
			firstword = line_stripped.split(' ', 1)[0]

			if firstword != "T:" and firstword.isupper():
				print(firstword.title())




