setlocal textwidth=0 wrap formatoptions=tc2n linebreak
nnoremap <leader><C-l> :setlocal formatoptions=tcw2n textwidth=80 linebreak<cr> 

" obsidian header link space elimater
"setlocal conceallevel=0

noremap <buffer> j gj
noremap <buffer> k gk
noremap <buffer> $ g$
noremap <buffer> ^ g^
noremap <buffer> 0 g0

nnoremap <buffer> dd g0vg$x
nnoremap <buffer> D g0vg$x

nnoremap I g^i
nnoremap A g$BEa

nnoremap V g0vg$
