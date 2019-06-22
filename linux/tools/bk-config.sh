#!/bin/bash
# upate time: 2019-06-17 17:57
tar -czvf full-backup.tar.gz -C ~/.config .

target_dir=tar-archives-$(date +%Y%m%d)
mkdir -p ~/Documents/$target_dir
mv ./*.gz ~/Documents/$target_dir

# restore
#tar -xzf full-backup.tar.gz -C ~/.config

