" Ftplugin
if exists('b:loaded_local_ftplugin_zsh')
    finish
endif
let b:loaded_local_ftplugin_zsh = 1

" Options
setlocal formatoptions=crqj

" Compiler
compiler zsh

" Variables
let b:autoclose = ['quote', 'doublesquare']
let b:autocompile = 1
