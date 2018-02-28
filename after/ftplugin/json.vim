" Ftplugin
if exists('b:loaded_local_ftplugin_json')
    finish
endif
let b:loaded_local_ftplugin_json = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Compiler
compiler prettier

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

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
