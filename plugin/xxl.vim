augroup XXL
    autocmd!
    autocmd BufReadPre * call xxl#init(expand("<afile>"))
augroup END
