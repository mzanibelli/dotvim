" Compiler
compiler sh

" Variables
let b:headerstring='#!/bin/bash'
let b:autoclose = ['quote', 'shell']
let b:autocompile=1

" Mappings
nnoremap <buffer> <silent> <Leader>x :<C-U>call shell#run('bash %')<CR>
