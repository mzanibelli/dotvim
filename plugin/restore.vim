" Plugin
if exists('g:loaded_local_plugin_restore')
    finish
endif
let g:loaded_local_plugin_restore = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Autocommands
augroup RESTORE
    autocmd!
    autocmd BufReadPost * call restore#position()
augroup END

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
