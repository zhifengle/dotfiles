#!/bin/bash
# update: 2019-06-18

# If not specify, default meaning of return value:
# 0: Success
# 1: System error
# 2: Application error
# 3: Network error

CUR_VER=""
NEW_VER=""
ARCH=""
VDIS="64"
ZIPFILE="/tmp/v2ray/v2ray.zip"
DEB_PKG=""
V2RAY_RUNNING=0
VSRC_ROOT="/tmp/v2ray"
EXTRACT_ONLY=0
ERROR_IF_UPTODATE=0
DIST_SRC="github"

CMD_INSTALL=""
CMD_UPDATE=""
SOFTWARE_UPDATED=0

SYSTEMCTL_CMD=$(command -v systemctl 2>/dev/null)
SERVICE_CMD=$(command -v service 2>/dev/null)

CHECK=""
FORCE=""
HELP=""
#######color code########
RED="31m"      # Error message
GREEN="32m"    # Success message
YELLOW="33m"   # Warning message
BLUE="36m"     # Info message
###############################

# referrence v2ray  https://install.direct/go.sh
colorEcho(){
    COLOR=$1
    echo -e "\033[${COLOR}${@:2}\033[0m"
}

# https://gist.github.com/lukechilds/a83e1d7127b78fef38c2914c4ececc3c
get_latest_release() {
    curl --silent "https://api.github.com/repos/$1/releases/latest" | # Get latest release from GitHub api
        grep '"tag_name":' |                                            # Get tag line
        sed -E 's/.*"([^"]+)".*/\1/'                                    # Pluck JSON value
    }

# Usage
# $ get_latest_release "nvm-sh/nvm"

# tips: shell return 2019-06-18
# 1. echo $(test); 2.return exit status $?  if [ $? -eq 1 ]; $? != 0
# 3. share variable

getLatestRelease() {
    TAG_URL="https://api.github.com/repos/$1/releases/latest"
    # sed -E 's/.*"([^""]+)".*/\1/'
    NEW_VER=`curl ${PROXY} -s ${TAG_URL} --connect-timeout 10| grep '"tag_name":' | cut -d\" -f4`

    if [[ ${NEW_VER} != v* ]]; then
        NEW_VER=v${NEW_VER}
    fi
    if [[ $? -ne 0 ]] || [[ $NEW_VER == "" ]]; then
        colorEcho ${RED} "Failed to fetch release information. Please check your network or try again."
        return 3
    elif [[ $RETVAL -ne 0 ]];then
        return 2
    #elif [[ $NEW_VER != $CUR_VER ]];then
    #    return 1
    fi
    return 0
}

downloadDebAssets() {
    if [[ -z $1 ]]; then
        echo new pass pkg path
        return 2
    fi
    if [[ -z $NEW_VER ]]; then
        echo ver is null
        return 2
    fi

    DEB_PKG=$(echo $1 | sed -E 's/.*\///g')_${NEW_VER/v/}_amd64.deb
    DOWNLOAD_LINK="https://github.com/$1/releases/download/${NEW_VER}/${DEB_PKG}"

    colorEcho ${BLUE} "Downloading: ${DOWNLOAD_LINK}"
    curl ${PROXY} -L -H "Cache-Control: no-cache" -o ${DEB_PKG} ${DOWNLOAD_LINK}
    if [ $? != 0 ];then
        colorEcho ${RED} "Failed to download! Please check your network or try again."
        return 3
    fi
    return 0
}

# tips: jq usage
# jq '[.[] | {message: .commit.message, name: .commit.committer.name}]'

# use jq parse
downloadAssests() {
    TAG_URL="https://api.github.com/repos/$1/releases/latest"
    LATEST_VER_INFO=$(curl ${PROXY} -L -s ${TAG_URL} --connect-timeout 10)
    if [[ $? -ne 0 ]]; then
        colorEcho ${RED} "Failed to fetch release information. Please check your network or try again."
        return 3
    elif [[ $RETVAL -ne 0 ]];then
        return 2
    #elif [[ $NEW_VER != $CUR_VER ]];then
    #    return 1
    fi
    DOWNLOAD_LINK=$(echo $LATEST_VER_INFO | jq -r '.assets[].browser_download_url' | grep 'amd64.deb' | grep -v musl)
    LATEST_VER_INFO=""
    if [[ -z DOWNLOAD_LINK ]]; then
        colorEcho ${RED} "Failed to fetch amd64.deb assets. Please check your url."
    fi
    colorEcho ${BLUE} "Downloading: ${DOWNLOAD_LINK}"
    DEB_PKG=$(echo ${DOWNLOAD_LINK} | awk -F"/" '{ print $NF}')
    curl ${PROXY} -L -H "Cache-Control: no-cache" \
        -o ${DEB_PKG} ${DOWNLOAD_LINK}
    if [ $? != 0 ];then
        colorEcho ${RED} "Failed to download! Please check your network or try again."
        return 3
    fi
    return 0
}

# https://github.com/sharkdp/fd/releases/download/v7.3.0/fd_7.3.0_amd64.deb
# https://github.com/BurntSushi/ripgrep/releases/download/11.0.1/ripgrep_11.0.1_amd64.deb
# https://github.com/sharkdp/bat/releases/download/v0.11.0/bat_0.11.0_amd64.deb
# https://github.com/sharkdp/bat/releases/download/v0.11.0/bat-v0.11.0-x86_64-unknown-linux-gnu.tar.gz

# repos
#repos="sharkdp/fd"
#getLatestRelease $repos
#downloadDebAssets $repos

installPkg() {
    if [[ -z $1 ]]; then
        return 2
    fi
    $pkg=$1
    if ! command -v jq &>/dev/null; then
        getLatestRelease $pkg
        downloadDebAssets $pkg
    else
        downloadAssests $pkg
    fi
    if [ -e $DEB_PKG ]; then
        colorEcho ${BLUE} "Installing: ${DEB_PKG}"
        sudo dpkg -i $DEB_PKG
    else
        colorEcho ${RED} "no deb pkg"
    fi
}

main() {
    if [[ -n $1 ]]; then
        installPkg $1
    else
        pkgs='
        sharkdp/fd
        BurntSushi/ripgrep
        sharkdp/bat
        '
        for pkg in $pkgs ; do
            installPkg $pkg
        done
    fi
}
main $1

# tips: substitude 2019-06-18
#aa=${pkgs/sh/22}
#echo $aa

# tips: jq parse assets
# grep -v or awk '!/musl/'
#cat t.json| jq -r '.assets[].browser_download_url' | grep 'amd64.deb' | grep -v musl
