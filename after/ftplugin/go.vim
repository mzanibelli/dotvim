" Ftplugin
if exists('b:loaded_local_ftplugin_go')
  finish
endif
let b:loaded_local_ftplugin_go = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Compiler
compiler go

" Options
setlocal foldenable
setlocal formatprg=gofmt\ -s

" Variables
let b:autoclose = ['curly', 'square', 'quote']
let b:autocompile = 1
let b:autoformat = 1

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
