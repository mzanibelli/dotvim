" Commands
command! -buffer -nargs=0 Format call format#format()
command! -nargs=0 Fix silent! call format#fix()
command! -nargs=0 Reindent silent! call format#reindent()

" Autocommands
augroup FORMAT
    autocmd!
    autocmd BufWritePre * call format#auto()
    autocmd FileType * call format#forceoptions()
augroup END
