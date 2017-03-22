" Ftplugin
if exists('b:loaded_local_ftplugin_css')
  finish
endif
let b:loaded_local_ftplugin_css = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Options
setlocal foldmarker={,}
setlocal foldmethod=marker
setlocal iskeyword+=-

" Variables
let b:autoclose = ['quote', 'curly']

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
