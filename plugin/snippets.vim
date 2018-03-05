" Plugin
if exists('g:loaded_local_plugin_snippets')
    finish
endif
let g:loaded_local_plugin_snippets = 1

" Autocommands
augroup SNIPPETS
    autocmd!
    autocmd FileType * call snippets#init()
augroup END
