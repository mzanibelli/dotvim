" Plugin
if exists('g:loaded_local_plugin_overrides')
    finish
endif
let g:loaded_local_plugin_overrides = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Autocommands
augroup OVERRIDE
    autocmd!
    autocmd User DeferPost call cli#override("h", "Help")
    autocmd User DeferPost call cli#override("help", "Help")
    autocmd User DeferPost call cli#override("tag", "Tag")
    autocmd User DeferPost call cli#override("grep", "Grep")
    autocmd User DeferPost call cli#override("w!!", "SudoWrite")
    autocmd User DeferPost call cli#override("w$", "w")
    autocmd User DeferPost call cli#override("w<", "w")
    autocmd User DeferPost call cli#override("qw", "wq")
augroup END

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
