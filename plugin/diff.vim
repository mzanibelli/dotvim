" Commands
command! -nargs=0 NextConflict normal! /\v^[<>=]{4,7}<CR>
command! -nargs=0 PrevConflict normal! ?\v^[<>=]{4,7}<CR>

" Mappings
nnoremap <silent> <Leader>d :<C-U>call diff#toggle()<CR>

" Autocommands
augroup DIFF
    autocmd!
    autocmd BufWritePost * if &diff | diffupdate | endif
    autocmd FilterWritePost * if &diff | setlocal wrap | endif
augroup END
