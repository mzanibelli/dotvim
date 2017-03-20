" Autocommands
augroup DEFAULT
    autocmd!
    autocmd User SourceDetectPost call default#init()
augroup END

" Mappings
nnoremap <S-S> :<C-U>w<CR>
