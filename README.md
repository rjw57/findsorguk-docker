# Docker images for Portable Antiquities Scheme

This repository houses Dockerfiles for images useful for getting a development
environment up for working on the Portable Antiquities Scheme database code.
(The live version of this code is currently running at https://finds.org.uk/.)

The images use Docker's orchestration support to allow the database to live in a
separate container from the web frontend. This allows the web frontend container
to be removed/rebuilt without affecting the database.

## Quick setup

These instructions assume that a recent checkout of the findsorguk repository is
at ``$FINDS_ORG_UK_REPO``, this image's source repository is at ``$REPO``
and that you have a working [docker](https://docker.com/) install.

```
# Get docker images
docker pull sameersbn/mysql:latest
docker pull rjw57/findsorguk:latest

# Start the database container
docker run --name db -d -e 'DB_USER=dbuser' -e 'DB_PASS=dbpass' \
	-e 'DB_NAME=dbname' sameersbn/mysql:latest

# Initialise the database
docker exec -i db mysql -v dbname <${FINDS_ORG_UK_REPO}/sql/database.sql
docker exec -i db mysql -v dbname <${FINDS_ORG_UK_REPO}/sql/populateTables.sql

# Creates an initial user with login/password = admin/l3tm31n
docker exec -i db mysql -v dbname <${REPO}/adminUser.sql

# Start the website container
docker run -P --name web -d rjw57/findsorguk:latest
```

Use ``docker ps`` to discover which port the web server is running on. There
should be a record of the form ``0.0.0.0:XXXX->80/tcp`` where ``XXXX`` is the
port number. Open http://localhosy:XXXX in your web browser and log in as the
admin user.

## Development

If you want to start development on the server you can launch a shell:

```
docker exec -it web /bin/bash
```

``git`` is installed inside the container and the source is at
``/var/www/findsorguk``. You can use ``git format-patch`` to export your changes
as patches which can be applied outside of the container.

