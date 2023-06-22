let g:mapleader = " "

map j gj
map k gk

" highlight search
vnoremap / "9y/<C-r>9<cr>
xnoremap / "9y/<C-r>9<cr>
nnoremap <Leader>n /\d\+<cr>zz

" copy and paste
nnoremap <leader>y "+yy
nnoremap <leader>X "+dd
vnoremap Y "+y
vnoremap X "+x
vnoremap <C-c> "+y
nnoremap <leader>P "+p
vnoremap <leader>P "+p
inoremap <C-v> <esc>"+pa
nnoremap gy :1,$y +<cr>
xnoremap <leader>p "_dP
nnoremap <leader>v g^vg$
inoremap <C-k> <esc>k

" motion
nnoremap ( )
nnoremap ) (

nnoremap <c-d> <c-d>zz
nnoremap <c-u> <c-u>zz 

vnoremap < <gv
vnoremap > >gv
