" Plugin
if exists('g:loaded_local_plugin_cmdwin')
  finish
endif
let g:loaded_local_plugin_cmdwin = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Autocommands
augroup CMDWIN
    autocmd!
    autocmd CmdWinEnter * call cmdwin#mode()
augroup END

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
