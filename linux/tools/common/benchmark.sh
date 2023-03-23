#!/bin/bash

wget https://github.com/maintell/webBenchmark/releases/download/0.6/webBenchmark_linux_x64 && chmod 755 webBenchmark_linux_x64 && ./webBenchmark_linux_x64 -c 512 -s 'https://shgxjy.oss-cn-shanghai.aliyuncs.com/pic/Photo/Picture_r0a04axokfek.jpg' -r 'https://www.shgxjy.com/'


wget -O /dev/null http://cachefly.cachefly.net/100mb.test