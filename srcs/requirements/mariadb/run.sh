#!/bin/bash

docker build -t testdb .
docker run --mount type=bind,source=/goinfre/habouiba/data,target=/var/lib/mysql --init --env-file=../../.env --hostname=habouiba testdb
