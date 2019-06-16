#!/bin/bash

ROOT_UID=0
E_WRONG_ARGS=65
E_NOTROOT=65
script_parameters="-b -v -y"


#if [ "$UID" -ne "$ROOT_UID" ]
#then
#echo "Must be root to run this script."
#exit $E_NOTROOT
#fi

function install_basic_tools() {
    # necessary 
    SOFTWARES="chromium-browser"
    TOOLS="vim git zsh curl autojump rofi fcitx $SOFTWARES"
    #install_list="shadowsocks-qt5"
    install_list=""

    #sudo add-apt-repository -y ppa:jonathonf/vim
    #sudo add-apt-repository -y ppa:hzwhuang/ss-qt5
    sudo apt-get update 
    for tool in $TOOLS ; do
        if ! command -v $tool &>/dev/null; then
            if [[ $tool == "fcitx" ]]; then
                install_list="$install_list fcitx fcitx-pinyin im-switch fcitx-module-cloudpinyin"
            elif [[ $tool == "vim" ]]; then
                install_list="$install_list vim-gtk"
            else
                install_list="$install_list $tool"
            fi
        fi
    done
    echo "now................... install $install_list"
    sudo apt-get install -y $install_list
    #
    #sudo apt-get install ttf-mscorefonts-installer
    #if [[ -n $BASH ]]; then
    if ! [[ $SHELL =~ zsh$ ]]; then
        chsh -s /bin/zsh 
    fi
    if command -v curl &>/dev/null; then
        if [[ ! -d ~/.nvm ]]; then
            curl -o- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
        fi
        if [[ ! -d ~/.pyenv ]]; then
            curl -L https://raw.githubusercontent.com/pyenv/pyenv-installer/master/bin/pyenv-installer | bash 
        fi
        if [[ ! -d ~/.oh-my-zsh ]]; then
            sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
        fi
    fi

    # Xmodmap 
    xmodmap='
    clear lock
    clear control
    keycode 66 = Control_L
    add control = Control_L Control_R
    '
    #~/.xinitrc
    #[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap

    # gnome configure
    #Move status icons to your GNOME top bar 
    #https://github.com/phocean/TopIcons-plus 
    # enable super tab

    ## terminal theme

    # https://github.com/Anthony25/gnome-terminal-colors-solarized 
    #if [[ -d gnome-terminal-colors-solarized ]]; then
    #    git clone https://github.com/Anthony26/gnome-terminal-colors-solarized.git
    #    cd gnome-terminal-colors-solarized
    #    ./install.sh
    #fi
}

function install_ycm() {
    # without clang++ // --clang-completer 
    sudo apt-get install -y build-essential cmake python-dev python3-dev python-pip 
    vim +PlugInstall +qall
    cd ~/.vim/bundle/YouCompleteMe 
    /usr/bin/python3 ./install.py --tern-completer 
    pyenv virtualenv --python=/usr/bin/python3 env3

}

# wine qq

#sudo add-apt-repository ppa:wine/wine-builds;sudo apt-get update;sudo apt-get install winehq-devel 
#tar xvf wineQQ8.9.1_20453.tar.xz -C ~/
#$HOME/.local/share/applications/wine-QQ.desktop 
#Exec=env LC_ALL=zh_CN.UTF-8 wine “.wine/drive_c/Program Files/QQ/Bin/QQ.exe”


# rofi setting
#rofi -show window // super+tab 
#rofi -show run


#nvm install --lts 
#curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash - 
#sudo apt-get update
#sudo apt-get install -y nodejs

# MongoDB

#https://docs.mongodb.com/manual/tutorial/install-mongodb-on-ubuntu/ 
#https://docs.mongodb.com/manual/tutorial/install-mongodb-on-linux/ 
#https://www.digitalocean.com/community/tutorials/how-to-install-mongodb-on-ubuntu-16-04

case "$1" in
    "-b")
        echo "install basic tools"
        install_basic_tools
        exit 0
        ;;
    "-y")
        exit 0
        ;;
    *)
        echo "Usage: `basename $0` -b      install basic tools"
        echo "Usage: `basename $0` -y      install ycm"
        # `basename $0` is the script's filename.
        exit $E_WRONG_ARGS
        exit 1
        ;;
esac
