#!bin/bash

# check crontab -e for how this gets activated
git pull
source venv/bin/activate
python website.py
