vim9script
import autoload 'templates.vim'

augroup Init_Template
    au!
    autocmd BufNewFile *.c  :0read ~/.vim/templates/tp.c
    autocmd BufNewFile *.py :0read ~/.vim/templates/tp.py
    autocmd BufNewFile *.java call templates.PrintJavaTemplates()
    autocmd BufNewFile ~/.config/zsh/bin/* :0read ~/.vim/templates/tp.sh
    autocmd BufNewFile ~/cuhk/ucourse/ENGG1110/*/*.c :0read ~/.vim/templates/enggLabSkeleton.c
augroup END

