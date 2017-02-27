" Autocommands
augroup RESTORE
    autocmd!
    autocmd BufReadPost * call restore#position()
augroup END
