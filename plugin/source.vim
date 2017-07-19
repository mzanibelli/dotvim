" Plugin
if exists('g:loaded_local_plugin_source')
    finish
endif
let g:loaded_local_plugin_source = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Mappings
nnoremap <silent> <C-P> :<C-U>call source#move(0)<CR>
nnoremap <silent> <C-N> :<C-U>call source#move(1)<CR>
nnoremap <Leader>! :<C-U>call source#root()<CR>

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
