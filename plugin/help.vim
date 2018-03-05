" Plugin
if exists('g:loaded_local_plugin_help')
    finish
endif
let g:loaded_local_plugin_help = 1

" Autocommands
augroup HELP
    autocmd!
    autocmd BufEnter *.txt if &buftype == "help" | only | endif
augroup END
