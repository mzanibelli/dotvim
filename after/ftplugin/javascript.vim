" Ftplugin
if exists('b:loaded_local_ftplugin_javascript')
    finish
endif
let b:loaded_local_ftplugin_javascript = 1

" Compiler
compiler javascript

" Mappings
inoremap <buffer> <silent> <expr> , default#mapdouble(',', "\<C-H> => ")

" Options
setlocal foldmarker={,}
setlocal foldmethod=marker
setlocal softtabstop=2
setlocal shiftwidth=2
setlocal expandtab
setlocal suffixesadd=.js
setlocal include=^\\s*[^\/]\\+\\(from\\\|require(['\"]\\)
setlocal define=^\\s*const
setlocal matchpairs-=<:>
setlocal formatoptions=crqj

" Variables
let b:commentprefix = '//'
let b:autoclose = ['expansion', 'square', 'quote', 'args']
let b:autocompile = 1
let b:ftsnippets = {"clog": "console.log(%)"}
