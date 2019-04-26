" Ftplugin
if exists('b:loaded_local_ftplugin_qf')
    finish
endif
let b:loaded_local_ftplugin_qf = 1

" Mappings
nnoremap <buffer> <CR> <CR>zv

" Options
setlocal statusline=%f\ %L\ lines
setlocal nowrap

" Variables
unlet b:undo_ftplugin
let b:noformatalerts = 1

" Commands
command! -buffer -nargs=1 -bang Filter call qf#filter(<q-args>, expand("<bang>") == "!" ? 1 : 0)
