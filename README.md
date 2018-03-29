
misago-docker
=============

A simple development setup when working with [Misago](https://github.com/rafalp/Misago). 
The plan is to also include a basic production setup as well.

The development setup runs the basic containers needed and maps the source
from the host into the container. This means that local changes will instantly
be reflected in the container as well.

# Setup Info

* `docker-compose.yaml` configures all the containers/services
* The `.env` file in the root contains variables that will be injected
  into the `docker-compose.yaml` template.
* We pass along these variables to the services
* The `postgres` image will automatically create an empty database
  with the name and the user specified
* If you want to re-create the database, simply delete the old one and
  restart the postgres service

# Development setup

To build and run the services:

```bash
docker-compose build
docker-compose up -d
```

If everything goes after the plan, the forum is available at `http://localhost:8000/`.
It might take some time for migrations to complete initially, so use `docker-compose logs -f forum`
to track the progress if needed.

## Useful Scripts

In forum service:

* `wait_for_postgres.sh` waits until postgres responts to queries
* `db.sh` runs `psql` authenticating with credentials in environment variables
* `entrypoint_dev.sh` runs Misago in development mode waiting for postgres and performing migrations

# Basic Compose Usage

After running services we can check their status with:

```bash
docker-compose ps
```

Entering the forum container in bash:

```bash
docker-compose exec forum bash
```

Manually running the misago container:

```bash
docker-compose run --rm --service-ports forum bash
```

## In a more perfect world we would ...

Do note that it's probably more common and also wise to have the `forum` package
in a separate repository. The compose setup alone would be its own repository
configuring all the services for a specific server (as we are dealing with docker standalone here).

In a perfect world we would have our build system (such as Jenkins) to build
docker images for us adding them to our private docker image repository. If
properly tagged we can then get our compose setup to fetch them. You can also
extend these images by adding another layer with configuration files, but
note that this needs a different approach in clustered environments.
