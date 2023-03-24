#!/bin/bash

curl -sLf https://github.com/h5bp/server-configs-nginx/archive/refs/heads/main.zip -o nginx.zip
unzip nginx.zip

sudo systemctl stop nginx
sudo mkdir /var/www

# need relogin ?
# useradd -s /bin/false www-data
sudo usermod -a -G www-data $USER
# sudo chown -R www-data:www-data /var/www
sudo chgrp -R www-data /var/www
sudo chmod -R g+r /var/www

#[[ "$PWD" =~ /scripts$ ]] && cd ..

if [ -d "server-configs-nginx-main" ]; then
    sudo rm -rf /etc/nginx-*
    sudo mv /etc/nginx "/etc/nginx-$(date +"%Y_%m_%d-%H%M%S")"
    sudo cp -r ./server-configs-nginx-main /etc/nginx
else
    rm -rf /etc/nginx/conf.d/default*
fi

echo "finish; need relogin"