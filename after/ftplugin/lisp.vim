" Ftplugin
if exists('b:loaded_local_ftplugin_lisp')
    finish
endif
let b:loaded_local_ftplugin_lisp = 1

" Options
setlocal softtabstop=2
setlocal shiftwidth=2
setlocal expandtab
setlocal lisp
setlocal formatoptions=crqj

" Variables
let b:commentprefix = ';'
let b:autoclose = ['quote', 'parentheses']
