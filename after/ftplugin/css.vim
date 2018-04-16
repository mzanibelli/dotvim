" Ftplugin
if exists('b:loaded_local_ftplugin_css')
    finish
endif
let b:loaded_local_ftplugin_css = 1

" Options
setlocal foldmarker={,}
setlocal foldmethod=marker
setlocal iskeyword+=-
setlocal formatoptions=crqj

" Compiler
compiler css

" Variables
let b:autoclose = ['quote', 'expansion']
let b:autocompile = 1
