" Ftplugin
if exists('b:loaded_local_ftplugin_sql')
  finish
endif
let b:loaded_local_ftplugin_sql = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Mappings
inoremap <buffer> ' '
inoremap <buffer> <expr> '' sql#quote()

" Variables
let b:commentprefix = '--'
let b:autoclose = ['quote']

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
