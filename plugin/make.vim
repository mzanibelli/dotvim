" Commands
command! -nargs=* Make call make#make()

" Mappings
nnoremap <silent> <Leader>w :<C-U>call make#make()<CR>

" Autocommands
augroup MAKE
    autocmd!
    autocmd BufWritePost * silent call make#auto(0)
    autocmd CursorHold * silent call make#auto(1)
    autocmd TextChanged,TextChangedI * let b:textchanged = 1
    autocmd BufLeave * let b:textchanged = 0
augroup END

" Init
sign define MakeprgError text=>> texthl=Normal
