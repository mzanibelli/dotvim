" Ftplugin
if exists('b:loaded_local_ftplugin_asciidoc')
    finish
endif
let b:loaded_local_ftplugin_asciidoc = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Variables
let b:textformat = 1
let b:completiontype = "\<C-X>\<C-K>"
let b:autoclose = ['quote']

" Options
setlocal nonumber
setlocal textwidth=60
setlocal spell

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
