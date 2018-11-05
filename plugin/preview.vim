" Plugin
if exists('g:loaded_local_plugin_preview')
    finish
endif
let g:loaded_local_plugin_preview = 1

" Autocommands
augroup PREVIEW
    autocmd!
    autocmd BufWritePost * call preview#auto()
augroup END
