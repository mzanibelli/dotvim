" Ftplugin
if exists('b:loaded_local_ftplugin_help')
    finish
endif
let b:loaded_local_ftplugin_help = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Options
setlocal bufhidden=wipe

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
