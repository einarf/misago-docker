#!/usr/bin/env bash
PGPASSWORD=$POSTGRES_PASSWORD psql --username $POSTGRES_USER --host postgres $POSTGRES_NAME
