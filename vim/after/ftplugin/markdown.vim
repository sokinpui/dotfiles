vim9script

setlocal formatoptions=tcaw2n textwidth=80 linebreak 

# obsidian header link space elimater
nnoremap <buffer> <leader><C-l> vi(:s/ /%20/g<cr>
