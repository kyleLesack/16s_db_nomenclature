from bs4 import BeautifulSoup
import requests
import csv
from scrapeLPSN import *
from datetime import date, datetime
import argparse

parser = argparse.ArgumentParser(description='Scrape LPSN Nomenclature')
parser.add_argument('outdir', help='Output Directory')
args = parser.parse_args()

# Valid name URLs
A_TO_C="http://www.bacterio.net/-allnamesac.html"
D_TO_L="http://www.bacterio.net/-allnamesdl.html"
M_TO_R="http://www.bacterio.net/-allnamesmr.html"
S_TO_Z="http://www.bacterio.net/-allnamessz.html"

# Candidatus and invalid name URLs
CANDIDATUS="http://www.bacterio.net/-candidatus.html"
INVALID="http://www.bacterio.net/-nonvalid.html"

def writeCSV(filename, taxa):
	filename=args.outdir + "/" + filename
	with open(filename, 'w') as csv_file:
		writer = csv.writer(csv_file, delimiter=' ')
		writer.writerows(taxa)

def writeTaxa(filename, taxa):
	filename=args.outdir + "/" + filename
	with open(filename, 'w') as text_file:
		for name in taxa:
			text_file.write((name.strip() + "\n"))

def writeSummary(filename, text):
	filename=args.outdir + "/" + filename
	with open(filename, "w") as text_file:
		text_file.write(text)

def writeHTML(filename, htmlText):
	filename=args.outdir + "/" + filename
	with open(filename, "w") as text_file:
		text_file.write(htmlText)

def summarizeSection(url, htmlFile, genusNames, speciesNames):
	myString = "Date: " + date.isoformat(datetime.today())  + "\n"
	myString += "Section URL: " + url + "\n"
	myString += "Local copy stored as: " + htmlFile + "\n"
	myString += "Number of genus names extracted: " + str(len(genusNames)) + "\n" 
	myString += "Number of species names extracted: " + str(len(speciesNames)) + "\n" 
	return myString

def getSection(urlString, sectionName):
	
	# Grab the html code from the url in urlString
	html = requests.get(urlString).text

	# Write html to file to have a local copy on hand
	html_output_file = "allnames_" + sectionName + ".html"
	writeHTML(html_output_file, html)

	soup = getSoup(html) # Create BeautifulSoup object for given html string

	species = getSpeciesSiblings(soup) # Species level taxonomic names, genus and species names are stored together as a 2D list element   
	genera = getGenera(soup) 

	# Write results to file
	species_output_file = "species_" + sectionName + ".txt"
	genus_output_file = "genera_" + sectionName + ".txt"        
	writeCSV(species_output_file,  species) 
	writeTaxa(genus_output_file, genera)    

	# Create Summary for Section
	sectionStats = summarizeSection(urlString, html_output_file, genera, species)
	return sectionStats
	
def getCandidatusNames(urlString):
		
	# Grab the html code from the url in urlString
	html = requests.get(urlString).text
	soup = getSoup(html) # Create BeautifulSoup object for given html string

	# Write html to file to have a local copy on hand
	html_output_file = "candidatus" +  ".html"
	writeHTML(html_output_file, html)

	candidatus = getCandidatus(soup) # Species level taxonomic names, genus and species names are stored together as a 2D list element   
	 # Write results to file
	candidatus_genus_output_file = "candidatus_genus.csv"
	candidatus_species_output_file = "candidatus_species.csv"
	candidatus_other_output_file = "candidatus_other.csv"

	writeCSV(candidatus_genus_output_file,  candidatus[0]) 
	writeCSV(candidatus_species_output_file,  candidatus[1]) 
	writeCSV(candidatus_other_output_file,  candidatus[2]) 


	# Create Summary for Section
	sectionStats = summarizeSection(urlString, html_output_file, candidatus[0], candidatus[1])
	return sectionStats

def getInvalidNames(urlString):

	# Grab the html code from the url in urlString
	html = requests.get(urlString).text
	soup = getSoup(html) # Create BeautifulSoup object for given html string

	# Write html to file to have a local copy on hand
	html_output_file = "invalid" +  ".html"
	writeHTML(html_output_file, html)

	invalid = getInvalid(soup) # Species level taxonomic names, genus and species names are stored together as a 2D list element
	 # Write results to file

	invalid_subspecies_output_file = "invalid_subspecies.txt"
	invalid_species_output_file = "invalid_species.txt"
	invalid_genus_output_file = "invalid_genus.txt"
	invalid_other_output_file = "invalid_other.txt"

	writeTaxa(invalid_subspecies_output_file,  invalid[0])
	writeTaxa(invalid_species_output_file,  invalid[1])
	writeTaxa(invalid_genus_output_file,  invalid[2])
	writeTaxa(invalid_other_output_file,  invalid[3])

	# Create Summary for Section
	sectionStats = summarizeSection(urlString, html_output_file, invalid[2], invalid[1])

	return sectionStats

if __name__ == "__main__":
	scraperStats = getSection(A_TO_C, "a-c")
	scraperStats += getSection(D_TO_L, "d-l")
	scraperStats += getSection(M_TO_R, "m-r")
	scraperStats += getSection(S_TO_Z, "s-z")
	scraperStats += getCandidatusNames(CANDIDATUS)
	scraperStats += getInvalidNames(INVALID)
	logFile =  date.isoformat(datetime.today()) + "_summary.txt"
	writeSummary( logFile , scraperStats)
