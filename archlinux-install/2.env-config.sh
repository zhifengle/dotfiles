pacman -S git vim
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
hwclock --systohc
echo -e "en_US.UTF-8 UTF-8\nzh_CN.UTF-8 UTF-8\nzh_TW.UTF-8" >> /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf
echo "myarch" > /etc/hostname
host='
127.0.0.1	localhost
::1		localhost
127.0.1.1	myarch.localdomain	myarch
'
echo "$host" > /etc/hosts

