command! -nargs=* Grep call grep#grep(<q-args>)

nnoremap <silent> <Leader>g :<C-U>set operatorfunc=grep#opfunc<CR>g@
vnoremap <silent> <Leader>g :<C-U>call grep#opfunc(visualmode())<CR>
nnoremap <silent> <Leader>G :<C-U>call grep#infile(0)<CR>
vnoremap <silent> <Leader>G :<C-U>call grep#infile(1)<CR>

call grep#configure()
