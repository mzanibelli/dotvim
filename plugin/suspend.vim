nnoremap <silent> <C-Z> :<C-U>call suspend#ctrlz()<CR>
vnoremap <silent> <C-Z> :<C-U>call suspend#ctrlz()<CR>
cnoremap <silent> <C-Z> :<C-U>call suspend#ctrlz()<CR>
inoremap <silent> <C-Z> <Esc>:<C-U>call suspend#ctrlz()<CR>

augroup SUSPEND
    autocmd!
    autocmd VimEnter * call suspend#stdout2vim()
    autocmd VimLeave * call suspend#stdout2shell()
augroup END
