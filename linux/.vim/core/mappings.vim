nnoremap ; :
vnoremap ; :
map <C-S> :update<CR>
vmap <C-S> <C-C>:update<CR>
imap <C-S> <C-O>:update<CR>
nnoremap <Leader>ew :update<CR>
if maparg('<C-L>', 'n') ==# ''
    nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif
if (has("gui_running")) || has("win32")
    map <M-1> 1gt
    map <M-2> 2gt
    map <M-3> 3gt
    map <M-4> 4gt
    map <M-5> 5gt
endif
""""""""""""""""""""
"  Leader key map  "
""""""""""""""""""""
nnoremap <Leader>y "+y
nnoremap <Leader>p moo<Esc>"+p`[v`]=`o
nnoremap <Leader>P moO<Esc>"+P`[v`]=`o
vnoremap <Leader>p "+p`[v`]=
vnoremap <Leader>P "+P`[v`]=
vnoremap <Leader>y "+y

"nnoremap <Leader>te :tabe<space>
" grep word under cursor
nnoremap <Leader>fg :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>


" format
nnoremap <Leader>em :%s/\r//g<CR>:w<CR>
" ef ec ref: plugins.vim
nnoremap <Leader>ed :lcd %:p:h<CR>
nnoremap <Leader>e2 :setlocal ts=2 sw=2 et<CR>
nnoremap <Leader>e4 :setlocal ts=4 sw=4 et<CR>

map <silent> <Leader>ee :e $MYVIMRC<CR>:lcd %:p:h<CR>

augroup E_map_setting
    autocmd!
    " 自动运用设置
    "autocmd BufWritePost init.vim,.vimrc,.gvimrc,_vimrc silent source %
    autocmd FileType qf nnoremap <buffer> o <CR><C-w>j
    autocmd BufRead,BufNewFile *.py nmap <Leader>5 :update<CR>:!python %<CR>
    autocmd BufRead,BufNewFile *.js nmap <Leader>5 :update<CR>:!node %<CR>
    autocmd BufRead,BufNewFile *.ts nmap <Leader>5 :update<CR>:!ts-node %<CR>
    autocmd BufRead,BufNewFile *.rs nmap <Leader>5 :update<CR>:!cargo run<CR>
augroup end

