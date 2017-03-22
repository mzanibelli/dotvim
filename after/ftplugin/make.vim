" Ftplugin
if exists('b:loaded_local_ftplugin_make')
    finish
endif
let b:loaded_local_ftplugin_make = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Options
setlocal ts=8 sts=8 sw=8 noexpandtab

" Variables
let b:autoclose = ['quote']

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
