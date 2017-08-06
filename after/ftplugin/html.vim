" Ftplugin
if exists('b:loaded_local_ftplugin_html')
    finish
endif
let b:loaded_local_ftplugin_html = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Commands
command! -buffer -range -nargs=0 Entities PreserveView call html#entities(<line1>, <line2>)

" Variables
let b:autoclose = ['tag', 'quote', 'tpl']

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
