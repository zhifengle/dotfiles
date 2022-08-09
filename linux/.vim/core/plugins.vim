"vimwiki
let g:vimwiki_use_mouse = 1

let wiki_2 = {}
let wiki_2.path = '~/Documents/my_notes/'
if isdirectory("E:/my_notes")
    let wiki_2.path = 'E:/my_notes'
endif
let wiki_2.index = 'my_markdown_notes'
let wiki_2.syntax = 'markdown'
let wiki_2.ext = '.md'

let g:vimwiki_list = [wiki_2]
augroup e_plugins_setting
    autocmd FileType vimwiki map <F8> :Calendar<CR>
    " no auto indent when pasting
    autocmd FileType vimwiki nnoremap <Leader>p moo<Esc>"+p`o
    " 自定义 hi; syn keyword
    highlight MyEmoji guifg=#FFF80A
    "autocmd Syntax vimwiki syn keyword pEmoji 💡 📌
    "autocmd Syntax vimwiki hi def link pEmoji Label
    autocmd Syntax vimwiki syn keyword rEmoji 💊 💣 ❌ 👍 👎 👉
    autocmd Syntax vimwiki syn keyword gEmoji 😂
    " Label
    autocmd Syntax vimwiki hi def link rEmoji WarningMsg
    autocmd Syntax vimwiki hi def link gEmoji Constant
    autocmd Syntax vimwiki match Label /💡\|📌/
    autocmd FileType git nnoremap <silent> <Leader>j :exe <SNR>67_NextItem(v:count1)<CR>
    autocmd FileType git nnoremap <silent> <Leader>k :exe <SNR>67_PreviousItem(v:count1)<CR>
augroup END

" git
nnoremap <Leader>gs :Git<CR>
nnoremap <Leader>gl :GV!<CR>

vmap <silent> <Leader>c<Space> <Plug>NERDCommenterToggle
nmap <silent> <Leader>c<Space> <Plug>NERDCommenterToggle
if !has("gui_running")
    nmap <silent> <C-_> <Plug>NERDCommenterToggle
endif


"UltiSnips
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
let g:snips_email="zhifengle@gmail.com"
let g:snips_author="22earth"
let g:snips_github="22earth"
let g:UltiSnipsSnippetDirectories=["UltiSnips", "mycoolsnippets"]


nnoremap <Leader>2 :NERDTreeToggle<CR>

let g:ctrlp_custom_ignore = {
            \ 'dir':  '\v[\/](\.(git|hg|svn))|(node_modules|dist)|(debug)',
            \ 'file': '\v\.(exe|so|dll)$',
            \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
            \ }
let g:AutoPairsFlyMode = 1

autocmd filetype javascript let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

nnoremap <Leader>ef :Autoformat<CR>
nnoremap <Leader>ec :EditorConfigReload<CR>:e! %<CR>

if executable('rg')
    set grepprg=rg\ --vimgrep
    set grepformat=%f:%l:%c:%m
endif
