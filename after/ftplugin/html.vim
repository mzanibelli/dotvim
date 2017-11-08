" Ftplugin
if exists('b:loaded_local_ftplugin_html')
    finish
endif
let b:loaded_local_ftplugin_html = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Variables
let b:autoclose = ['tag', 'quote', 'doublecurly']

" Options
if executable('html-beautify')
    let &l:formatprg = 'html-beautify -f - -I -s '.&shiftwidth.' 2>/dev/null'
endif

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
