" Init
compiler php
call cpp#funcsnippets()
call default#snippet("elog", "error_log(print_r(%, true));")
call default#snippet("vdump", "var_dump(%);")

" Commands
command! -buffer -nargs=0 Format call php#format()
command! -buffer -nargs=0 Functions call qf#cload('call php#functions()')

" Mappings
execute 'nnoremap <buffer> <silent> [[ :<C-U>let search = @/<CR>?' . escape(php#funcregex(), '|') . '?<CR>:let @/ = search<CR>'
execute 'nnoremap <buffer> <silent> ]] :<C-U>let search = @/<CR>/' . escape(php#funcregex(), '|') . '/<CR>:let @/ = search<CR>'
inoremap <buffer> <silent> <expr> , default#mapdouble(',', "\<C-H> => ")
nnoremap <buffer> <silent> <Leader>x :<C-U>call cli#LaunchScript('php %')<CR>
vnoremap <buffer> <silent> <Leader>e :<C-U>call php#extract()<CR>

" Options
setlocal foldenable

" Variables
let b:commentprefix='//'
let b:headerstring='#!/usr/bin/php'
