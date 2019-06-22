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
grep -A 1 'China' /etc/pacman.d/mirrorlist | grep -v '\-\-' > mr
cat /etc/pacman.d/mirrorlist >> mr
cat mr >> /etc/pacman.d/mirrorlist
pacstrap -i /mnt base base-devel

genfstab -U /mnt >> /mnt/etc/fstab

