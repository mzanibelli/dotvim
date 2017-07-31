" Plugin
if exists('g:loaded_local_plugin_help')
    finish
endif
let g:loaded_local_plugin_help = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Autocommands
augroup HELP
    autocmd!
    autocmd BufEnter *.txt if &buftype == "help" | only | endif
augroup END

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
