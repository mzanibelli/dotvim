" Ftplugin
if exists('b:loaded_local_ftplugin_gql')
    finish
endif
let b:loaded_local_ftplugin_gql = 1

" Options
setlocal softtabstop=2
setlocal shiftwidth=2
setlocal expandtab
setlocal commentstring=#\ %s
setlocal formatoptions=crqj

" Compiler
compiler prettier

" Variables
let b:commentprefix = '#'
let b:autocompile = 1
let b:autoclose = ['expansion', 'quote']
