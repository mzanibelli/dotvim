" Plugin
if exists('g:loaded_local_python')
  finish
endif
let g:loaded_local_python = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Variables
let g:python_highlight_all=1
let g:python_recommended_style=0

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
