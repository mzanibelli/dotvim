" Init
call surround#lightweight()

" Variables
let b:autocompile=1
let b:headerstring='#!/bin/bash'

" Mappings
nnoremap <buffer> <silent> <Leader>x :<C-U>call shell#run('bash %')<CR>

" Options
setlocal makeprg=shellcheck\ -f\ gcc\ %\ \\\|\ grep\ -F\ '\ error:\ '
