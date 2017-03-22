" Plugin
if exists('g:loaded_local_plugin_sql')
    finish
endif
let g:loaded_local_plugin_sql = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Variables
let g:omni_sql_no_default_maps=1

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
