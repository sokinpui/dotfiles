vim9script

export def Install()
    exec 'w'
    exec 'source ~/.vim/vimrc'
    normal! :PlugInstall<cr>
enddef
