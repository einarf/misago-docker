#!/usr/bin/env bash

echo "--- Cron job started at $(date) ---"

source /env.sh

python manage.py prunecategories
python manage.py buildactivepostersranking
python manage.py clearattachments
python manage.py clearreadtracker
python manage.py clearsessions
python manage.py invalidatebans
python manage.py deletemarkedusers
