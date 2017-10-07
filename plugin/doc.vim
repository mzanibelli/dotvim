" Plugin
if exists('g:loaded_local_plugin_doc')
    finish
endif
let g:loaded_local_plugin_doc = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Commands
command! -nargs=1 DevDocs silent! call system("$BROWSER 'https://devdocs.io?q=".&ft." ".<q-args>."'")

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
