" Ftplugin
if exists('b:loaded_local_ftplugin_vim')
    finish
endif
let b:loaded_local_ftplugin_vim = 1

" Options
setlocal keywordprg=:help
setlocal formatoptions=crqj

" Variables
let b:completiontype = "\<C-X>\<C-V>"
let b:commentprefix = '"'
let b:autoclose = ['quote', 'square', 'args']
