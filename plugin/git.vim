" Plugin
if exists('g:loaded_local_plugin_git')
    finish
endif
let g:loaded_local_plugin_git = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Autocommands
augroup GIT
    autocmd!
    autocmd BufReadPost fugitive://* set bufhidden=delete
augroup END

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
