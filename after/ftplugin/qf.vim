" Ftplugin
if exists('b:loaded_local_ftplugin_qf')
    finish
endif
let b:loaded_local_ftplugin_qf = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Mappings
nnoremap <buffer> <CR> <CR>zv
nnoremap <buffer> <silent> <Leader><Leader> :<C-U>call qf#quick()<CR>

" Options
setlocal statusline=%f\ %L\ lines
setlocal nowrap
setlocal cursorline

" Variables
unlet b:undo_ftplugin

" Commands
command! -buffer -nargs=1 -bang Filter call qf#filter(<q-args>, expand("<bang>") == "!" ? 1 : 0)

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
