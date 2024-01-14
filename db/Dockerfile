FROM mysql:8.0.32

ENV MYSQL_DATABASE=database_9030
ENV MYSQL_ROOT_PASSWORD=Itmoitmo123

EXPOSE 3306:9030

COPY grant.sql /docker-entrypoint-initdb.d/
COPY glossary_db.sql /docker-entrypoint-initdb.d/