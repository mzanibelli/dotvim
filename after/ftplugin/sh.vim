" Ftplugin
if exists('b:loaded_local_ftplugin_sh')
    finish
endif
let b:loaded_local_ftplugin_sh = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Compiler
compiler sh

" Options
setlocal formatoptions=crqj

" Variables
let b:autoclose = ['quote', 'doublesquare']
let b:autocompile = 1

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
