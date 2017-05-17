# schemaspy-postgres

Docker image for running SchemaSpy with PostgreSQL.

## SchemaSpy

Version: 6.0.0-rc1

* http://schemaspy.org/
* https://github.com/schemaspy/schemaspy

## PostgreSQL

Version: tested on 9.6

* https://www.postgresql.org/

## Running

### docker

```
docker run --rm andrewjones/schemaspy-postgres:latest -host=database -port=5432 -u=postgres -p=postgres -db=dbname -s=public
```

### docker-compose

```
schemaspy:
  image: andrewjones/schemaspy-postgres:latest
  command: ["-host=database", "-port=5432", "-u=postgres", "-p=postgres", "-db=dbname", "-s=public"]
  volumes:
    - ./docs/schemaspy:/output
  links:
    - database:database
```
