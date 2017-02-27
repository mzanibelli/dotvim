" Mappings
nnoremap <silent> <Leader>, :<C-U>call sessions#load()<CR>

" Autocommands
augroup SESSIONS
    autocmd!
    autocmd VimLeave * call sessions#make()
augroup END
