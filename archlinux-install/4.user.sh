pacman -S zsh
useradd -m -g users -G wheel -s /bin/zsh alan
passwd alan

usermod -a -G wheel alan

# 找到 wheel 取消注释
vim /etc/sudoers
#%wheel ALL=(ALL) ALL
