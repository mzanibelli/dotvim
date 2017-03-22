" Ftplugin
if exists('b:loaded_local_ftplugin_lisp')
    finish
endif
let b:loaded_local_ftplugin_lisp = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Variables
let b:commentprefix = ';'
let b:autoclose = ['quote']

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
