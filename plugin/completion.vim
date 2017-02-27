inoremap <silent> <expr> <Tab> completion#complete(0)
inoremap <silent> <expr> <S-Tab> completion#complete(1)
inoremap <C-T> <Tab>

augroup COMPLETION
    autocmd!
    autocmd CompleteDone * call completion#undouble()
augroup END
