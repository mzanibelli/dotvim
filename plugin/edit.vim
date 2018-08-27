" Plugin
if exists('g:loaded_local_plugin_edit')
    finish
endif
let g:loaded_local_plugin_edit = 1

" Mappings
nnoremap <silent> <Leader>e :<C-U>call edit#open('fzf')<CR>
nnoremap <silent> <Leader>r :<C-U>call edit#open('ranger')<CR>
nnoremap <silent> gh :<C-U>call edit#open('ranger')<CR>
