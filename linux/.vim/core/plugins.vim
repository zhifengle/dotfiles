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
    autocmd!
    autocmd FileType vimwiki map <F8> :Calendar<CR>
    " no auto indent when pasting
    autocmd FileType vimwiki nnoremap <Leader>p moo<Esc>"+p`o
    " close keep change buffer
    autocmd FileType vimwiki set hidden
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
    autocmd FileType git,fugitive nmap <buffer> <Leader>j )
    autocmd FileType git,fugitive nmap <buffer> <Leader>k (
    autocmd FileType git,fugitive nmap <buffer> <C-n> )
    autocmd FileType git,fugitive nmap <buffer> <C-p> (
augroup END

" git
nnoremap <Leader>gs :Git<CR>
nnoremap <Leader>gl :Git log<CR>
nnoremap <Leader>gv :GV!<CR>

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
nnoremap <silent> <Leader>3 :<C-U>Vista!!<CR>
let g:vista#renderer#icons = {
      \ 'member': '',
      \ }

let g:vista_sidebar_position = 'vertical topleft'
" Do not echo message on command line
let g:vista_echo_cursor = 0
" Stay in current window when vista window is opened
let g:vista_stay_on_open = 0


nnoremap <Leader>b :CtrlPBuffer<CR>
nnoremap <Leader>fl :CtrlPLine<CR>
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
nnoremap <Leader>ec :call plug#load('editorconfig-vim')<CR>:EditorConfigReload<CR>:e! %<CR>

if executable('rg')
    set grepprg=rg\ --vimgrep
    set grepformat=%f:%l:%c:%m
endif

let g:user_emmet_install_global = 0
"autocmd fileType html,css,wiki,markdown,javascript,vue EmmetInstall
" indent_guides随 vim 自启动
let g:indent_guides_enable_on_vim_startup=0
" 从第二层开始可视化显示缩进
let g:indent_guides_start_level=2
" 色块宽度
let g:indent_guides_guide_size=1

" coc.nvim setting {{{
if exists('g:plugs["coc.nvim"]')
    " Some servers have issues with backup files, see #649.
    set nobackup
    set nowritebackup

    " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
    " delays and poor user experience.
    set updatetime=300

    " Always show the signcolumn, otherwise it would shift the text each time
    " diagnostics appear/become resolved.
    set signcolumn=yes

    " Use tab for trigger completion with characters ahead and navigate.
    " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
    " other plugin before putting this into your config.
    inoremap <silent><expr> <TAB>
                \ coc#pum#visible() ? coc#pum#next(1):
                \ CheckBackspace() ? "\<Tab>" :
                \ coc#refresh()
    inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

    " Make <CR> to accept selected completion item or notify coc.nvim to format
    " <C-g>u breaks current undo, please make your own choice.
    inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

    function! CheckBackspace() abort
        let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

    " Use <c-space> to trigger completion.
    if has('nvim')
        inoremap <silent><expr> <c-space> coc#refresh()
    else
        inoremap <silent><expr> <c-@> coc#refresh()
    endif

    " Use `[g` and `]g` to navigate diagnostics
    " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
    nmap <silent> [g <Plug>(coc-diagnostic-prev)
    nmap <silent> ]g <Plug>(coc-diagnostic-next)

    " GoTo code navigation.
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)

    " Use K to show documentation in preview window.
    nnoremap <silent> K :call ShowDocumentation()<CR>

    function! ShowDocumentation()
        if CocAction('hasProvider', 'hover')
            call CocActionAsync('doHover')
        else
            call feedkeys('K', 'in')
        endif
    endfunction


    " Symbol renaming.
    nmap <leader>rn <Plug>(coc-rename)

    " Formatting selected code.
    xmap <leader>f  <Plug>(coc-format-selected)
    nmap <leader>f  <Plug>(coc-format-selected)

    augroup mygroup
        autocmd!
        " Setup formatexpr specified filetype(s).
        autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
        " Update signature help on jump placeholder.
        autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
    augroup end

    " Applying codeAction to the selected region.
    " Example: `<leader>aap` for current paragraph
    xmap <leader>a  <Plug>(coc-codeaction-selected)
    nmap <leader>a  <Plug>(coc-codeaction-selected)

    " Remap keys for applying codeAction to the current buffer.
    nmap <leader>ac  <Plug>(coc-codeaction)

    " Run the Code Lens action on the current line.
    nmap <leader>cl  <Plug>(coc-codelens-action)

    " Map function and class text objects
    " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
    xmap if <Plug>(coc-funcobj-i)
    omap if <Plug>(coc-funcobj-i)
    xmap af <Plug>(coc-funcobj-a)
    omap af <Plug>(coc-funcobj-a)
    xmap ic <Plug>(coc-classobj-i)
    omap ic <Plug>(coc-classobj-i)
    xmap ac <Plug>(coc-classobj-a)
    omap ac <Plug>(coc-classobj-a)

    " Remap <C-f> and <C-b> for scroll float windows/popups.
    if has('nvim-0.4.0') || has('patch-8.2.0750')
        nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
        nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
        inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
        inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
        vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
        vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
    endif

    " Add `:Format` command to format current buffer.
    command! -nargs=0 Format :call CocActionAsync('format')

    " Add `:Fold` command to fold current buffer.
    command! -nargs=? Fold :call     CocAction('fold', <f-args>)

    " Add `:OR` command for organize imports of the current buffer.
    command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')


    "my coc.nvim config{{{
    "delete <Space>x  config

    " Highlight the symbol and its references when holding the cursor.
    autocmd CursorHold * silent call CocActionAsync('highlight')
    set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
    " TAB like VSCode. ref: coc.txt
    inoremap <silent><expr> <TAB>
                \ coc#pum#visible() ? coc#_select_confirm() :
                \ coc#expandableOrJumpable() ?
                \ "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
                \ <SID>check_back_space() ? "\<TAB>" :
                \ coc#refresh()
    function! s:check_back_space() abort
        let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~# '\s'
    endfunction
    nmap <leader>es  <Plug>(coc-fix-current)
    command! -nargs=0 Prettier :CocCommand prettier.formatFile
    autocmd FileType vimwiki,markdown let b:coc_suggest_disable = 1
    nnoremap <silent> <Leader>k :call <SID>show_documentation()<CR>
    " overwrite Autoformat;
    autocmd FileType javascript,typescript,typescriptreact,json,javascriptreact,typescript.tsx nnoremap <Leader>ef :Prettier<CR>
    "}}}
endif
" }}}
