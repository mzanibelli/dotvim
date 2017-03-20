" Commands
command! -nargs=* Grep call grep#grep(<q-args>, 'fixed')
command! -nargs=* Fgrep call grep#grep(<q-args>, 'fixed')
command! -nargs=* Egrep call grep#grep(<q-args>, 'regex')

" Mappings
nnoremap <Leader>g :<C-U>Grep<Space>
vnoremap <silent> <Leader>g :<C-U>Grep <C-R>=visual#gettext()<CR><CR>

" Init
call grep#configure()
