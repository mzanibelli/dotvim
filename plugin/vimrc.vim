" Autocommands
augroup VIMRC
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC | set ft=vim | execute "normal! zv"
    autocmd BufReadPost $MYVIMRC setlocal spelllang=en
augroup END
