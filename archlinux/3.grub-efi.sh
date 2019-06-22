# https://wiki.archlinux.org/index.php/GRUB
pacman -S grub efibootmgr
# mbr
#grub-install --target=i386-pc /dev/sdX
grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=ArchLinux
grub-mkconfig -o /boot/grub/grub.cfg

