#!/bin/bash

[[ $EUID -ne 0 ]] && echo -e "Run script with sudoer\n" && exit 1
if ! cat /proc/version | grep -Eqi "ubuntu"; then
	echo -e "Run script with Ubuntu\n" && exit 1
fi
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
rm -f get-docker.sh
