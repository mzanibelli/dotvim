" Ftplugin
if exists('b:loaded_local_ftplugin_scss')
    finish
endif
let b:loaded_local_ftplugin_scss = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Options
setlocal foldmarker={,}
setlocal foldmethod=marker
setlocal iskeyword+=-
setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2
setlocal expandtab

" Compiler
compiler prettier

" Variables
let b:autoclose = ['quote', 'expansion']
let b:autocompile = 1
if executable('css-beautify')
    let b:reformatprg = 'css-beautify -q -r -s '.&shiftwidth.' -f %s 2>/dev/null'
endif

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
