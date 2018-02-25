" Ftplugin
if exists('b:loaded_local_ftplugin_html')
    finish
endif
let b:loaded_local_ftplugin_html = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Compiler
compiler html

" Options
if executable("html-beautify")
    setlocal formatprg=html-beautify\ -qI\ -s\ 4\ -f\ -
endif

" Variables
let b:autoclose = ['tag', 'quote', 'doublecurly']
let b:autocompile = 1

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
