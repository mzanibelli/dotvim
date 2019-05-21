" Ftplugin
if exists('b:loaded_local_ftplugin_yaml')
    finish
endif
let b:loaded_local_ftplugin_yaml = 1

" Compiler
compiler yaml

" Options
setlocal softtabstop=2
setlocal shiftwidth=2
setlocal expandtab
setlocal formatoptions=crqj

" Variables
let b:autoclose = ['quote', 'doublecurly']
let b:autocompile = 1
