" Ftplugin
if exists('b:loaded_local_ftplugin_python')
    finish
endif
let b:loaded_local_ftplugin_python = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Compiler
compiler python

" Options
setlocal foldenable
setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal noexpandtab

" Variables
let b:autoclose = ['quote', 'square', 'args']
let b:autocompile = 1

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
