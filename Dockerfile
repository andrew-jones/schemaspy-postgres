FROM openjdk:8-jre

ENV VERSION 6.1.0

RUN apt-get update && \
    apt-get install -y --no-install-recommends graphviz && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN wget https://github.com/schemaspy/schemaspy/releases/download/v$VERSION/schemaspy-$VERSION.jar -O schemaSpy.jar
RUN wget https://jdbc.postgresql.org/download/postgresql-42.2.6.jar -O postgresql.jar

VOLUME /output

ENTRYPOINT [ "java", "-jar", "schemaSpy.jar", "-t", "pgsql", "-o", "/output", "-dp", "postgresql.jar" ]

CMD [ "-host", "database", "-port", "5432", "-db", "postgres", "-u", "postgres", "-p", "postgres" ]
