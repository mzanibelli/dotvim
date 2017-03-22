" Plugin
if exists('g:loaded_local_plugin_text')
  finish
endif
let g:loaded_local_plugin_text = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Autocommands
augroup TEXT
    autocmd!
    autocmd FileType * call text#mode()
augroup END

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
