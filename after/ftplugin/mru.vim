" Ftplugin
if exists('b:loaded_local_ftplugin_mru')
    finish
endif
let b:loaded_local_ftplugin_mru = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Mappings
nnoremap <silent> <buffer> <CR> :<C-U>call mru#open()<CR>
nnoremap <silent> <buffer> <Esc> :<C-U>quit<CR>

" Options
setlocal nomodifiable
setlocal nomodified
setlocal readonly
setlocal bufhidden=wipe
setlocal nowrap
setlocal nonumber
setlocal statusline=[MRU]
setlocal cursorline
setlocal winfixheight
" setlocal buftype=nowrite

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
