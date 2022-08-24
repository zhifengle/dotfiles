#dd if=/dev/zero of=/dev/sda bs=16M
# parted
parted /dev/sda
#mklabel gpt
#mkpart primary 1Mib 512MiB
#mkpart primary 512M -1
#set 1 boot on

mkfs.vfat -F32 /dev/sda1
mkfs.ext4 /dev/sda2

mount /dev/sda2 /mnt
mkdir -p /mnt/boot/efi
mount /dev/sda1 /mnt/boot/efi

### mirror
#grep -A 1 'China' /etc/pacman.d/mirrorlist | grep -v '\-\-' > mr
#cat /etc/pacman.d/mirrorlist >> mr
#cat mr >> /etc/pacman.d/mirrorlist

# 现在China源没有内置了
# mirror.tuna.tsinghua.edu.cn
vim /etc/pacman.d/mirrorlist

pacman -Syy

pacstrap -i /mnt linux base linux linux-firmware base-devel

genfstab -U /mnt >> /mnt/etc/fstab

