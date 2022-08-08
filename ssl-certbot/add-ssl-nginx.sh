#!/bin/bash

[[ $EUID -ne 0 ]] && echo -e "Run script with sudoer\n" && exit 1
if ! cat /proc/version | grep -Eqi "ubuntu"; then
        echo -e "Run script with Ubuntu\n" && exit 1
fi
mkdir /etc/ssl/ssl-nginx
cp ./ssl/archive/ssl-nginx/fullchain1.pem /etc/ssl/ssl-nginx/fullchain.pem
cp ./ssl/archive/ssl-nginx/privkey1.pem /etc/ssl/ssl-nginx/privkey.pem
cat > /etc/nginx/conf.d/ctfd-443.conf << EOL
server {
  listen 443;
  server_name _;
  ssl on;
  ssl_certificate /etc/ssl/ssl-nginx/fullchain.pem;
  ssl_certificate_key /etc/ssl/ssl-nginx/privkey.pem;
  index  index.php index.html index.htm;
  root /var/www/html;
  client_max_body_size 20M;
  proxy_redirect off;
  location / {
    add_header       X-Served-By $host;
    proxy_set_header Host $host;
    proxy_set_header X-Forwarded-Scheme $scheme;
    proxy_set_header X-Forwarded-Proto  $scheme;
    proxy_set_header X-Forwarded-For    $remote_addr;
    proxy_set_header X-Real-IP          $remote_addr;
    proxy_pass http://127.0.0.1:82;
    proxy_read_timeout 15m;
    proxy_send_timeout 15m;
  }
  access_log /var/log/nginx/access_ctfd_ssl.log;
  error_log /var/log/nginx/error_ctfd_ssl.log;
}
EOL
service nginx restart
