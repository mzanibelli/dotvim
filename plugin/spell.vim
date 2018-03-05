" Plugin
if exists('g:loaded_local_plugin_spell')
    finish
endif
let g:loaded_local_plugin_spell = 1

" Mappings
nnoremap <silent> <Leader>z :<C-U>call spell#correct()<CR>
inoremap <silent> <C-Z> <C-O>:<C-U>call spell#correct()<CR>
