set runtimepath^=~/.vim runtimepath+=~/.vim/after runtimepath+=~/vimfiles
let &packpath = &runtimepath
source ~/vimfiles/vimrc

lua require("plugins")

let s:core_conf_files = [ 'plugins.vim' ]

" for test
for s:fname in s:core_conf_files
    "execute printf('source %s/core/%s', stdpath('config'), s:fname)
endfor

" Auto-generate packer_compiled.lua file
augroup packer_auto_compile
    autocmd!
    autocmd BufWritePost */nvim/lua/plugins.lua source <afile> | PackerCompile
augroup END
