" Ftplugin
if exists('b:loaded_local_ftplugin_markdown')
    finish
endif
let b:loaded_local_ftplugin_markdown = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Compiler
compiler prettier

" Options
setlocal conceallevel=0

" Variables
let b:autoclose = ['quote']
let b:autocompile = 1

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
