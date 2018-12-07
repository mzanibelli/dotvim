" Ftplugin
if exists('b:loaded_local_ftplugin_svn')
    finish
endif
let b:loaded_local_ftplugin_svn = 1

" Options
setlocal nonumber
setlocal textwidth=60
setlocal spell
setlocal nobuflisted
setlocal comments=
setlocal formatoptions=crqjtn
setlocal indentexpr=

" Variables
let b:norestore = 1
let b:completiontype = "\<C-X>\<C-K>"
let b:autoclose = ['quote']
