" Ftplugin
if exists('b:loaded_local_ftplugin_css')
    finish
endif
let b:loaded_local_ftplugin_css = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Options
setlocal foldmarker={,}
setlocal foldmethod=marker
setlocal iskeyword+=-
setlocal formatoptions=crqj

" Compiler
compiler prettier

" Variables
let b:autoclose = ['quote', 'expansion']
let b:autocompile = 1

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
