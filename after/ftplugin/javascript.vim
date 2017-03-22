" Ftplugin
if exists('b:loaded_local_ftplugin_javascript')
  finish
endif
let b:loaded_local_ftplugin_javascript = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Options
setlocal foldmarker={,}
setlocal foldmethod=marker

" Variables
let b:commentprefix = '//'
let b:autoclose = ['curly', 'square', 'quote']
let b:autocompile = 1
let b:ftsnippets = {"clog": "console.log(%);"}

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
