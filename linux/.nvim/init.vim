"set runtimepath^=~/.vim runtimepath+=~/.vim/after runtimepath+=~/vimfiles
"let &packpath = &runtimepath
"source ~/vimfiles/vimrc


let s:core_conf_files = [
            "\ 'globals.vim',
            \ 'options.vim',
            \ 'mappings.vim',
            \ 'plugins.vim',
            "\ 'themes.vim'
            \ ]

for s:fname in s:core_conf_files
    execute printf('source %s/core/%s', stdpath('config'), s:fname)
endfor

set background=light
colorscheme solarized8_flat

" Auto-generate packer_compiled.lua file
augroup packer_auto_compile
    autocmd!
    autocmd BufWritePost */nvim/lua/plugins.lua source <afile> | PackerCompile
augroup END
