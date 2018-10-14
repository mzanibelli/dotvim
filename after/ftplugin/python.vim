" Ftplugin
if exists('b:loaded_local_ftplugin_python')
    finish
endif
let b:loaded_local_ftplugin_python = 1

" Compiler
compiler python

" Options
setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal noexpandtab
setlocal formatoptions=crqj

" Variables
let b:autoclose = ['quote', 'square', 'args']
let b:autocompile = 1
