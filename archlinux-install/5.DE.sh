#!/bin/bash

getList() {
    if [[ -z $1 ]]; then
        echo new list
        return 2
    fi
    list=$(echo "$1" | grep -v -e "^#" -e "^$")
    echo "$list"
}

de_basic='
xorg
# xorg-server
# xorg-apps
xorg-xinit
xf86-input-synaptics
i3 
xfce4
xfce4-screenshooter
lightdm lightdm-gtk-greeter
xautolock
'
# https://wiki.archlinux.org/index.php/Xorg
# lspci | grep -e VGA -e 3D
driver='
'
softwares='
rofi tmux xsel ttf-dejavu wqy-zenhei wqy-microhei adobe-source-code-pro-fonts
# network-manager-applet
# networkmanager
p7zip
unrar
xsel

## other
compton
# cowsay
# dmenu
# notification daemon
dunst
feh
# 位置
# geoclue
# 双击查看 压缩文件?
file-roller
gnome-keyring
gnome-themes-standard
# gnupg
gpicview
gst-libav
gst-plugins-bad
gst-plugins-base
gst-plugins-good
gst-plugins-ugly
gvfs
# thunar
thunar-archive-plugin
# thunar-volman
# power xfce4 已自带?
# tlp
'
aur_packages='
pulseaudio
# 音量
pa-applet-git
'
unknown='
# xfce4 group
# tumbler
# mirror list
reflector
# Adjusts the color temperature of your screen according to your surroundings.
redshift
# Interactive process viewer
htop
'

aa=$(getList "$de_basic")
bb=$(getList "$softwares")
pacman -S $aa $bb
## autologin

## archlinuxcn
# /etc/pacman.conf
#[archlinuxcn]
##The Chinese Arch Linux communities packages.
#SigLevel = Optional TrustedOnly
#Server   = https://mirrors.ustc.edu.cn/archlinuxcn/$arch
# pacman -S archlinuxcn-keyring


## vmware-tools
#pacman -S open-vm-tools

# 让tty支持中文 是否过时？
#sudo pacman -S fbterm
#sudo gpasswd -a YOUR_USERNAME video



