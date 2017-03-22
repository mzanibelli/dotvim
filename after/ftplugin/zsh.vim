" Variables
let b:headerstring='#!/bin/zsh'
let b:autoclose = ['quote', 'shell']

" Mappings
nnoremap <buffer> <silent> <Leader>x :<C-U>call shell#run('zsh %')<CR>
