let mapleader=";"
filetype plugin indent on
filetype plugin on
set t_Co=256

if has("gui_running")
    set guifont=DejaVu\ Sans\ Mono\ 11
elseif has("gui_win32")
    set guifont=DejaVu_Sans_Mono:h11
end
map ;y "+y
map ;p "+p
nmap 1b 0
nmap 1e $
noremap <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <C-O>:update<CR>

set enc=utf-8
set fileencodings=utf-8,cs-bom,gbk,cp936

set number  
syntax enable  
syntax on "打开高亮  
colorscheme desert    
set nocompatible "不要vim模仿vi模式
"解决菜单乱码
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
source $VIMRUNTIME/vimrc_example.vim  
source $VIMRUNTIME/mswin.vim
"解决consle输出乱码
language messages zh_CN.utf-8

"定制GUI界面  
set go= "无菜单、工具栏"  
set nobackup "覆盖文件不备份
set noswapfile "编辑时不产生交换文件
set tabstop=4 "让一个tab等于4个空格
set expandtab "插入tab时以空格替换    
set autoindent "自动缩进
set smartindent "智能自动缩进
set smarttab "开启新行的
set shiftwidth=4
set showmatch
set vb t_vb=  
set ruler
set nohls "不高亮显示结果  
set incsearch "在输入要搜索的文字时，vim会实时匹配
"NERDTree,提供查看文件折叠/展开列表功能  
nmap <F2> :NERDTreeToggle<CR>  
"imap <F2> <ESC> :NERDTreeToggle<CR>

"进行Tlist的设置  
filetype on  
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
au BufRead *.py map <buffer> <F5> :w<CR>:!/usr/bin/env python % <CR> 
