#!/bin/bash

port=`cat port.txt`
new_port=$1

if [ -z $new_port ];then
    echo "first args should be port"
    exit 2
fi

sudo ufw allow $new_port/udp
sudo ufw delete allow $port/udp

sudo sed -i "s/${port}/${new_port}/" /usr/local/etc/v2ray/config.json

echo new_port > port.txt

sudo systemctl restart v2ray
