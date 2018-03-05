" Ftplugin
if exists('b:loaded_local_ftplugin_git')
    finish
endif
let b:loaded_local_ftplugin_git = 1

" Options
setlocal nobuflisted

" Variables
let b:noformatalerts = 1
