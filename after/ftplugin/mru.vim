" Ftplugin
if exists('b:loaded_local_ftplugin_mru')
    finish
endif
let b:loaded_local_ftplugin_mru = 1

" Mappings
nnoremap <silent> <buffer> <CR> :<C-U>call mru#open("edit")<CR>
nnoremap <silent> <buffer> e :<C-U>call mru#open("edit")<CR>
nnoremap <silent> <buffer> o :<C-U>call mru#open("split")<CR>
nnoremap <silent> <buffer> v :<C-U>call mru#open("vsplit")<CR>
nnoremap <silent> <buffer> t :<C-U>call mru#open("tabedit")<CR>
nnoremap <silent> <buffer> <Leader><Leader> :<C-U>call mru#open("edit")<CR>
nnoremap <silent> <buffer> <Esc> :<C-U>close<CR>

" Options
setlocal nomodifiable
setlocal nomodified
setlocal readonly
setlocal bufhidden=wipe
setlocal nobuflisted
setlocal nowrap
setlocal nonumber
setlocal cursorline
setlocal noswapfile
setlocal statusline=[%{strftime('%d/%m/%Y')}]
setlocal statusline+=%{exists('g:bgoutput')?'[*]':''}

" Variables
let b:noformatalerts = 1
