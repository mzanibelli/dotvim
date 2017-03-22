" Plugin
if exists('g:loaded_local_plugin_doc')
  finish
endif
let g:loaded_local_plugin_doc = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Mappings
nnoremap <silent> K :<C-U>call doc#browse()<CR>

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
