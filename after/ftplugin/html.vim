" Ftplugin
if exists('b:loaded_local_ftplugin_html')
    finish
endif
let b:loaded_local_ftplugin_html = 1

" Compiler
compiler html

" Options
setlocal matchpairs-=<:>
setlocal shiftwidth=2
setlocal tabstop=2
setlocal softtabstop=2

" Variables
let b:autoclose = ['quote', 'doublecurly']
let b:autocompile = 1
