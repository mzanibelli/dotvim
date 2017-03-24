" Ftplugin
if exists('b:loaded_local_ftplugin_svn')
    finish
endif
let b:loaded_local_ftplugin_svn = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Commands
command! -nargs=0 Abort execute "normal! ggdG:\<C-U>x\<CR>"

" Options
setlocal nonumber
setlocal textwidth=60
setlocal spell

" Variables
let b:norestore = 1
let b:textformat = 1
let b:completiontype = "\<C-X>\<C-K>"
let b:autoclose = ['quote']
let b:nosession = 1

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
