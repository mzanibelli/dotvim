" Ftplugin
if exists('b:loaded_local_ftplugin_gql')
    finish
endif
let b:loaded_local_ftplugin_gql = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Compiler
compiler javascript

" Options
setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2
setlocal expandtab
setlocal commentstring=#\ %s

" Variables
let b:commentprefix = '#'
let b:autoclose = ['expansion', 'quote']

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
