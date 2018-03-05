" Plugin
if exists('g:loaded_local_plugin_completion')
    finish
endif
let g:loaded_local_plugin_completion = 1

" Mappings
inoremap <silent> <expr> <Tab> completion#complete(0)
inoremap <silent> <expr> <S-Tab> completion#complete(1)
inoremap <C-T> <Tab>

" Autocommands
augroup COMPLETION
    autocmd!
    autocmd CompleteDone * call completion#undouble()
augroup END
