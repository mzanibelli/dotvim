" Plugin
if exists('g:loaded_local_help')
  finish
endif
let g:loaded_local_help = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Commands
command! -nargs=* -complete=help Help call help#help(<q-args>)

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
