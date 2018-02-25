" Ftplugin
if exists('b:loaded_local_ftplugin_taskedit')
    finish
endif
let b:loaded_local_ftplugin_taskedit = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Variables
let b:norestore = 1
let b:noformatalerts = 1

" Options
setlocal nobuflisted

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
