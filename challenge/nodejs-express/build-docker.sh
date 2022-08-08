#!/bin/bash

docker rm -f nodejs-express-web
docker rmi -f nodejs-express
docker build -t nodejs-express .
docker run -p 127.0.0.1:9001:1337 --name nodejs-express-web nodejs-express 