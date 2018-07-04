from uptodate_api import *
import json

headers={'Accept': 'application/json'}

print("Grabbing nomenclature from Prokaryote Nomenclature Up-To-Date API")
username = input('Please enter username: ')
password = input('Please enter password: ')



if __name__ == "__main__":
	x = PNUClient(headers,username,password)

	genera = x.getTaxon('genera')
	with open('02_uptodate/output/genera.txt', 'w') as text_file:
		for name in genera:
			text_file.write(name + "\n")

	species = x.getTaxon('species')
	with open('02_uptodate/output/species.txt', 'w') as text_file:
		for name in species:
			text_file.write(name + "\n")
	reclassified = x.getTaxon('reclassified')

	with open('02_uptodate/output/reclassified.txt', 'w') as text_file:
		for name in reclassified:
			text_file.write(name + "\n")
