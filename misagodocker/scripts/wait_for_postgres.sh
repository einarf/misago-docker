#!/usr/bin/env bash
export PGPASSWORD=$POSTGRES_PASSWORD
RETRIES=10

until psql -h postgres -U $POSTGRES_USER -d $POSTGRES_DB -c "select 1" > /dev/null 2>&1 || [ $RETRIES -eq 0 ]; do
  echo "Waiting for postgres server, $((RETRIES--)) remaining attempts..."
  sleep 3
done
