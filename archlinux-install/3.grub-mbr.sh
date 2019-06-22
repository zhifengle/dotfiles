# https://wiki.archlinux.org/index.php/GRUB
pacman -S grub
# mbr
grub-install --target=i386-pc /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg

