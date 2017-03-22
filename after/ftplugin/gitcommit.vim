" Ftplugin
if exists('b:loaded_local_ftplugin_gitcommit')
  finish
endif
let b:loaded_local_ftplugin_gitcommit = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Variables
let b:norestore = 1
let b:textmode = 1
let b:nosession = 1

" Options
setlocal comments+=fb:-

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
