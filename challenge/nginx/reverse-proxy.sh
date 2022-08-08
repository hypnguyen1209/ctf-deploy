#!/bin/bash

[[ $EUID -ne 0 ]] && echo -e "Run script with sudoer\n" && exit 1
if ! cat /proc/version | grep -Eqi "ubuntu"; then
	echo -e "Run script with Ubuntu\n" && exit 1
fi
cp conf/* /etc/nginx/conf.d
cp nginx.conf /etc/nginx/nginx.conf
rm -f /etc/nginx/sites-enabled/*
service nginx restart
