#!/bin/bash

echo "set proxy"
export ALL_PROXY=socks5://127.0.0.1:1080
echo "set proxy end"

targetDir=`pwd`
for p in `find $targetDir -maxdepth 2 -name ".git" -type d` ; do
    cd `dirname $p`
	#git checkout master
    git pull
	#git fetch origin/master
done
