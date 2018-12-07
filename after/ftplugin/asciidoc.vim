" Ftplugin
if exists('b:loaded_local_ftplugin_asciidoc')
    finish
endif
let b:loaded_local_ftplugin_asciidoc = 1

" Variables
let b:completiontype = "\<C-X>\<C-K>"
let b:autoclose = ['quote']

" Options
setlocal nonumber
setlocal textwidth=60
setlocal spell
setlocal comments=
setlocal formatoptions=crqjtn
setlocal indentexpr=
