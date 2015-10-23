## Quick setup

This assumes that a recent checkout of the findsorguk repository is at
``../findsorguk``.

```
docker run --name db -d -e 'DB_USER=dbuser' -e 'DB_PASS=dbpass' -e 'DB_NAME=dbname' sameersbn/mysql:latest
docker exec -i db mysql -v dbname < ../findsorguk/sql/database.sql
docker exec -i db mysql -v dbname < ../findsorguk/sql/populateTables.sql
docker run -P --name web -d findsorguk/web
```

Create the admin user (password is "l3tm31n").

```
docker exec -i db mysql -v dbname < web/adminUser.sql
```

Use ``docker ps`` to discover which port web server is running on.

