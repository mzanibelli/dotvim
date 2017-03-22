" Ftplugin
if exists('b:loaded_local_ftplugin_vcs')
  finish
endif
let b:loaded_local_ftplugin_vcs = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Init
call sessions#disable()
call windows#preserve("%sort")
call windows#preserve("%!uniq")

" Variables
let b:norestore = 1
let b:completiontype = "\<C-X>\<C-F>"

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
