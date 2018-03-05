" Ftplugin
if exists('b:loaded_local_ftplugin_java')
    finish
endif
let b:loaded_local_ftplugin_java = 1

" Options
setlocal formatoptions=crqj

" Variables
let b:commentprefix = '//'
let b:autoclose = ['expansion', 'square', 'quote', 'args']
