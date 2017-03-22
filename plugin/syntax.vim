" Plugin
if exists('g:loaded_local_plugin_syntax')
    finish
endif
let g:loaded_local_plugin_syntax = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Commands
command! -nargs=0 Syntax call syntax#toggle()

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
