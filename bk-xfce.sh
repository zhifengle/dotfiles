# https://www.addictivetips.com/ubuntu-linux-tips/back-up-the-xfce4-desktop-settings-linux/
# tar -czvf full-backup.tar.gz ~/.config
mkdir -p ~/Desktop/xfce-desktop-backup

mkdir -p ~/Desktop/xfce-desktop-backup/thunar

mkdir -p ~/Desktop/xfce-desktop-backup/xfce-settings

cp -R ~/.config/Thunar/ ~/

cp -R ~/.config/xfce4/ ~/

mv ~/xfce4 ~/Desktop/xfce-desktop-backup/xfce-settings

mv ~/Thunar ~/Desktop/xfce-desktop-backup/xfce-settings
# backup for xubuntu
mkdir -p ~/Desktop/xfce-desktop-backup/xubuntu-settings

cp -R ~/.config/xubunu~ ~/

mv xubuntu ~/Desktop/xfce-desktop-backup/xubuntu-settings

# tar
tar -czvf xfce4-backup.tar.gz ~/Desktop/xfce-desktop-backup

## icons and themes
tar -czvf icons-backup.tar.gz  /usr/share/icons

tar -czvf themes-backup.tar.gz /usr/share/themes/

target_dir=tar-archives-$(date +%Y%m%d)
mkdir -p ~/Documents/$target_dir
mv ./*.gz ~/Documents/$target_dir

