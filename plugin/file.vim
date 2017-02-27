command! -buffer -nargs=0 Format call format#format()
command! -nargs=0 FixFormat silent! call format#fix()

nnoremap <silent> <Leader>f :<C-U>echo expand('%:p')<CR>

silent! call mkdir(&undodir, "p")
silent! call mkdir(&backupdir, "p")
silent! call mkdir(&directory, "p")

augroup FILE
    autocmd!
    autocmd BufFilePost * filetype detect
    autocmd BufWritePre * call file#mkdir(expand("<afile>"), +expand("<abuf>"))
    autocmd BufWritePre * call file#backupext()
    autocmd CursorHold,BufWritePost * unlet! b:format
augroup END
