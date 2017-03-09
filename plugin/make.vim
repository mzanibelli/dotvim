" Commands
command! -nargs=* Make call make#make()

" Mappings
nnoremap <silent> <Leader>w :<C-U>call make#make()<CR>

" Autocommands
augroup MAKE
    autocmd!
    autocmd BufReadPost,BufWritePost,TextChanged,TextChangedI * silent call make#auto()
augroup END

" Init
sign define MakeprgError text=>> texthl=Normal
