#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os
import re
import subprocess

home=subprocess.check_output('echo {}'.format("$HOME"), shell=True).decode('utf-8').replace('\n', '')
GIT_DIR = os.path.join(home, 'my-projects/git_repos')
counter = 0
exlude_lists = ['Programming', 'jquery', 'simple_calc', 'lifandb', 'angular' ]

def is_git_dir(path):
    return True if '.git' in os.listdir(path) else False


def upgrade_repository():
    global counter
    os.chdir(GIT_DIR)
    for x in os.listdir('.'):
        if re.search(r'|'.join(exlude_lists), x):
            continue
        path = os.path.join(GIT_DIR, x)
        if os.path.isdir(path) and is_git_dir(path):
            print('upgrade project: {0}'.format(x))
            counter += 1
            os.chdir(path)
            os.system('git pull')

upgrade_repository()
# var = 'foobar'
# first = subprocess.Popen(['/bin/echo', var], stdout=subprocess.PIPE)
print('{0} prjects have upgraded'.format(counter))
