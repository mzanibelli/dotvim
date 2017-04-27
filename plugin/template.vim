" Plugin
if exists('g:loaded_local_plugin_template')
    finish
endif
let g:loaded_local_plugin_template = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Commands
command! -nargs=1 -complete=customlist,template#complete Template call template#make(<q-args>)

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
