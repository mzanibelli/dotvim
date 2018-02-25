" Ftplugin
if exists('b:loaded_local_ftplugin_cpp')
    finish
endif
let b:loaded_local_ftplugin_cpp = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Options
setlocal formatoptions=crqj

" Variables
let b:commentprefix = '//'
let b:autoclose = ['expansion', 'square', 'quote', 'args']

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
