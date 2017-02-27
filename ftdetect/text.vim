augroup TEXT
    autocmd!
    autocmd BufReadPost *.txt,*.rtf,*.nfo,todo,TODO,README,INSTALL,LICENCE setlocal filetype=text
augroup END
