#!/bin/bash

[[ $EUID -ne 0 ]] && echo -e "Run script with sudoer\n" && exit 1
if ! cat /proc/version | grep -Eqi "ubuntu"; then
        echo -e "Run script with Ubuntu\n" && exit 1
fi
find . -type f -not -name '*.sh' -delete
find . -type d -not -name '*.sh' -delete
docker pull certbot/certbot
docker rm -f ssl-certbot
docker run \
  -v "$PWD/ssl:/etc/letsencrypt:rw" \
  -v "/var/www/html:/data/html" \
  --name="ssl-certbot" certbot/certbot \
  certonly --webroot --webroot-path "/data/html" --non-interactive --agree-tos --email hypnguyen1209@gmail.com --cert-name "ssl-nginx" -d ctf.infosecptit.club
