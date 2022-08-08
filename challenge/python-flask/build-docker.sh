#!/bin/bash

docker rm -f python-flask-web
docker rmi -f python-flask
docker build -t python-flask .
docker run -v `pwd`/src:/app:ro -d -p 127.0.0.1:9003:1337 --name python-flask-web python-flask