" Ftplugin
if exists('b:loaded_local_ftplugin_zsh')
    finish
endif
let b:loaded_local_ftplugin_zsh = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Variables
let b:autoclose = ['quote', 'doublesquare']

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
