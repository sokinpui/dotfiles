call plug#begin()
Plug 'sokinpui/vim-sandwich'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/vimux'
Plug 'junegunn/fzf.vim'
Plug 'godlygeek/tabular' 
Plug 'preservim/vim-markdown', { 'for': 'markdown' }
Plug 'lilydjwg/fcitx.vim' 
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

call plug#end()

"   Sandwich
" single word
nmap <leader>( cciw(E
nmap <leader>) cciw)E
nmap <leader>[ cciw[E
nmap <leader>] cciw]E
nmap <leader>{ cciw{E
nmap <leader>} cciw}E
nmap <leader>" cciw"E
nmap <leader>' cciw'E
nmap <leader>< cciw<E
nmap <leader>> cciw>E
nmap <leader>` cciw`E
nmap <leader>$ cciw$E
nmap <leader>* cciw*.E
nmap <leader>~ cciw~.E
" visual
vmap <leader>( cc(
vmap <leader>) cc)
vmap <leader>[ cc[
vmap <leader>] cc]
vmap <leader>{ cc{
vmap <leader>} cc}
vmap <leader>" cc"
vmap <leader>' cc'
vmap <leader>< cc<
vmap <leader>> cc>
vmap <leader>` cc`
vmap <leader>$ cc$
vmap <leader>_ cc_
vmap <leader>* cc*.
vmap <leader>~ cc~.

"   newtrw
let g:netrw_liststyle = 3
let g:netrw_fastbrowse = 2

nnoremap <leader><tab> :Explore<cr>
nnoremap <leader><S-tab> :Texplore<cr>

"   markdown-preview
if has('mac')
    let g:mkdp_browser = 'safari'
elseif has('linux')
    let g:mkdp_browser = 'chromium-browser'
endif
     
"   coc.nvim
inoremap <silent><expr> <TAB> coc#pum#visible() ? coc#pum#next(1) : 
      \ cocfunc#CheckBackspace() ? "\<TAB>" : coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<S-TAB>"

inoremap <silent><expr> <CR> coc#pum#visible() ? "\<C-g>u\<CR>\<c-r>=coc#pum#close()\<CR>" 
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

inoremap <silent><expr> <space> coc#pum#visible() ? "<esc>a<space>" 
                              \: "<space>"


" jump to next/previous error
nnoremap <silent> <LEADER>, <Plug>(coc-diagnostic-prev)
nnoremap <silent> <LEADER>. <Plug>(coc-diagnostic-next)

"augroup CocGroup
"  autocmd!
"  autocmd FileType markdown b:coc_suggest_disable = 1
"  autocmd FileType text b:coc_suggest_disable = 1
"augroup end

"   coc.snippets
inoremap <C-j> <Plug>(coc-snippets-expand-jump)
vnoremap <C-j> <Plug>(coc-snippets-select)
let g:coc_snippet_next = '<C-j>'
let g:coc_snippet_prev = '<C-k>'

" run command in split window
nnoremap <leader>s :VimuxPromptCommand<CR>
nnoremap <leader><leader>s :VimuxCloseRunner<CR>
 
" vim-markdwon
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_no_default_key_mappings = 1
let g:vim_markdown_conceal_code_blocks = 0
let g:vim_markdown_math = 1

" fzf.vim
nnoremap <leader>ff :Files<cr>
nnoremap <leader>fb :Buffers<cr>
