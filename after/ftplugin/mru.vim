" Ftplugin
if exists('b:loaded_local_ftplugin_mru')
    finish
endif
let b:loaded_local_ftplugin_mru = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

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
setlocal nowrap
setlocal nonumber
setlocal cursorline
setlocal winfixheight
setlocal noswapfile
setlocal statusline=[MRU]
setlocal statusline+=\ %{getcwd()}
setlocal statusline+=\ [%{strftime('%m/%d/%Y')}]
setlocal statusline+=%{exists('g:bgoutput')?'[*]':''}

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
