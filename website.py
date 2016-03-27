from configparser import SafeConfigParser
from bottle import route, run, template, static_file, redirect
from pymongo import MongoClient
from random import randint
from cherrypy import wsgiserver

config = SafeConfigParser()
environment = SafeConfigParser()
config.read('config.ini')
environment.read('environment.ini')
development = environment.getboolean('environment', 'development')
db = MongoClient()[config.get('mongodb', 'db_name')]
register_count = 0

@route('/')
def index():

    # probably this is inefficient and slow, but oh well
    all_inactive_domains_cursor = db.domains.find({'status': 'inactive'}).limit(-1)
    count = all_inactive_domains_cursor.count()
    domains = []

    for x in range(0, 30):
        domain = all_inactive_domains_cursor[randint(0, count)]
        domains.append(domain['domain'])

    purchased = [ d['domain'] for d in
                  db.domains.find({'purchased_this_week': True}) ]

    return template(
        'index',
        page=1,
        domains=domains,
        purchased=purchased
    )

@route('/<page:re:\d+>')
def page(page):
    index = int(page) - 1

    if index < 0:
        return 'Out of range!'

    domains = [ d['domain'] for d in db.domains.find({'status': 'inactive'})
                .sort('length').skip(index * 30).limit(30) ]

    purchased = [ d['domain'] for d in
                  db.domains.find({'purchased_this_week': True}) ]

    return template(
        'index',
        page=int(page),
        domains=domains,
        purchased=purchased
    )

@route('/register/:domain')
def register(domain):
    global register_count
    register_count += 1

    # for Domainr API access
    if register_count >= 5:
        redirect(config.get('register', 'domainr').replace('{{d}}', domain))
        register_count = 0

    else:
        redirect(config.get('register', '101domain').replace('{{d}}', domain))
        register_count += 1

@route('/static/<fn>')
def static(fn):
    return static_file(fn, root='static')

def main():
    if development:
        run(host='localhost', port=3000, server="cherrypy")
    else:
        run(host='0.0.0.0', port=80, server="cherrypy")

if __name__ == '__main__':
    main()
