nnoremap <silent> gcc :<C-U>call comment#opfunc(1)<CR>
nnoremap <silent> gc :<C-U>set operatorfunc=comment#opfunc<CR>g@
vnoremap <silent> gc :<C-U>call comment#opfunc(visualmode())<CR>
