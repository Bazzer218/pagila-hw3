FROM postgres:12

RUN apt-get update && apt-get install -y \
    less \
    make \
    vim

RUN mkdir /tmp/pagila-hw3
COPY . /tmp/pagila-hw3
WORKDIR /tmp/pagila-hw3

# copy over the pagila database;
# we rename the files so that they get executed in the correct order
COPY ./pagila/pagila-schema.sql /docker-entrypoint-initdb.d/01.sql
COPY ./pagila/pagila-data.sql /docker-entrypoint-initdb.d/02.sql
