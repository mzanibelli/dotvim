" Plugin
if exists('g:loaded_local_plugin_snippets')
  finish
endif
let g:loaded_local_plugin_snippets = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Autocommands
augroup SNIPPETS
    autocmd!
    autocmd FileType * call snippets#init()
augroup END

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
