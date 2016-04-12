from configparser import SafeConfigParser
from bottle import route, run, template, static_file, redirect, error
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

    count = db.domains.find({'status': 'inactive'}).limit(-1).count()
    domains = []

    if count > 0:
        # this is inefficient and slow, but oh well
        for x in range(0, 20):
            random = randint(0, count - 1)
            domain = db.domains.find({'status': 'inactive'}).skip(random).limit(1).next()
            domains.append(domain['domain'])

    return template('index', page=1, domains=domains)

@route('/about')
def about():
    purchased = [ d['domain'] for d in
                  db.domains.find({'purchased_this_week': True}) ]

    return template('about', purchased=purchased)

@route('/register/:domain')
def register(domain):
    redirect(config.get('register', '101domain').replace('{{d}}', domain))

@route('/static/<fn>')
def static(fn):
    return static_file(fn, root='static')

@route('/static/icons/<fn>')
def icons(fn):
    return static_file(fn, root='static/icons')

@route('/<any_route>')
def any(any_route):
    redirect('/')

def main():
    if development:
        run(host='localhost', port=3000, server="cherrypy")
    else:
        run(host='0.0.0.0', port=80, server="cherrypy")

if __name__ == '__main__':
    main()
