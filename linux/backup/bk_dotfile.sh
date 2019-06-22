#!/bin/bash

function backup_nuts() {
    for line in `cat ~/backup/dotfiles`; do
        if [[ $line ]]; then
            cp --parents -u $HOME/$line ~/Nutstore/
        fi
    done
}

dotfiles="
.zshrc
.zsh_aliases
.xprofile
.profile
.xinitrc
.i3status.conf
.yaourtrc
.gtkrc*

.vim/vimrc
.pentadactylrc
.vimperatorrc
.ideavimrc

.tern-config
.npmrc
.nvmrc
.tern-config
.yarnrc
.eslintrc-fix.json

.config/i3/config
.config/xfce4/terminal/terminalrc
backup/dotfiles
backup/bk_dotfile.sh

.spacemacs.d/init.el

tools/*.sh
tools/*.py
"
for line in $dotfiles; do
    if [[ $line ]]; then
        cp --parents -u $HOME/$line ~/Nutstore/
    fi
done