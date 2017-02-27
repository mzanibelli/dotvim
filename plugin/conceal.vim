" Autocommands
augroup CONCEAL
    autocmd!
    autocmd BufReadPost * syntax match Ignore /\r$/ conceal
augroup END
