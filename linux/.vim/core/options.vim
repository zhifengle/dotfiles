set background=light
colorscheme solarized8_flat "solarized8_flat desert molokai one
"set termguicolors  "已在 vimrc 设置
let mapleader="\<Space>"
let maplocalleader="\<Space>"
if has('autocmd')
    filetype plugin indent on
endif
if has('syntax') && !exists('g:syntax_on')
    syntax enable
endif
set bs=2 "set backspace=indent,eol,start
"解决中文乱码 ,gb2312,big5,gb18030,cp936
set enc=utf-8
"set fileencoding=utf-8 "保存文件时编码
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set number
"set cc=80
syntax on "打开高亮
set autoread
set wildmenu
"set cul "高亮光标所在行
"set cuc
set showcmd
"set autochdir
set fdm=marker "marker indent
"set nofoldenable
"set foldlevelstart=99
set complete-=i
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
" colorscheme
"set background=light
"colorscheme one "solarized8_flat desert molokai one
"缩进设置
filetype indent on
set tabstop=4 "让一个tab等于4个空格
set shiftwidth=4 "sw=4
set expandtab "插入tab时以空格替换et
"set softtabstop=4 "sts
set smarttab "开启新行的sta
set autoindent "自动缩进
set smartindent "智能自动缩进
set diffopt+=iwhite

augroup E_indent
    autocmd FileType python setlocal ts=4 sw=4 et sta
    autocmd FileType make setlocal ts=8 sw=8 noexpandtab
    " indent for web
    autocmd FileType json,vue,javascript,typescript,html,css,scss,less,lua setlocal ts=2 sw=2  et
augroup END

" setting for gvim or terminal {{{
if has("gui_running")
    set guioptions=
    set lines=36
    set columns=90
    let &guifont='DejaVuSansMono NF:h14:cANSI'
    "language messages zh_CN.utf-8
endif
" gvim }}}
