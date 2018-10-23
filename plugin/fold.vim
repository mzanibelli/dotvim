" Plugin
if exists('g:loaded_local_plugin_fold')
    finish
endif
let g:loaded_local_plugin_fold = 1

" Mappings
nnoremap <silent> <CR> :<C-U>call fold#toggle()<CR>
nnoremap <silent> <BS> :<C-U>call fold#toggleall()<CR>
nnoremap <Tab> zj
nnoremap <S-Tab> zk
