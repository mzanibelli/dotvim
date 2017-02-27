" Autocommands
augroup CURSORLINE
    autocmd!
    autocmd BufEnter,WinEnter * setlocal cursorline
    autocmd BufLeave,WinLeave * setlocal nocursorline
augroup END
