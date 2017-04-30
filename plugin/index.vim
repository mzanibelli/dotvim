" Plugin
if exists('g:loaded_local_plugin_index')
    finish
endif
let g:loaded_local_plugin_index = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Mappings
nnoremap <silent> n nzz:<C-U>call index#print()<CR>
nnoremap <silent> N Nzz:<C-U>call index#print()<CR>
nnoremap <silent> g/ :<C-U>call index#print()<CR>

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
