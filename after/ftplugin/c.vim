" Ftplugin
if exists('b:loaded_local_ftplugin_c')
    finish
endif
let b:loaded_local_ftplugin_c = 1

" Options
setlocal formatoptions=crqj

" Variables
let b:commentprefix = '//'
let b:autoclose = ['expansion', 'square', 'quote', 'args']
