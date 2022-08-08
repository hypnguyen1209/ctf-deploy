#!/bin/bash

[[ $EUID -ne 0 ]] && echo -e "Run script with sudoer\n" && exit 1
if ! cat /proc/version | grep -Eqi "ubuntu"; then
	echo -e "Run script with Ubuntu\n" && exit 1
fi
find . -type f -not -name 'install.sh' -delete
find . -type d -not -name 'install.sh' -delete
wget -qO- https://github.com/CTFd/CTFd/archive/refs/heads/master.zip -O CTFd.zip >/dev/null && echo 'CTFd.zip downloaded'
unzip CTFd.zip >/dev/null && echo 'CTFd.zip unzipped'
mv CTFd-master/* ./
rm -rf CTFd-master
rm -f CTFd.zip
sed -i 's/80:80/127.0.0.1:82:80/' docker-compose.yml
sed -i 's/\"8000/\"127.0.0.0:8000/' docker-compose.yml
echo 'done'
docker-compose up -d
