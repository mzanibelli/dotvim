" Commands
command! -nargs=* Grep call grep#grep(<q-args>, 'fixed')
command! -nargs=* Fgrep call grep#grep(<q-args>, 'fixed')
command! -nargs=* Egrep call grep#grep(<q-args>, 'regex')

" Mappings
nnoremap <silent> <Leader>g :<C-U>set operatorfunc=grep#opfunc<CR>g@
vnoremap <silent> <Leader>g :<C-U>call grep#opfunc(visualmode())<CR>

" Init
call grep#configure()
