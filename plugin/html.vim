" Plugin
if exists('g:loaded_local_html')
  finish
endif
let g:loaded_local_html = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Variables
let g:html_indent_script1="inc"
let g:html_indent_style1="inc"

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
