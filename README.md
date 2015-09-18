```
docker run --name db -d -e 'DB_USER=dbuser' -e 'DB_PASS=dbpass' -e 'DB_NAME=dbname' sameersbn/mysql:latest
docker exec -i db mysql -v dbname < ../findsorguk/sql/currentStructure/*.sql
docker run --name web -d findsorguk/web
```

Register (e.g. as user "admin")

```
docker exec -i db mysql -v dbname -e 'UPDATE users SET role="admin" WHERE username="admin";'
```

