#!/bin/bash

wget https://github.com/XIU2/CloudflareSpeedTest/releases/download/v2.1.0/CloudflareST_linux_amd64.tar.gz
mkdir st && tar -zxf ./CloudflareST_linux_amd64.tar.gz -C ./st
cd ./st/
#vim ip.txt
./CloudflareST -dd -dn 100 -tll 100
