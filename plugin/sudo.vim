" Plugin
if exists('g:loaded_local_plugin_sudo')
    finish
endif
let g:loaded_local_plugin_sudo = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Commands
command! -nargs=0 -bar SudoWrite call sudo#setup(expand('%:p')) | write!
command! -bar -bang -complete=file -nargs=? SudoEdit
            \ call sudo#setup(fnamemodify(empty(<q-args>) ? expand('%') : <q-args>, ':p')) |
            \ if !&modified || !empty(<q-args>) |
            \     edit<bang> <args> |
            \ endif |
            \ if empty(<q-args>) || expand('%:p') ==# fnamemodify(<q-args>, ':p') |
            \     setlocal noreadonly |
            \ endif

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
