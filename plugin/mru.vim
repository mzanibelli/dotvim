" Plugin
if exists('g:loaded_local_plugin_mru')
    finish
endif
let g:loaded_local_plugin_mru = 1

" Mappings
nnoremap <silent> <Leader>m :<C-U>call mru#popup()<CR>
nnoremap gm :<C-U>MRU<Space>

" Commands
command! -nargs=1 -complete=customlist,mru#complete MRU execute "edit" fnameescape(<f-args>)
