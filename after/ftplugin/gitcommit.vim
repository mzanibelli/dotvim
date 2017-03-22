" Ftplugin
if exists('b:loaded_local_ftplugin_gitcommit')
    finish
endif
let b:loaded_local_ftplugin_gitcommit = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Variables
let b:norestore = 1
let b:textformat=1
let b:completiontype="\<C-X>\<C-K>"
let b:autoclose = ['quote']
let b:nosession = 1

" Options
setlocal comments+=fb:-
setlocal nonumber
setlocal textwidth=60
setlocal spell

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
