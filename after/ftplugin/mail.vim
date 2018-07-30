" Ftplugin
if exists('b:loaded_local_ftplugin_mail')
    finish
endif
let b:loaded_local_ftplugin_mail = 1

" Options
setlocal nonumber
setlocal textwidth=60
setlocal spell
setlocal comments=
setlocal formatoptions=crqjwtn

" Variables
let b:completiontype = "\<C-X>\<C-K>"
let b:autoclose = ['quote']
let b:noformatalerts = 1
