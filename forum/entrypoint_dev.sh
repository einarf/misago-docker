#!/usr/bin/env bash
./wait_for_postgres.sh
./manage.py migrate
./create_superuser.py
# In prod we want to configure cron here
./manage.py runserver 0.0.0.0:80
