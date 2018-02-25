" Ftplugin
if exists('b:loaded_local_ftplugin_git')
    finish
endif
let b:loaded_local_ftplugin_git = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Options
setlocal nobuflisted

" Variables
let b:noformatalerts = 1

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
