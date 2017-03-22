" Ftplugin
if exists('b:loaded_local_ftplugin_sh')
    finish
endif
let b:loaded_local_ftplugin_sh = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Compiler
compiler sh

" Variables
let b:headerstring = '#!/bin/bash'
let b:autoclose = ['quote', 'shell']
let b:autocompile = 1

" Mappings
nnoremap <buffer> <silent> <Leader>x :<C-U>call shell#run('bash %')<CR>

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
