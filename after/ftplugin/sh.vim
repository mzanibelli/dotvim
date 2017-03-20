" Variables
let b:autocompile=1
let b:headerstring='#!/bin/bash'
let b:autoclose = ['quote', 'shell']

" Mappings
nnoremap <buffer> <silent> <Leader>x :<C-U>call shell#run('bash %')<CR>

" Options
setlocal makeprg=shellcheck\ -f\ gcc\ %\ \\\|\ grep\ -F\ '\ error:\ '
