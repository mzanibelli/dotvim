" Plugin
if exists('g:loaded_local_scp')
  finish
endif
let g:loaded_local_scp = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Commands
command! -nargs=0 Remote call scp#editremote()
command! -nargs=0 Local call scp#editlocal()
command! -nargs=0 Sync call scp#sync()
command! -nargs=* Mirror call scp#setremote(<q-args>)

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
