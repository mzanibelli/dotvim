" Ftplugin
if exists('b:loaded_local_ftplugin_taskedit')
  finish
endif
let b:loaded_local_ftplugin_taskedit = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Init
call sessions#disable()
execute "normal! /Description\<CR>W"

" Variables
let b:norestore = 1

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
