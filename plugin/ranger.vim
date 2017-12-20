" Plugin
if exists('g:loaded_local_plugin_ranger')
    finish
endif
let g:loaded_local_plugin_ranger = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Autocommands
augroup RANGER
    autocmd!
    autocmd VimEnter * call ranger#onstart()
    autocmd BufEnter * call ranger#onenter(expand("<afile>"))
augroup END

" Mappings
nnoremap <silent> <Leader>r :<C-U>call ranger#open(getcwd())<CR>

" Commands
command! -nargs=1 -complete=file Open call ranger#open(<q-args>)

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
