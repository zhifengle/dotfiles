export EDITOR='vim'

export GOROOT=$HOME/myapps/go
export GOPATH=$HOME/myapps/gopath
export PATH=$PATH:$GOROOT/bin:GOPATH/bin
export PATH=~/.npm-global/bin:$PATH
export PATH="$HOME/.local/bin:$PATH"
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
#export PATH="$PATH:$HOME/.rvm/bin"
#[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*


# personal use
#export PATH="$HOME/.cabal/bin:$PATH"
# java
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk
export JRE_HOME=${JAVA_HOME}/jre
export CLASSPATH=.:${JAVA_HOME}/lib:${JRE_HOME}/lib
export PATH=${JAVA_HOME}/bin:$PATH
# rust
#source $HOME/.cargo/env
#export RUSTUP_DIST_SERVER=https://mirrors.ustc.edu.cn/rust-static
#export RUSTUP_UPDATE_ROOT=https://mirrors.ustc.edu.cn/rust-static/rustup
#export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"
#export CARGO_HOME="$HOME/.cargo"
#export PATH=~/.npm-global/bin:$PATH
## setting for vim
export PATH="$HOME/myapps/bin:$PATH"

#disabled 2016/9/13
# setting on arch
#if [ -e /usr/share/terminfo/x/xterm-256color  ]; then
#    export TERM='xterm-256color'
#else
#    export TERM='xterm-color'
#fi
