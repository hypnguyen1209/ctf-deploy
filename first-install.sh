#!/bin/bash

[[ $EUID -ne 0 ]] && echo -e "Run script with sudoer\n" && exit 1
if ! cat /proc/version | grep -Eqi "ubuntu"; then
	echo -e "Run script with Ubuntu\n" && exit 1
fi
apt update
apt upgrade -y
apt install -y \
	build-essential \
	python3-pip \
	python3-venv \
	make \
	unzip \
	zip \
	tar \
	lsb-release \
	ca-certificates \
	apt-transport-https \
	software-properties-common \
	nginx \
	gnupg

