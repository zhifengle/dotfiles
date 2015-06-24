set nocompatible              " be iMproved, required
filetype off                  " required
if has("win32")
    set rtp+=~/vimfiles/bundle/Vundle.vim/
    let path='~/vimfiles/bundle'
    call vundle#begin(path)
else
    set rtp+=~/.vim/bundle/Vundle.vim
    let path='~/.vim/bundle'
    call vundle#begin(path)
endif
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
"Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-surround'
Bundle "tpope/vim-repeat"
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'terryma/vim-multiple-cursors'
Bundle "vim-scripts/matchit.zip"
"Bundle "mattn/emmet-vim"
"Bundle "scrooloose/nerdcommenter"
Bundle "vim-scripts/EnhCommentify.vim"
Bundle "scrooloose/syntastic"
Bundle "davidhalter/jedi-vim"
Bundle "vim-scripts/The-NERD-tree"
Bundle "vim-scripts/taglist.vim"
Bundle "vimwiki/vimwiki"
Bundle "mattn/calendar-vim"
"Bundle "Raimondi/delimitMate"
Bundle "jiangmiao/auto-pairs"
if has("unix")
    Bundle "godlygeek/csapprox"
    Bundle "Valloric/YouCompleteMe"
    Bundle 'Valloric/ListToggle'
endif
call vundle#end(path)            " required
filetype plugin indent on    " required

"let mapleader=";"
"let g:mapleader=";"
set bs=2 "set backspace=indent,eol,start
filetype plugin on
if has("unix")
    set guifont=DejaVu\ Sans\ Mono\ 11
    let g:vimwiki_use_mouse = 1
    let g:vimwiki_list = [{'path': '~/vimwiki/',
    \ 'path_html': '~/vimwiki/html/',
    \ 'html_header': '~/vimwiki/template/header.tpl',}]
    map <silent> <leader>e :e $HOME/.vim/vimrc<cr>
    let g:syntastic_python_python_exec = '/home/kun/.pyenv/versions/3.4.3/bin'
    autocmd BufRead,BufNewFile *.py nmap <F5> :w<CR>:!python %<CR>
    au BufRead,BufNewFile *.scm nmap <F5> :w<CR>:!mit-scheme --load %<CR>
    "au GUIEnter * call MaximizeWindow() "最大化窗口
endif
if has("gui_running")
    " 只显示菜单
    set guioptions=
    set background=dark "dark light
    colorscheme solarized"desertEx solarized molokai desert
    " ctrl+s 保存
    map <C-S> :update<CR>
    vmap <C-S> <C-C>:update<CR>
    imap <C-S> <C-O>:update<CR>
    nnoremap T :tabe<space>
    nnoremap <s-j> :tabnext<cr>
    nnoremap <s-k> :tabprev<cr>
    " 高亮光标所在的行
    "set cursorline
    if has("win32")
        " Windows 兼容配置
        set guifont=DejaVu_Sans_Mono:h13:cANSI
        set guifontwide=Yahei_Mono:b:h13:cGB2312
        "autocmd GUIEnter * simalt ~x "最大化gvim
        "source $VIMRUNTIME/mswin.vim
        source $VIMRUNTIME/menu.vim
        source $ViMRUnTIME/delmenu.vim
        "source $VIMRUNTIME/vimrc_example.vim
        "set fileformats=dos
        "解决consle输出乱码
        language messages zh_CN.utf-8
        map <silent> <leader>e :e ~/_vimrc<cr>
        let g:syntastic_python_python_exec = 'C:\\Python34'
        au BufRead,BufNewFile *.py nmap <F6> :w<CR>:!"c:\Python34\python.exe" %<CR>
        au BufRead,BufNewFile *.py nmap <F5> :w<CR>:!"c:\Python27\python.exe" %<CR>
        autocmd BufRead,BufNewFile *.scm map <F5> :w<CR>:call Interpreter()<CR>
        autocmd BufRead,BufNewFile *.rkt,*scm nmap <F6> :w<CR>:!racket %<CR>
        "vimwiki
            let g:vimwiki_use_mouse = 1
            let g:vimwiki_list = [{'path': 'F:/vimwiki/',
            \ 'path_html': 'F:/vimwiki/html/',
            \ 'html_header': 'F:/vimwiki/template/header.tpl',}]
            
    endif
else
    set background=dark
    colorscheme desert"desert evening solarized
    "au BufRead *.py map <buffer> <F5> :w<CR>:!/usr/bin/env python % <CR>
    "终端配色
    set t_Co=256
endif

" 固定设置{{{
"解决中文乱码 ,gb2312,big5,gb18030,cp936
set enc=utf-8
"au fileType *.scm, *.rkt setlocal enc=gbk
"set fileencoding=utf-8 "保存文件时编码
set fileencodings=utf-8,cs-bom,gbk,cp936
set number
"set cc=80
syntax on "打开高亮
set autoread
set wildmenu
"set cul "高亮光标所在行
"set cuc
set showcmd
set autochdir
"set fdm=marker "marker indent

set completeopt=longest,menu
set nobackup "覆盖文件不备份
set noswapfile "编辑时不产生交换文件
set showmatch
set vb t_vb= "关闭响铃和闪屏 
set ruler
"set nohls "不高亮显示结果
set hls 
set incsearch "在输入要搜索的文字时，vim会实时匹配
set fileformats=unix,dos

"缩进设置
filetype indent on
set tabstop=4 "让一个tab等于4个空格
set shiftwidth=4 "sw=4
set expandtab "插入tab时以空格替换et
set softtabstop=4 "sts
set smarttab "开启新行的sta
autocmd FileType python setlocal ts=4 sw=4 et sta sts=4
set autoindent "自动缩进
set smartindent "智能自动缩进
"}}}

"mapping setting{{{
" F2:NERDTreeToggle  F3:Tlist F4 F6 F7 F8 F9:c F10:c run 
" 普通模式下 Ctrl+c 复制文件路径
"nnoremap <c-c> :let @* = expand('%:p')<cr>
"map <C-Q> :wq!
"map ;y "+y
"map ;p "+p
"nmap 1b ^
"nmap 1e $
inoremap <C-a> <C-o>^
inoremap <C-e> <End>
"inoremap jk <Esc>
"map <F11> :Voom<CR>
au BufRead *.wiki map <S-F4> :VimwikiAll2HTML<cr>
au BufRead *.wiki map <F4> :Vimwiki2HTML<cr>
" calendar
au BufRead *.wiki map <F8> :Calendar<cr>
"nnoremap <F6> :GundoToggle<CR>
" 自动运用设置
autocmd BufWritePost .vimrc,.gvimrc,_vimrc silent source %
" 窗口切换
"nnoremap <c-h> <c-w>h
"nnoremap <c-l> <c-w>l
"nnoremap <c-j> <c-w>j
"nnoremap <c-k> <c-w>k
" Buffers/Tab操作快捷方式!
nnoremap <s-h> :bprevious<cr>
nnoremap <s-l> :bnext<cr>
"nnoremap F :tabe %
" 插入模式下上下左右移动光标
"inoremap <c-h> <left>
inoremap <c-l> <right>
"inoremap <c-j> <c-o>gj
"inoremap <c-k> <c-o>gk
"}}}

" python setting{{{

"autocmd BufRead *.py nmap <C-F5> :w<CR>:!idle.py -r %<CR>
autocmd BufRead *.py nmap <C-F5> :w<CR>:!ipython -i %<CR>
"autocmd BufRead *.py nmap <S-F5> :w<CR>:!idle.py -e %<CR>

let tlist_txt_settings = 'txt;c:content;f:figures;t:tables' "language definition for plain text
au BufRead,BufNewFile *.txt setlocal ft=txt "syntax highlight for txt.vim
func! Interpreter()
    if &filetype=='scheme'
        exec "w"
        exec "!\"D:\\MIT-GNU Scheme\\bin\\mit-scheme.exe\" --library \"d:\\MIT-GNU Scheme\\lib\" --load ".expand("%:p")
    endif
endfunc
autocmd FileType python setlocal foldmethod=indent foldlevel=99

" }}}

" c语言设置{{{
"定义CompileRun函数，用来调用进行编译和运行
func CompileRun()
exec "w"
"C程序
if &filetype == 'c'
"    exec "!clang -Wall % -g -o %<.exe"
    exec "!clang -Wall % -g -o %<.o"
"c++程序
elseif &filetype == 'cpp'
    exec "!clang++ -Wall % -g -o %<.o"
"Java程序
elseif &filetype == 'java'
    exec "!javac %"
endif
endfunc
"结束定义CompileRun
"定义Run函数
func Run()
if &filetype == 'c' || &filetype == 'cpp'
"    exec "!%<.exe"
    exec "!./%<.o"
elseif &filetype == 'java'
	exec "!java %<"
endif
endfunc
"定义Debug函数，用来调试程序
func Debug()
exec "w"
"C程序
if &filetype == 'c'
exec "!clang % -g -o %<.exe"
exec "!gdb %<.exe"
elseif &filetype == 'cpp'
exec "!clang++ % -g -o %<.exe"
exec "!gdb %<.exe"
"Java程序
elseif &filetype == 'java'
exec "!javac %"
exec "!jdb %<"
endif
endfunc
"结束定义Debug
"设置程序的运行和调试的快捷键F9和Ctrl-F9
au BufRead *.c,*.cpp nmap <F9> :call CompileRun()<CR>
"au FileType c,cpp nmap <F10> :call Run()<CR>
au FileType c,cpp nmap <C-F9> :call Run()<CR>
"au FileType c,cpp nmap <C-F9> :call Debug()<CR>
" }}}


"plugin setting{{{
"syntastic
let g:syntastic_python_python_exec = 'C:\\Python34'
let g:syntastic_python_checkers = ['Pyflakes']
let g:EasyMotion_leader_key = '<space>'
"map <Leader> <Plug>(easymotion-prefix)
"UltiSnips
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
let g:snips_email="kidl123@163.com"
let g:snips_author="kidl123"
let g:snips_github="kidl123"
"emmet
"let g:user_emmet_leader_key='<C-Z>'
"let g:user_emmet_expandabbr_key = '<Tab>'
"let g:user_emmet_install_global = 0
"autocmd fileType html,css,wiki EmmetInstall
" indent_guides随 vim 自启动
let g:indent_guides_enable_on_vim_startup=0
" 从第二层开始可视化显示缩进
let g:indent_guides_start_level=2
" 色块宽度
let g:indent_guides_guide_size=1
" 快捷键 i 开/关缩进可视化
":nmap <silent> <Leader>i <Plug>IndentGuidesToggle

"jedi 设置 
"let g:jedi#auto_initialization = 0
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = "<leader>d"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<A-1>"
let g:jedi#rename_command = "<leader>r"
let g:jedi#show_call_signatures = "1"
"html.vim
:let g:html_indent_inctags = "html,body,head,tbody" 
"NERDTree,提供查看文件折叠/展开列表功能  
nmap <F2> :NERDTreeToggle<CR>  
"imap <F2> <ESC> :NERDTreeToggle<CR> 

"进行Tlist的设置  
let Tlist_Show_Menu = 1  
"TlistUpdate可以更新tags  
map <F3> :silent! Tlist<CR>  "按下F3就可以呼出Taglist  
let Tlist_Ctags_Cmd='ctags' "因为我们放在环境变量里，所以可以直接执行  
let Tlist_Use_Right_Window=0 "让窗口显示在右边，0的话就是显示在左边  
let Tlist_Show_One_File=1 "让taglist可以同时展示多个文件的函数列表，如果想只有1个，设置为1  
let Tlist_File_Fold_Auto_Close=1 "非当前文件，函数列表折叠隐藏  
let Tlist_Exit_OnlyWindow=1 "当taglist是最后一个分割窗口时，自动退出vim  
let Tlist_Process_File_Always=0 "是否一直处理tags.1:处理;0:不处理  
let Tlist_Inc_Winwidth=0  
set tags=./tags,tags;$HOME "设置tags文件路径   
"plugin setting end}}}

" 插入文件头{{{
"新建.c,.h,.sh,.java文件，自动插入文件头   
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java exec ":call SetTitle()"   
""定义函数SetTitle，自动插入文件头   
func SetTitle()   
    "如果文件类型为.sh文件   
    if &filetype == 'sh'   
        call setline(1,"\#!/bin/bash")   
        call append(line("."), "")   
    elseif &filetype == 'python'  
        call setline(1,"#!/usr/bin/env python")  
        call append(line("."),"# coding=utf-8")  
        call append(line(".")+1, "")   
    elseif &filetype == 'mkd'  
        call setline(1,"<head><meta charset=\"UTF-8\"></head>")  
    else   
        call setline(1, "/*************************************************************************")   
        call append(line("."),   "  > File Name:     ".expand("%"))   
        call append(line(".")+1, "  > Author:        kidl123")   
        call append(line(".")+2, "  > Mail:          kidl123@163.com ")   
        call append(line(".")+3, "  > Created Time:  ".strftime("%c"))   
        call append(line(".")+4, " ************************************************************************/")   
        call append(line(".")+5, "")  
    endif  
    if &filetype == 'cpp'  
        call append(line(".")+6, "#include<iostream>")  
        call append(line(".")+7, "using namespace std;")  
        call append(line(".")+8, "")  
    endif  
    if &filetype == 'c'  
        call append(line(".")+6, "#include<stdio.h>")  
        call append(line(".")+7, "")  
    endif  
"   if &filetype == 'java'  
"       call append(line(".")+6,"public class ".expand("%"))  
"       call append(line(".")+7,"")  
"   endif  
    "新建文件后，自动定位到文件末尾  
endfunc   
autocmd BufNewFile * normal G 
" }}}
function! MaximizeWindow()
    silent !wmctrl -r :ACTIVE: -b add,maximized_vert,maximized_horz
endfunction
"setting for Windows
set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction
""""""""""""""""
"  linux or windows   "
""""""""""""""""
"""""""""""""""""
"  try to use   "
"""""""""""""""""

"autocmd BufRead,BufNewFile *.scm,*rkt,*.txt :AutoCloseOff
"autocmd BufRead,BufNewFile *.scm,*rkt,*.txt let b:delimitMate_autoclose = 0
"let delimitMate_excluded_ft = "scheme,txt"
"let delimitMate_expand_cr = 1
"let g:AutoClosePairs_del = "{"

"autocmd BufRead,BufNewFile *.scm,*rkt,*.txt let let g:AutoPairsLoaded = 0
let g:AutoPairsFlyMode = 1

"let g:AutoPairsShortcutBackInsert = '<M-b>'
"let g:ycm_path_to_python_interpreter = '/home/kun/.pyenv/versions/3.4.3/bin/python3.4'
" YouCompleteMe
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
autocmd BufRead,BufNewFile *.cpp,*.c,*.cc nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
"let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
"Do not ask when starting vim
let g:ycm_confirm_extra_conf = 0
let g:syntastic_always_populate_loc_list = 1
let g:ycm_filetype_blacklist = {
      \ 'tagbar' : 1,
      \ 'qf' : 1,
      \ 'notes' : 1,
      \ 'markdown' : 1,
      \ 'unite' : 1,
      \ 'text' : 1,
      \ 'vimwiki' : 1,
      \ 'pandoc' : 1,
      \ 'infolog' : 1,
      \ 'mail' : 1,
      \ 'python' : 1
      \}
