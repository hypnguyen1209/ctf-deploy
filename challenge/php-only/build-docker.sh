#!/bin/bash

docker rm -f php-only-web
docker rmi -f php-only
docker build -t php-only .
docker run -v `pwd`/src:/var/www/html:ro -d -p 127.0.0.1:9002:80 --name php-only-web php-only
