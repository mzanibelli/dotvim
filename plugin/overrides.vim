" Plugin
if exists('g:loaded_local_plugin_overrides')
    finish
endif
let g:loaded_local_plugin_overrides = 1

" Autocommands
augroup OVERRIDE
    autocmd!
    autocmd User DeferPost call cli#override("w$", "w")
    autocmd User DeferPost call cli#override("w<", "w")
    autocmd User DeferPost call cli#override("qw", "wq")
    autocmd User DeferPost call cli#override("aq", "qa")
    autocmd User DeferPost call cli#override("w!!", "write !sudo tee % > /dev/null")
augroup END
