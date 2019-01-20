" Ftplugin
if exists('b:loaded_local_ftplugin_elixir')
    finish
endif
let b:loaded_local_ftplugin_elixir = 1

" Compiler
compiler mix

" Options
setlocal formatoptions=crqj
setlocal softtabstop=2
setlocal shiftwidth=2

" Variables
let b:autoclose = ['quote', 'square', 'args']
let b:autocompile = 1
