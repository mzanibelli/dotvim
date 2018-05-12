" Plugin
if exists('g:loaded_local_plugin_edit')
    finish
endif
let g:loaded_local_plugin_edit = 1

" Mappings
nnoremap <silent> <Leader>e :<C-U>call edit#find('fzf')<CR>
nnoremap <silent> <Leader>r :<C-U>call edit#find('ranger')<CR>
