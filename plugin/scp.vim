" Plugin
if exists('g:loaded_local_plugin_scp')
  finish
endif
let g:loaded_local_plugin_scp = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Commands
command! -nargs=0 RemoteEdit call scp#edit('remote')
command! -nargs=0 LocalEdit call scp#editlocal('local')
command! -nargs=0 RemoteSync call scp#sync('remote')
command! -nargs=0 LocalSync call scp#sync('remote')
command! -nargs=* Mirror call scp#reset(<q-args>)

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
