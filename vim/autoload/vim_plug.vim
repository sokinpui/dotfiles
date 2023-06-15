vim9script

export def Install
    exec "w"
    exec source ~/.vim/vimrc
    exec PlugInstall()
enddef
