The files in the nomenclature folder were created from the Greengenes (v. 13_5) taxonomy file

To recreate the nomenclature results, the extractNomenclature.py script can be used. The script requires the Greengenes taxonomy file gg_13_5_taxonomy.txt, which can be downloaded from: http://greengenes.secondgenome.com/downloads/database/13_5

The name only files can be created via the Bash cut command:

cat nomenclature/genera.csv | cut -f 2 -d "," | sort -u



