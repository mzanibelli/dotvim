" Plugin
if exists('g:loaded_local_plugin_fzf')
    finish
endif
let g:loaded_local_plugin_fzf = 1

" Mappings
nnoremap <silent> <Leader>f :<C-U>call fzf#find()<CR>
