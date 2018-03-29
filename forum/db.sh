#!/usr/bin/env bash
PGPASSWORD=$DB_PASS psql --username $DB_USER --host $DB_HOST $DB_NAME
