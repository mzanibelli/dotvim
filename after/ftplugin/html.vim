" Ftplugin
if exists('b:loaded_local_ftplugin_html')
    finish
endif
let b:loaded_local_ftplugin_html = 1

" Compiler
compiler html

" Options
setlocal matchpairs-=<:>
if executable("html-beautify")
    setlocal formatprg=html-beautify\ -qI\ -s\ 4\ -f\ -
endif

" Variables
let b:autoclose = ['quote', 'doublecurly']
let b:autocompile = 1
