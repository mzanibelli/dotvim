" Ftplugin
if exists('b:loaded_local_ftplugin_java')
    finish
endif
let b:loaded_local_ftplugin_java = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Variables
let b:commentprefix = '//'
let b:autoclose = ['curly', 'square', 'quote']

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
