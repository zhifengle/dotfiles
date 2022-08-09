set runtimepath^=~/.vim runtimepath+=~/.vim/after runtimepath+=~/vimfiles
let &packpath = &runtimepath
source ~/vimfiles/vimrc

lua require("config.treesitter")
" Auto-generate packer_compiled.lua file
"augroup packer_auto_compile
"    autocmd!
"    autocmd BufWritePost */nvim/lua/plugins.lua source <afile> | PackerCompile
"augroup END
