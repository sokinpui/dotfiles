vim9script

#   Sandwich
# single word
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
# visual
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

#   newtrw
g:netrw_liststyle = 3
g:netrw_fastbrowse = 2

nnoremap <leader><tab> :Explore<cr>
nnoremap <leader><S-tab> :Vexplore<cr>

#   markdown-preview
if has('mac')
    g:mkdp_browser = 'safari'
elseif has('linux')
    g:mkdp_browser = 'google-chrome'
endif
     
#   goyo
nnoremap <leader>G :Goyo<cr>
g:goyo_width = 90
g:goyo_height = 100

#   coc.nvim
inoremap <silent><expr> <TAB> coc#pum#visible() ? coc#pum#next(1) : 
      \ cocfunc#CheckBackspace() ? "\<TAB>" : coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<S-TAB>"

inoremap <silent><expr> <CR> coc#pum#visible() ? "\<C-g>u\<CR>\<c-r>=coc#pum#close()\<CR>" 
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

inoremap <silent><expr> <space> coc#pum#visible() ? "<esc>a<space>" 
                              \: "<space>"

inoremap <silent><expr> <c-o> coc#refresh()

# jump to next/previous error
nnoremap <silent> <LEADER>- <Plug>(coc-diagnostic-prev)
nnoremap <silent> <LEADER>= <Plug>(coc-diagnostic-next)

augroup CocGroup
  autocmd!
  autocmd FileType markdown b:coc_suggest_disable = 1
  autocmd FileType text b:coc_suggest_disable = 1
augroup end

#   coc.snippets
imap <C-j> <Plug>(coc-snippets-expand-jump)
g:coc_snippet_next = '<C-j>'
g:coc_snippet_prev = '<C-k>'
