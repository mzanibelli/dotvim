" Ftplugin
if exists('b:loaded_local_ftplugin_pass')
    finish
endif
let b:loaded_local_ftplugin_pass = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Options
setlocal noendofline
setlocal noswapfile

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
