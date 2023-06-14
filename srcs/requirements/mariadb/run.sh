#!/bin/bash

mkdir -p /goinfre/habouiba/data
docker build -t testdb .
# docker run  --init --env-file=../../.env --hostname=habouiba testdb
docker run --mount type=bind,source=/goinfre/habouiba/data,target=/var/lib/mysql --init --env-file=../../.env --hostname=habouiba testdb
