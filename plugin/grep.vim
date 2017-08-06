" Plugin
if exists('g:loaded_local_plugin_grep')
    finish
endif
let g:loaded_local_plugin_grep = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Commands
command! -nargs=* Fgrep call grep#grep(<q-args>, 'fixed')
command! -nargs=* Egrep call grep#grep(<q-args>, 'regex')
command! -nargs=* Wgrep call grep#grep(<q-args>, 'word')
command! -nargs=* Igrep call grep#grep(<q-args>, 'icase')
command! -nargs=0 Regrep call grep#regrep()

" Mappings
nnoremap <Leader>gf :<C-U>Fgrep<Space>
nnoremap <Leader>ge :<C-U>Egrep<Space>
nnoremap <Leader>gw :<C-U>Wgrep<Space>
nnoremap <Leader>gi :<C-U>Igrep<Space>
vnoremap <silent> <Leader>gf :<C-U>Fgrep <C-R>=visual#gettext()<CR><CR>
vnoremap <silent> <Leader>ge :<C-U>Egrep <C-R>=visual#gettext()<CR><CR>
vnoremap <silent> <Leader>gw :<C-U>Wgrep <C-R>=visual#gettext()<CR><CR>
vnoremap <silent> <Leader>gi :<C-U>Igrep <C-R>=visual#gettext()<CR><CR>

" Autocommands
augroup GREP
    autocmd!
    autocmd User DeferPost call grep#configure()
augroup END

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
