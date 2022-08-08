#!/bin/bash

DIR=`basename $PWD`
docker-compose down
docker rmi -f ${DIR}_web
docker-compose up -d