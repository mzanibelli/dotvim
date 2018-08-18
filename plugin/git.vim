" Plugin
if exists('g:loaded_local_plugin_git')
    finish
endif
let g:loaded_local_plugin_git = 1

" Mappings
nnoremap <silent> gl :<C-U>call git#log()<CR>
