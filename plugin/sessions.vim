nnoremap <silent> <Leader>, :<C-U>call sessions#load()<CR>

augroup SESSIONS
    autocmd!
    autocmd VimLeave * call sessions#make()
augroup END
