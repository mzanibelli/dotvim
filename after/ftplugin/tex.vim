" Ftplugin
if exists('b:loaded_local_ftplugin_tex')
  finish
endif
let b:loaded_local_ftplugin_tex = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Options
setlocal spell

" Variables
let b:autoclose = ['quote']

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
