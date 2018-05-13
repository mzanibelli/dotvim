" Ftplugin
if exists('b:loaded_local_ftplugin_sh')
    finish
endif
let b:loaded_local_ftplugin_sh = 1

" Compiler
compiler sh

" Options
setlocal formatoptions=crqj

" Variables
let b:autoclose = ['quote', 'doublesquare']
let b:autocompile = 1
let b:ftsnippets = {"shellcheck": "# shellcheck disable=%"}
