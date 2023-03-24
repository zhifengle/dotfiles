#!/bin/bash

apps_list = ""

if ! command -v sudo &> /dev/null
then
    apt-get update
    apt-get -y install sudo
else
    echo "sudo is already installed."
fi

sudo apt-get update
sudo apt-get -y install "curl vim $apps_list"

sudo tee -a /etc/vim/vimrc << EOF
set ttymouse=
set mouse=
EOF
