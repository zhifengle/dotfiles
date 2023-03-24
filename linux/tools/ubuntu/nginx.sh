#!/bin/bash

#http://nginx.org/en/linux_packages.html#Ubuntu
sudo apt install curl gnupg2 ca-certificates lsb-release ubuntu-keyring -y
curl https://nginx.org/keys/nginx_signing.key | gpg --dearmor | sudo tee /usr/share/keyrings/nginx-archive-keyring.gpg >/dev/null
gpg --dry-run --quiet --no-keyring --import --import-options import-show /usr/share/keyrings/nginx-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/nginx-archive-keyring.gpg] \
http://nginx.org/packages/ubuntu `lsb_release -cs` nginx" \
    | sudo tee /etc/apt/sources.list.d/nginx.list

sudo apt update
sudo apt install nginx

# nginx log.1;
#script_path=/opt/script
#mkdir -p $script_path
#cp ./conf/crontab/nginx_cut_access.sh $script_path/nginx_cut_access.sh
#crontab -l | { cat; echo "0 0 * * 1 /bin/bash nginx_cut_access.sh"; } | crontab -


# install v2ray
sudo bash <(curl -L https://raw.githubusercontent.com/v2fly/fhs-install-v2ray/master/install-release.sh)
