# Hipster Domains

![screenshot][screenshot]

## What

Find short & sweet single word domain hacks with Hipster Domains at
[Hipster.Domains][hd]. All domains listed should be available for
registration.  Originally created by [Bram Hoskin](https://github.com/bramgg/), now maintained by [Daniel Haaser](https://github.com/djh-).

## Development

### General

Requirements for Hipster Domains are Python 3 and MongoDB. Environment management is handled with [virtualenv][virtualenv]. 

### Installation

1. Install Python 3. This can be done with [Homebrew][homebrew] on OSX or `apt-get` on Ubuntu.
2. Install virtualenv with `pip install virtualenv`.
3. Create a virtual environment within the project directory. Navigate to the project directory, and execute `virtualenv -p python3 venv`. This will create a virtual environment named *venv*, configured to use Python 3.
4. Activate the virtual environment by running `source venv/bin/activate`.
5. Install the project dependencies with `pip install -r requirements.txt`.
6. [Install MongoDB][mongo_install] and activate it with `mongod`.


Hipster Domains is ready to be used locally. Just run
[populate_db.py][populate_db] to populate the database with 100 domain hacks.
Note this is for testing purposes only and the domains will be marked as
available without any verification. In production use [update.py][update] as
described below.

### Domains

[update.py][update] calculates all possible domain hacks from words in
[words.txt][words] and inserts/updates their availability with [Domainr's
API][domainr] (API key must be set in [environment.ini][environment]). [update.py][update] uses [schedule][schedule] to check domain availability every 24 hours.

[words.txt][words] is supposedly the 50,000 most common english words on the
internet, though I can't remember where I got it. Adding or changing words is as
simple as changing [words.txt][words].

### Website

Hipster Domains' official website is intentionally very simple inside and out.
[website.py][website] handles routing and serving dynamic/static content. HTML
is in [views][views] and CSS is in [static][static].

[hd]: http://www.hipster.domains
[screenshot]: screenshot.png
[virtualenv]: https://virtualenv.pypa.io/en/latest/
[homebrew]: http://brew.sh/
[mongo_install]: https://docs.mongodb.org/manual/installation/
[domainr]: https://market.mashape.com/domainr/domainr
[populate_db]: populate_db.py
[update]: update.py
[words]: words.txt
[environment]: environment.ini
[website]: website.py
[schedule]: https://github.com/dbader/schedule
[views]: views
[static]: static
