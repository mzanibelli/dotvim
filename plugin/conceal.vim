" Plugin
if exists('g:loaded_local_plugin_conceal')
  finish
endif
let g:loaded_local_plugin_conceal = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Autocommands
augroup CONCEAL
    autocmd!
    autocmd BufReadPost * syntax match Ignore /\r$/ conceal
augroup END

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
