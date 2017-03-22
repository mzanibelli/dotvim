" Plugin
if exists('g:loaded_local_binary')
  finish
endif
let g:loaded_local_binary = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Commands
command! -nargs=0 HexOn silent! %!xxd
command! -nargs=0 HexOff silent! %!xxd -r

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
