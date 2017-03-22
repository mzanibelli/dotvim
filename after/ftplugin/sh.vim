" Compiler
compiler sh

" Variables
let b:headerstring='#!/bin/bash'
let b:autoclose = ['quote', 'shell']

" Mappings
nnoremap <buffer> <silent> <Leader>x :<C-U>call shell#run('bash %')<CR>
