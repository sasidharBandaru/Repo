import csv
import json
import requests

csv_read = csv.DictReader(open('/home/sasirocks/Sasi/Cognizant/Project/Backend_Data.csv', 'r'), delimiter =',')
csv_w = csv.writer(open('/home/sasirocks/Sasi/Cognizant/Project/book_id_with_amazon_ids.csv','w'), delimiter='|')
header = ['Book_id', 'Amazon_id', 'url']
csv_w.writerow(header)
for row in csv_read:
	isbn = str(row['ISBN'])
	url='https://openlibrary.org/api/volumes/brief/isbn/'+isbn+'.json'
	json_file = requests.get(url)
	json_data = json_file.json()
	if json_data:
		print(url)
		for data in json_data['records']:
			records_data = json_data['records'][data]
			break
		source_data = records_data.get('details','').get('details','').get('source_records','')
		for source in source_data:
			if 'amazon' in source:
				amazon_id = source.split(':')[1]
				author_name = row['Authors'].replace(' ', '-')
				amazon_url = "https://www.amazon.com/"+author_name+"/dp/"+amazon_id
				csv_w.writerow([row['Id'],amazon_id, amazon_url])
				break
	
