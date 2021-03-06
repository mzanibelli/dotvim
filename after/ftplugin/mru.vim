" Ftplugin
if exists('b:loaded_local_ftplugin_mru')
    finish
endif
let b:loaded_local_ftplugin_mru = 1

" Mappings
nnoremap <silent> <buffer> <CR> :<C-U>call mru#open("edit")<CR>

" Options
setlocal nomodifiable
setlocal nomodified
setlocal readonly
setlocal bufhidden=wipe
setlocal nowrap
setlocal nonumber
setlocal noswapfile
setlocal statusline=[%{strftime('%d/%m/%Y')}]

" Variables
let b:noformatalerts = 1
