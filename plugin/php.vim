" Plugin
if exists('g:loaded_local_plugin_php')
  finish
endif
let g:loaded_local_plugin_php = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Variables
let g:PHP_autoformatcomment=1
let g:PHP_outdentphpescape=0
let g:PHP_removeCRwhenUnix=1
let g:PHP_vintage_case_default_indent=1

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
