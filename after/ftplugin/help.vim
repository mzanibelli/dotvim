" Ftplugin
if exists('b:loaded_local_ftplugin_help')
    finish
endif
let b:loaded_local_ftplugin_help = 1

" Options
setlocal bufhidden=wipe
setlocal nobuflisted
setlocal nomodifiable
setlocal nomodified

" Variables
let b:noformatalerts = 1
