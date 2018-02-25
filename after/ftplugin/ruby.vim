" Ftplugin
if exists('b:loaded_local_ftplugin_ruby')
    finish
endif
let b:loaded_local_ftplugin_ruby = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Compiler
compiler ruby

" Variables
let b:autoclose = ['quote', 'square', 'args']
let b:autocompile = 1

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
