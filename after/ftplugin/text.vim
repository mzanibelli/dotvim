" Ftplugin
if exists('b:loaded_local_ftplugin_text')
  finish
endif
let b:loaded_local_ftplugin_text = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Variables
let b:textmode = 1

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
