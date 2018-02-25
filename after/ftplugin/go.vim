" Ftplugin
if exists('b:loaded_local_ftplugin_go')
    finish
endif
let b:loaded_local_ftplugin_go = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Compiler
compiler go

" Options
setlocal foldenable
setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal noexpandtab
setlocal formatoptions=crqj

" Variables
let b:autoclose = ['expansion', 'square', 'quote', 'args']
let b:autocompile = 1

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
