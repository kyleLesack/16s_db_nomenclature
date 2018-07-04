#! /usr/bin/env python
# -*- coding: utf-8 -*-

import requests 
from requests.auth import HTTPBasicAuth

genus_url = 'https://bacdive.dsmz.de/api/pnu/genus/'
taxon_urls= {"genera": "http://bacdive.dsmz.de/api/pnu/genus/", "reclassified": "http://bacdive.dsmz.de/api/pnu/reclassified/", "species": "http://bacdive.dsmz.de/api/pnu/species/"} 


class PNUClient(object):  
#     REST Client for PNU Web Services.
#    
#     The attributes of the class are:
#     * ``headers`` -- sets the content-type of the HTTP request-header to json
#     * ``credentials`` -- attaches the username and the password to HTTPBasicAuth for using with the `requests` library

	def __init__(self, headers, USERNAME, PASSWORD):
		self.headers = headers
		self.USERNAME=USERNAME
		self.PASSWORD=PASSWORD
		self.credentials = HTTPBasicAuth(USERNAME, PASSWORD)    

#   _____________________________________________________________________________________________________________________________________           
	def getReclassifiedByGenus(self,genus):     
#         to get a list of all species that have been reclassified retrieved by genusname

#         INPUT:  
		response = requests.get(
			'https://bacdive.dsmz.de/api/pnu/reclassified/?contains=%s' % (genus),
			headers=self.headers,
			auth=self.credentials
		)

		if response.status_code == 200:
			results = response.json()

#             OUTPUT: 
#             object of type 'dict' with the fields 'count', 'previous', 'results', 'next'
#             the results in field 'results' are separated by ',' e.g. {result1},{result2},{result3},etc
			return results

#   _____________________________________________________________________________________________________________________________________
	def getGenera(self):
		genera = []
#         to get all genera , but only for the first page.
#         to consider the other pages, you have to change the url to 'https://bacdive.dsmz.de/api/pnu/genus/?page=2' etc.

#         INPUT:
		response=requests.get(
			'https://bacdive.dsmz.de/api/pnu/genus/',headers=self.headers,auth=self.credentials)

		if response.status_code == 200:
			results = response.json()

#             OUTPUT:
#             object of type 'dict' with the fields 'count', 'previous', 'results', 'next'
#             the different genera in field 'results' are separated by ',' e.g. {genus1},{genus2},{genus3},        

			genus_results = results['results']
			for line in genus_results:
				genus = line['label']
				genera.append(genus)				
			
			next_page = results['next']		
			if next_page:
				print(next_page)					

#			return results
			return genera

#   _____________________________________________________________________________________________________________________________________
	def getTaxon(self,rank):
		taxa = []
		rank_url = taxon_urls[rank]

#         to get all taxa for the rank , but only for the first page.
#         to consider the other pages, you have to change the url to 'https://bacdive.dsmz.de/api/pnu/genus/?page=2' etc.

#         INPUT:
		results = self.getPage(rank_url)

#             OUTPUT:
#             object of type 'dict' with the fields 'count', 'previous', 'results', 'next'
#             the different genera in field 'results' are separated by ',' e.g. {genus1},{genus2},{genus3},        


		if results:


#			print('Progress: .', end='', flush=True)
			taxon_results = results['results']
			for line in taxon_results:
				taxon = line['label']
				taxa.append(taxon)				
			
			next_page = results['next']		

			while next_page:
#				print('.', end='', flush=True)
				results = self.getPage(next_page)
				taxon_results = results['results']		
			
				for line in taxon_results:
					taxon = line['label']
					taxa.append(taxon)				
			
				next_page = results['next']		



#			return results
			return taxa

#   _____________________________________________________________________________________________________________________________________
	def getPage(self, url):
#         INPUT:
		response=requests.get(
			url,headers=self.headers,auth=self.credentials)

		if response.status_code == 200:
			results = response.json()


			return results
		else:
			print("Wrong URL: " + " " + url)
