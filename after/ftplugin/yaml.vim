" Ftplugin
if exists('b:loaded_local_ftplugin_yaml')
    finish
endif
let b:loaded_local_ftplugin_yaml = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Options
setlocal ts=2 sts=2 sw=2 expandtab

" Variables
let b:autoclose = ['tpl', 'quote']

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
