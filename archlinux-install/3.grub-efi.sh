# https://wiki.archlinux.org/index.php/GRUB
pacman -S grub efibootmgr
# mbr
#grub-install --target=i386-pc /dev/sdX

# 如果这条报错，需要手动指定位置。
grub-install --recheck /dev/sda
#grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=ArchLinux
grub-mkconfig -o /boot/grub/grub.cfg

pacman -S dhcpcd
systemctl enable dhcpcd.service
