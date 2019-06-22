#!/usr/bin/env python
# -*- coding: utf-8 -*-

import requests
import subprocess
import re

END_STR = "# my setting end"
BEGIN_STR = '# Amazon AWS Start'
subprocess.call(['cp', '-f', '/etc/hosts', '~/hosts-bak'], shell=True)

def get_hosts():
    header = {
            'User-Agent': "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36"
            }
    url = 'https://raw.githubusercontent.com/googlehosts/hosts/master/hosts-files/hosts'
    r = requests.get(url, headers=header)
    if r.status_code is 200:
        print('200')
        return r.text
    else:
        print('there are some problems')
        exit(1)


def w_file(n):
    with open('/etc/hosts', 'wb') as f:
        f.write(n)


def deal_hosts_1():
    raw_hosts_text = get_hosts()
    if not re.search(BEGIN_STR, raw_hosts_text):
        exit(1)
    hosts_info = bytes(raw_hosts_text, 'utf8')
# get the line number of target str
    p_get_num = subprocess.Popen(['grep', '-n', BEGIN_STR],
            stdout=subprocess.PIPE,
            stderr=subprocess.STDOUT,
            stdin=subprocess.PIPE,
            # universal_newlines=True
            )
    num = int(p_get_num.communicate(hosts_info)[0].split(b':')[0])
# remove useless part
    p = subprocess.Popen(['sed', '1,%dd' %(num-1)],
            stdout=subprocess.PIPE,
            stderr=subprocess.STDOUT,
            stdin=subprocess.PIPE
            )
    return p.communicate(hosts_info)[0]


def deal_hosts():
    num = 13
    p = subprocess.Popen(['sed', '1,%dd' %(num)], stdout=subprocess.PIPE, stderr=subprocess.STDOUT, stdin=subprocess.PIPE)
    return p.communicate(bytes(get_hosts(), 'utf8'))[0]


line = subprocess.check_output(['grep', '-n',
    END_STR, '/etc/hosts'])
num = int(line.split(b':')[0])
print('my setting end line num is %s' %num)
w_file(subprocess.check_output(['sed', str(num+1) + ',$d', '/etc/hosts']) + deal_hosts_1())
print('success to modify the hosts')
subprocess.call('systemctl restart systemd-networkd.service',
        shell=True)
# command = 'cat < hosts > /etc/hosts'
# subprocess.Popen('sudo sh -c "%s"' %(command), shell=True).communicate('')
