" Plugin
if exists('g:loaded_local_plugin_cursorline')
    finish
endif
let g:loaded_local_plugin_cursorline = 1

" Autocommands
augroup CURSORLINE
    autocmd!
    autocmd BufEnter,WinEnter * setlocal cursorline
    autocmd BufLeave,WinLeave * setlocal nocursorline
augroup END
