" Plugin
if exists('g:loaded_local_plugin_defer')
    finish
endif
let g:loaded_local_plugin_defer = 1

" Autocommands
augroup DEFER
    autocmd!
    autocmd VimEnter * call timer_start(500, "defer#load")
augroup END
