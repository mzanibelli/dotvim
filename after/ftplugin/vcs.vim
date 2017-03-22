" Ftplugin
if exists('b:loaded_local_ftplugin_vcs')
    finish
endif
let b:loaded_local_ftplugin_vcs = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Variables
let b:norestore = 1
let b:completiontype = "\<C-X>\<C-F>"
let b:nosession = 1

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
