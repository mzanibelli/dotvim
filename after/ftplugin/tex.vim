" Ftplugin
if exists('b:loaded_local_ftplugin_tex')
    finish
endif
let b:loaded_local_ftplugin_tex = 1

" Options
setlocal spell
setlocal conceallevel=0
setlocal formatoptions=crqj

" Compiler
compiler tex

" Variables
let b:ftsnippets = {",,": "\\%{}"}
let b:autocompile = 1
let b:commentprefix = '%'
let b:autoclose = ['quote']
