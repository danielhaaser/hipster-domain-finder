# Read all available domains from the database

from configparser import SafeConfigParser
from pymongo import MongoClient

config = SafeConfigParser()
config.read('config.ini')
db = MongoClient()[config.get('mongodb', 'db_name')]

def main():
    domains = [ d['domain'] for d in db.domains.find({'status': 'inactive'})
                .sort('length')]

    print('found ' + str(len(domains)) + ' inactive domains')

    output_file = open('all_inactive_domains.txt', 'w')

    for domain in domains:
        output_file.write(domain + ', ')

if __name__ == '__main__':
    main()