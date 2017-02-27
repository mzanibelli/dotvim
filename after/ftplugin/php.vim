call cpp#funcsnippets()
call default#snippet("elog", "error_log(print_r(%, true));")
call default#snippet("vdump", "var_dump(%);")
command! -buffer -nargs=0 Format call php#format()
command! -buffer -nargs=0 Functions call qf#cload('call php#functions()')
compiler php
execute 'nnoremap <buffer> <silent> [[ :<C-U>let search = @/<CR>?' . escape(php#funcregex(), '|') . '?<CR>:let @/ = search<CR>'
execute 'nnoremap <buffer> <silent> ]] :<C-U>let search = @/<CR>/' . escape(php#funcregex(), '|') . '/<CR>:let @/ = search<CR>'
inoremap <buffer> <silent> <expr> , default#mapdouble(',', "\<C-H> => ")
let g:PHP_autoformatcomment=1
let g:PHP_outdentphpescape=0
let g:PHP_removeCRwhenUnix=1
let g:PHP_vintage_case_default_indent=1
nnoremap <buffer> <silent> <Leader>x :<C-U>call cli#LaunchScript('php %')<CR>
setlocal foldenable
vnoremap <buffer> <silent> <Leader>e :<C-U>call php#extract()<CR>
