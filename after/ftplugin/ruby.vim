" Ftplugin
if exists('b:loaded_local_ftplugin_ruby')
  finish
endif
let b:loaded_local_ftplugin_ruby = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Compiler
compiler ruby

" Mappings
nnoremap <buffer> <silent> <Leader>x :<C-U>call shell#run('ruby %')<CR>

" Variables
let b:headerstring='#!/usr/bin/ruby'
let b:autoclose = ['quote', 'square']
let b:autocompile=1

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
