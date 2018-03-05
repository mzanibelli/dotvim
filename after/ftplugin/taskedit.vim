" Ftplugin
if exists('b:loaded_local_ftplugin_taskedit')
    finish
endif
let b:loaded_local_ftplugin_taskedit = 1

" Variables
let b:norestore = 1
let b:noformatalerts = 1

" Options
setlocal nobuflisted
