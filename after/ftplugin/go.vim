" Ftplugin
if exists('b:loaded_local_ftplugin_go')
    finish
endif
let b:loaded_local_ftplugin_go = 1

" Commands
command -buffer -nargs=0 Test silent call go#test()

" Compiler
compiler go

" Options
setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2
setlocal noexpandtab
setlocal formatoptions=crqj

" Variables
let b:autoclose = ['expansion', 'square', 'quote', 'args']
let b:autocompile = 1
let b:commentprefix = '//'
