#!/bin/bash

# https://caddyserver.com/docs/install#debian-ubuntu-raspbian

sudo apt install -y debian-keyring debian-archive-keyring apt-transport-https xz-utils
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/gpg.key' | sudo gpg --dearmor -o /usr/share/keyrings/caddy-stable-archive-keyring.gpg
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/debian.deb.txt' | sudo tee /etc/apt/sources.list.d/caddy-stable.list
sudo apt update
# apt-cache madison caddy
sudo apt install caddy

# print default
# sudo -u caddy caddy environ
# $HOME/.local/share/caddy
# tar -xf archive.tar.xz

#wget https://github.com/klzgrad/forwardproxy/releases/download/caddy2-naive-20221007/caddy-forwardproxy-naive.tar.xz
#tar -xf caddy-forwardproxy-naive.tar.xz
#cd caddy-forwardproxy-naive

curl -sLf https://github.com/zhifengle/gm_scripts/releases/download/v0.4.0/caddy-linux-amd64.tar.gz -o caddy-linux-amd64.tar.gz
mkdir caddy-linux-amd64
tar -xf caddy-linux-amd64.tar.gz -C ./caddy-linux-amd64
cd caddy-linux-amd64


cp /usr/bin/caddy ./caddy-bk
sudo cp -f ./caddy /usr/bin/caddy
sudo mkdir -p /var/www/caddy
sudo chown -R caddy /var/www/caddy
sudo chgrp -R caddy /var/www/caddy

# sudo -u caddy cp -r /var/lib/caddy/.local/share/caddy /var/www/caddy