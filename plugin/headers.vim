" Plugin
if exists('g:loaded_local_plugin_headers')
    finish
endif
let g:loaded_local_plugin_headers = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Mappings
nnoremap <silent> <expr> <Leader>h headers#write()

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
