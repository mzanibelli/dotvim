" Ftplugin
if exists('b:loaded_local_ftplugin_make')
    finish
endif
let b:loaded_local_ftplugin_make = 1

" Options
setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal noexpandtab
setlocal formatoptions=crqj

" Variables
let b:autoclose = ['quote']
