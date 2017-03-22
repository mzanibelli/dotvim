" Ftplugin
if exists('b:loaded_local_ftplugin_xresources')
  finish
endif
let b:loaded_local_ftplugin_xresources = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Mappings
nnoremap <buffer> <silent> <Leader>x :<C-U>call shell#run('xrdb %')<CR>

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
