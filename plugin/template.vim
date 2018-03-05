" Plugin
if exists('g:loaded_local_plugin_template')
    finish
endif
let g:loaded_local_plugin_template = 1

" Commands
command! -nargs=1 -complete=customlist,template#complete Template call template#make(<q-args>)
