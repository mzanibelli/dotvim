" Ftplugin
if exists('b:loaded_local_ftplugin_php')
    finish
endif
let b:loaded_local_ftplugin_php = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Compiler
compiler php

" Commands
command! -buffer -nargs=0 Format call php#format()
command! -buffer -nargs=0 Functions call qf#cload('call php#functions()')

" Mappings
execute 'nnoremap <buffer> <silent> [[ :<C-U>let search = @/<CR>?' . escape(php#funcregex(), '|') . '?<CR>:let @/ = search<CR>'
execute 'nnoremap <buffer> <silent> ]] :<C-U>let search = @/<CR>/' . escape(php#funcregex(), '|') . '/<CR>:let @/ = search<CR>'
inoremap <buffer> <silent> <expr> , default#mapdouble(',', "\<C-H> => ")
vnoremap <buffer> <silent> <Leader>e :<C-U>call php#extract()<CR>
if executable("php")
    nnoremap <buffer> <silent> <Leader>x :<C-U>call shell#run('php %')<CR>
endif

" Options
setlocal foldenable

" Variables
let b:commentprefix = '//'
let b:headerstring = '#!/usr/bin/php'
let b:autoclose = ['curly', 'square', 'quote']
let b:autocompile = 1
let b:funcsnippets = 1
let b:ftsnippets = {"elog": "error_log(print_r(%, true));", "vdump": "var_dump(%);"}
let b:filemark = "P"

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
