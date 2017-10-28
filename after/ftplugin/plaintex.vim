" Ftplugin
if exists('b:loaded_local_ftplugin_plaintex')
    finish
endif
let b:loaded_local_ftplugin_plaintex = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Options
setlocal spell
setlocal conceallevel=0

" Compiler
compiler tex

" Variables
let b:ftsnippets = {",,": "\\%{}"}
let b:autocompile = 1
let b:commentprefix = '%'
let b:autoclose = ['quote']

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
