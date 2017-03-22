" Plugin
if exists('g:loaded_local_plugin_xxl')
    finish
endif
let g:loaded_local_plugin_xxl = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Autocommands
augroup XXL
    autocmd!
    autocmd BufReadPre * call xxl#init(expand("<afile>"))
augroup END

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
