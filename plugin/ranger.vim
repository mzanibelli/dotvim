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
    autocmd VimEnter * silent! autocmd! FileExplorer *
    autocmd VimEnter * call ranger#onstart()
    autocmd BufEnter * call ranger#open(expand("<amatch>"), "curwin")
augroup END

" Commands
command! -nargs=1 -complete=file Open call ranger#open(<q-args>, "curwin")
command! -nargs=1 -complete=file Sopen call ranger#open(<q-args>)
command! -nargs=1 -complete=file Vopen call ranger#open(<q-args>, "vertical")

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
