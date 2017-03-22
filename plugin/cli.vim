" Plugin
if exists('g:loaded_local_plugin_cli')
  finish
endif
let g:loaded_local_plugin_cli = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Mappings
cnoremap <expr> <S-Tab> cli#stab()
cnoremap <expr> <CR> cli#cr()

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
