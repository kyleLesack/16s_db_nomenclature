from bs4 import BeautifulSoup
#import html5lib
import requests
import re

# HTML Classes for LPSN Taxon Designations
STRAIN_CLASS = "genusspecies-subspecies" # Scrape strains using soup.find_all("span", class_="genusspecies-subspecies")

# CSS Selectors for LPSN Taxon Designations
SPECIES_SELECTOR = ".genusspecies + .specificepithet"
GENUS_SELECTOR = "br + span.genusspecies"
CANDIDATUS_SELECTOR=".candidatus-designation + .candidatus-name" # Grabs first part of Candidatus names
INVALID_SELECTOR=".genusspecies-quote + .genusspecies" # Grabs first part of Invalid Names


# Create BeautifulSoup Object
def getSoup(html):
	soup = BeautifulSoup(html, 'html5lib')
	return soup

def getGenera(soup, selector=GENUS_SELECTOR):    # Obtain genera epithet elements from "genus species" names
	validGenusObjects = soup.select(selector)

	# Grab genera names
	genusNames = []
	for name in validGenusObjects:
		genusName = name.text.strip()
		if genusName and genusName[0].isupper(): # Genus names should be capitalized
			genusNames.append(genusName)
		else:
			print("Warning, the selected genus name " + genusName + " ignored due to likely false positive") 
	uniqueNames = getUnique(genusNames)    
	return uniqueNames

# Get species names, return a list of tuples, where each tuple is the genus species epithets
def getSpeciesSiblings(soup, selector=SPECIES_SELECTOR):
	# Obtain species epithet elements from "genus species" names
	speciesNamesObjects=soup.select(selector)

	# Grab species names
	names = [] 
	for species in speciesNamesObjects:
		speciesName = species.text.strip()
		if speciesName and speciesName[0].isupper():  # If capitalized, it is probably a genus epithet   
			print("Warning, the selected species name " + speciesName + " ignored due to likely false positive") 
		else:        
			genus = species.find_previous_sibling("span", class_="genusspecies")
			names.append((genus.text.strip(), species.text.strip()))
	uniqueSpecies = getUnique(names)
	return uniqueSpecies

# Method for Obtaining Strains, and their associated genus, species ranks
def getStrainSiblings(soup):
	strains = soup.find_all("span", class_="genusspecies-subspecies") 
	strainNames = []
	for strain in strains:
		species =  strain.find_previous_sibling("span", class_="genusspecies")
		genus = species.find_previous_sibling("span", class_="genusspecies")
		strain =  strain.find_next_sibling("span", class_="genusspecies")

		if (genus is None) or (species is None) or (strain is None):
			print("None Type found for: " + str(genusSpeciesStrain))
		else: 
			genusSpeciesStrain =  ( genus.contents, species.contents, strain.contents )

		strainNames.append(genusSpeciesStrain)
    
	return strainNames 

def getUnique(myList):
	seen = set()
	seen_add = seen.add
	return [ x for x in myList if not (x in seen or seen_add(x))]

def getCandidatus(soup,selector = CANDIDATUS_SELECTOR):  

	genus_names = [] 
	genus_species_names = []
	other_names = []

	candidatusNamesObjects = soup.select(CANDIDATUS_SELECTOR)
	for soupObj in candidatusNamesObjects:
		name = soupObj.text.strip() # Non-ascii character (zeta) in candidatus names causes a decoding error, need to encode explicitly
		splitName = name.split()
		if len(splitName) > 1: # Some candidatus genus species epithets are contained in separate elements, while others are a single space separated element
			genus_species_names.append(("Candidatus",splitName[0],splitName[1]))
		else:
			siblingCandidatus = soupObj.find_next_sibling("span", class_="candidatus-name")                
			if (siblingCandidatus):
				speciesName = siblingCandidatus.text.strip()
				genus_species_names.append(("Candidatus",name, speciesName ))
			elif name[0].isupper(): # If first letter capitalized, probably genus name           
				genus_names.append(("Candidatus",name))
			else:
				other_names.append(("Candidatus",name))

	alltogether = (genus_names, genus_species_names, other_names)
	return alltogether

def getInvalid(soup):
	inv_types = ('subsp. nov.', 'sp. nov.', 'sp nov.', 'gen. nov.', 'gen nov.', 'comb. nov.', 'divisio nov.', 'class. nov.', 'fam. nov.', 'ord. nov.', 'nom. nov.')
	other_inv_types = ('divisio nov.', 'class. nov.', 'fam. nov.', 'ord. nov.', 'nom. nov.')	

	genus_names = []
	species_names = []
	subspecies_names = []
	other_names = []

	# Remove script and style elements
	for script in soup(["script", "style"]):
	    script.extract()    
	# get text
	text = soup.get_text()

	# break into lines and remove leading and trailing space on each
	lines = (line.strip() for line in text.splitlines())

	for line in lines: # Check for nomenclature category designations, extract names only
		inv_name_line = False
		if line and "\"" in line[0]:
			if any(s in line for s in inv_types):
				inv_name_line=True
		if inv_name_line == True:
			if 'subsp. nov.' in line:
				inv_name = re.search('(?:")([^"]*)(?:")', line)
				subspecies_names.append(inv_name.group(0).replace("\"",""))
						
			elif 'sp. nov.' in line:
				inv_name = re.search('(?:")([^"]*)(?:")', line)
				species_names.append(inv_name.group(0).replace("\"",""))

			elif 'sp nov.' in line:
				inv_name = re.search('(?:")([^"]*)(?:")', line)
				species_names.append(inv_name.group(0).replace("\"",""))

			elif 'gen. nov.' in line:
				inv_name = re.search('(?:")([^"]*)(?:")', line)
				genus_names.append(inv_name.group(0).replace("\"",""))

			elif 'gen nov.' in line:
				inv_name = re.search('(?:")([^"]*)(?:")', line)
				genus_names.append(inv_name.group(0).replace("\"",""))

			elif 'comb. nov.' in line:
				inv_name = re.search('(?:")([^"]*)(?:")', line)
				inv_name_string = inv_name.group(0).replace("\"","")
				if 'subsp.' in inv_name_string:
					subspecies_names.append(inv_name_string)
				else:
					species_names.append(inv_name_string)

			elif 'nom. nov.' in line:
				inv_name = re.search('(?:")([^"]*)(?:")', line)
				inv_name_string = inv_name.group(0).replace("\"","")
				if 'subsp.' in inv_name_string:
					subspecies_names.append(inv_name_string)
				else:
					species_names.append(inv_name_string)


			elif any(s in line for s in other_inv_types):
				inv_name = re.search('(?:")([^"]*)(?:")', line)
				other_names.append(inv_name.group(0).replace("\"",""))


	alltogether = (subspecies_names, species_names, genus_names, other_names)
	return alltogether



