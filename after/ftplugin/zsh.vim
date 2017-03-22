" Ftplugin
if exists('b:loaded_local_ftplugin_zsh')
  finish
endif
let b:loaded_local_ftplugin_zsh = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Variables
let b:headerstring='#!/bin/zsh'
let b:autoclose = ['quote', 'shell']

" Mappings
nnoremap <buffer> <silent> <Leader>x :<C-U>call shell#run('zsh %')<CR>

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
