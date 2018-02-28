" Ftplugin
if exists('b:loaded_local_ftplugin_crontab')
    finish
endif
let b:loaded_local_ftplugin_crontab = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Options
setlocal backupcopy=yes

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
