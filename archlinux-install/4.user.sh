pacman -S zsh
useradd -m -g users -G wheel -s /bin/zsh alan
passwd alan

#/etc/sudoers
#%wheel ALL=(ALL) ALL
usermod -a -G wheel alan

