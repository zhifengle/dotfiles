#!/bin/bash


if ! command -v sudo &> /dev/null
then
    echo "sudo could not be found. Installing sudo..."
    sudo apt-get update
    sudo apt-get -y install sudo
    echo "sudo has been installed."
else
    echo "sudo is already installed."
fi

echo "set mouse=
set ttymouse=
" | sudo tee /etc/vim/vimrc