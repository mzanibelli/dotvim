" Ftplugin
if exists('b:loaded_local_ftplugin_yaml')
    finish
endif
let b:loaded_local_ftplugin_yaml = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Options
setlocal softtabstop=2
setlocal shiftwidth=2
setlocal expandtab
setlocal formatoptions=crqj

" Variables
let b:autoclose = ['quote', 'doublecurly']

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
