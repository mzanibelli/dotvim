" Mappings
nnoremap <silent> <Leader>f :<C-U>echo expand('%:p')<CR>

" Init
silent! call mkdir(&undodir, "p")
silent! call mkdir(&backupdir, "p")
silent! call mkdir(&directory, "p")

" Autocommands
augroup FILE
    autocmd!
    autocmd BufFilePost * filetype detect
    autocmd BufWritePre * call file#mkdir(expand("<afile>"), +expand("<abuf>"))
    autocmd BufWritePre * call file#backupext()
    autocmd CursorHold,BufWritePost * unlet! b:wrongformat
augroup END
