#!/usr/bin/env bash

# Dump all env vars so we can source them in cron jobs
printenv | sed 's/^\(.*\)$/export \1/g' > /env.sh

./scripts/wait_for_postgres.sh
python manage.py migrate
python manage.py collectstatic --noinput
python -m scripts.create_superuser

crontab crontab
cron -f &

uwsgi --ini uwsgi.ini
