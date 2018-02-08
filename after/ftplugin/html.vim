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

" Variables
let b:autoclose = ['tag', 'quote', 'doublecurly']
let b:autocompile = 1
if executable('html-beautify')
    let b:reformatprg = 'html-beautify -q -r -I -s '.&shiftwidth.' -f %s 2>/dev/null'
endif

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
