" Ftplugin
if exists('b:loaded_local_ftplugin_python')
  finish
endif
let b:loaded_local_ftplugin_python = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Compiler
compiler python

" Options
setlocal foldenable
setlocal sw=4 sts=4 ts=8 expandtab

" Variables
let b:headerstring = '#!/usr/bin/python2'
let b:autoclose = ['quote', 'square']
let b:autocompile = 1

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
