set mouse=a

"https://jdhao.github.io/2019/01/17/nvim_qt_settings_on_windows/
"JetBrainsMono NF
:Guifont! JetBrainsMono NF:h14
inoremap <silent>  <S-Insert>  <C-R>+
cmap <S-Insert>  <C-R>+
GuiTabline 0
GuiPopupmenu 0

" Right Click Context Menu (Copy-Cut-Paste)
nnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>
inoremap <silent><RightMouse> <Esc>:call GuiShowContextMenu()<CR>
xnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>gv
snoremap <silent><RightMouse> <C-G>:call GuiShowContextMenu()<CR>gv
