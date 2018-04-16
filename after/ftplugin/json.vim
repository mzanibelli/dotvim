" Ftplugin
if exists('b:loaded_local_ftplugin_json')
    finish
endif
let b:loaded_local_ftplugin_json = 1

" Compiler
compiler json

" Options
setlocal conceallevel=0
setlocal softtabstop=2
setlocal shiftwidth=2
setlocal expandtab
if executable("jq")
    setlocal formatprg=jq\ .
endif

" Variables
let b:autoclose = ['quote']
let b:autocompile = 1
