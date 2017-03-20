" Init
compiler ruby

" Mappings
nnoremap <buffer> <silent> <Leader>x :<C-U>call shell#run('ruby %')<CR>

" Variables
let b:headerstring='#!/usr/bin/ruby'
let b:autoclose = ['quote', 'square']
