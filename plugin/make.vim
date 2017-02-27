command! -nargs=* Make call make#make()

nnoremap <silent> <Leader>w :<C-U>call make#make()<CR>

augroup MAKE
    autocmd!
    autocmd BufWritePost * if exists("b:autocompile") && b:autocompile == 1 | call make#make() | endif
augroup END
