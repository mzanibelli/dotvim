" Ftplugin
if exists('b:loaded_local_ftplugin_sh')
    finish
endif
let b:loaded_local_ftplugin_sh = 1

" Compiler
compiler sh

" Options
setlocal formatoptions=crqj
setlocal formatprg=shfmt\ -i\ 4\ -ci\ -kp

" Variables
let b:autoclose = ['quote', 'doublesquare', 'expansion']
let b:autocompile = 1
let b:ftsnippets = {"shellcheck": "# shellcheck disable=% #"}
