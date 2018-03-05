" Plugin
if exists('g:loaded_local_plugin_restore')
    finish
endif
let g:loaded_local_plugin_restore = 1

" Autocommands
augroup RESTORE
    autocmd!
    autocmd BufReadPost * call restore#position()
augroup END
