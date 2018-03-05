" Plugin
if exists('g:loaded_local_plugin_comment')
    finish
endif
let g:loaded_local_plugin_comment = 1

" Mappings
nnoremap <silent> gcc :<C-U>call comment#opfunc(1)<CR>
nnoremap <silent> gc :<C-U>set operatorfunc=comment#opfunc<CR>g@
vnoremap <silent> gc :<C-U>call comment#opfunc(visualmode())<CR>
