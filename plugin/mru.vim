" Plugin
if exists('g:loaded_local_plugin_mru')
    finish
endif
let g:loaded_local_plugin_mru = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Mappings
nnoremap <silent> <Leader>m :call mru#list()<CR>

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
