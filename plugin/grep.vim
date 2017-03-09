" Commands
command! -nargs=* Grep call grep#grep(<q-args>)

" Mappings
nnoremap <silent> <Leader>g :<C-U>set operatorfunc=grep#opfunc<CR>g@
vnoremap <silent> <Leader>g :<C-U>call grep#opfunc(visualmode())<CR>

" Init
call grep#configure()
