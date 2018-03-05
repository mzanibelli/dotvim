" Plugin
if exists('g:loaded_local_plugin_source')
    finish
endif
let g:loaded_local_plugin_source = 1

" Mappings
nnoremap <silent> <C-P> :<C-U>call source#move(0)<CR>
nnoremap <silent> <C-N> :<C-U>call source#move(1)<CR>
