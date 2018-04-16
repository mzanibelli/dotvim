" Ftplugin
if exists('b:loaded_local_ftplugin_scss')
    finish
endif
let b:loaded_local_ftplugin_scss = 1

" Options
setlocal foldmarker={,}
setlocal foldmethod=marker
setlocal iskeyword+=-
setlocal softtabstop=2
setlocal shiftwidth=2
setlocal expandtab
setlocal formatoptions=crqj

" Compiler
compiler scss

" Variables
let b:autoclose = ['quote', 'expansion']
let b:autocompile = 1
