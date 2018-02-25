" Ftplugin
if exists('b:loaded_local_ftplugin_javascript')
    finish
endif
let b:loaded_local_ftplugin_javascript = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Compiler
compiler javascript

" Mappings
inoremap <buffer> <silent> <expr> , default#mapdouble(',', "\<C-H> => ")

" Options
setlocal foldmarker={,}
setlocal foldmethod=marker
setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2
setlocal expandtab
setlocal suffixesadd=.js
setlocal include=^\\s*[^\/]\\+\\(from\\\|require(['\"]\\)
setlocal define=^\\s*const

" Variables
let b:commentprefix = '//'
let b:autoclose = ['expansion', 'square', 'quote', 'args']
let b:autocompile = 1
let b:ftsnippets = {"clog": "console.log(%)"}

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
