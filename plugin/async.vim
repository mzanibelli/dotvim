" Plugin
if exists('g:loaded_local_plugin_async')
    finish
endif
let g:loaded_local_plugin_async = 1

" Commands
command! -nargs=* -complete=customlist,async#complete Kill call async#kill(<q-args>)
