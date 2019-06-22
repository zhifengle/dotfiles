#!/bin/bash

de="xorg i3 xfce4 lightdm lightdm-gtk-greeter xorg-server"
softwares="rofi tmux xsel ttf-dejavu wqy-zenhei wqy-microhei"

## autologin

## archlinuxcn
# /etc/pacman.conf
#[archlinuxcn]
##The Chinese Arch Linux communities packages.
#SigLevel = Optional TrustedOnly
#Server   = https://mirrors.ustc.edu.cn/archlinuxcn/$arch
pacman -S archlinuxcn-keyring


## vmware-tools
#pacman -S open-vm-tools

# 让tty支持中文 是否过时？
#sudo pacman -S fbterm
#sudo gpasswd -a YOUR_USERNAME video



