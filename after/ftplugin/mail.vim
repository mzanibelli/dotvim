" Ftplugin
if exists('b:loaded_local_ftplugin_mail')
  finish
endif
let b:loaded_local_ftplugin_mail = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Init
call sessions#disable()
call text#mode()

" Options
setlocal formatoptions+=w
setlocal spelllang=fr

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
