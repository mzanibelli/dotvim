" Ftplugin
if exists('b:loaded_local_ftplugin_ruby')
    finish
endif
let b:loaded_local_ftplugin_ruby = 1

" Compiler
compiler ruby

" Options
setlocal formatoptions=crqj

" Variables
let b:autoclose = ['quote', 'square', 'args']
let b:autocompile = 1
