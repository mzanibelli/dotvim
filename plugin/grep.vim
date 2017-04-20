" Plugin
if exists('g:loaded_local_plugin_grep')
    finish
endif
let g:loaded_local_plugin_grep = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Commands
command! -nargs=* Grep call grep#grep(<q-args>, 'fixed')
command! -nargs=* Fgrep call grep#grep(<q-args>, 'fixed')
command! -nargs=* Egrep call grep#grep(<q-args>, 'regex')

" Mappings
nnoremap <silent> <Leader>g :<C-U>Grep <C-R><C-W><CR>
vnoremap <silent> <Leader>g :<C-U>Grep <C-R>=visual#gettext()<CR><CR>

" Autocommands
augroup GREP
    autocmd!
    autocmd VimEnter * call grep#configure()
augroup END

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
