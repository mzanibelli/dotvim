" Ftplugin
if exists('b:loaded_local_ftplugin_crontab')
    finish
endif
let b:loaded_local_ftplugin_crontab = 1

" Options
setlocal backupcopy=yes
