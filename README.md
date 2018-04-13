
misago-docker
=============

A docker standalone compose setup for running [Misago](https://github.com/rafalp/Misago) with dependecies.

This setup configures and runs for following services:

* Misago
* Postgres
* Redis
* Nginx (reverse proxy)

## Configuring Postgres

Edit credentials  in `postgres.env`.

```bash
POSTGRES_USER=misago
POSTGRES_PASSWORD=misago
POSTGRES_DB=misago
```

## Configure Misago

Edit the `misagodocker.env` file.

```bash
MISAGO_SUPERUSER_USERNAME=admin
MISAGO_SUPERUSER_PASSWORD=qwertyuiop
MISAGO_SUPERUSER_EMAIL=admin@examples.com
```

Set the correct virtualhost name for your forum. It can take multiple comma separated values if needed (no spaces).

```bash
VIRTUAL_HOST=misago.test
```

Replace the secret key with [this secret key generator](https://www.miniwebtool.com/django-secret-key-generator/).

```
SECRET_KEY=replaceme
```

## Running Stuff

Start the compose setup and the forum should be available at the virtualhost name shortly.

```
docker-compose up -d
```
