" Plugin
if exists('g:loaded_local_plugin_scratch')
    finish
endif
let g:loaded_local_plugin_scratch = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

command! -nargs=? Scratch call scratch#new(<q-args>)

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
