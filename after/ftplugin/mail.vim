" Ftplugin
if exists('b:loaded_local_ftplugin_mail')
    finish
endif
let b:loaded_local_ftplugin_mail = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Options
setlocal formatoptions+=w
setlocal nonumber
setlocal textwidth=60
setlocal spell
setlocal comments=

" Variables
let b:textformat = 1
let b:completiontype = "\<C-X>\<C-K>"
let b:autoclose = ['quote']

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
