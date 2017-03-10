" Commands
command! -nargs=* Make call make#make()

" Mappings
nnoremap <silent> <Leader>w :<C-U>call make#make()<CR>

" Autocommands
augroup MAKE
    autocmd!
    autocmd BufReadPost,BufWritePost * silent call make#auto(0)
    autocmd TextChanged,TextChangedI * silent call make#auto(1)
augroup END

" Init
sign define MakeprgError text=>> texthl=Normal
