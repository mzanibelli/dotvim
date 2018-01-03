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
command! -buffer -nargs=0 Functions silent call php#functions()

" Mappings
execute 'nnoremap <buffer> <silent> [[ :<C-U>let search = @/<CR>?' . escape(php#funcregex(), '|') . '?<CR>:let @/ = search<CR>'
execute 'nnoremap <buffer> <silent> ]] :<C-U>let search = @/<CR>/' . escape(php#funcregex(), '|') . '/<CR>:let @/ = search<CR>'
inoremap <buffer> <silent> <expr> , default#mapdouble(',', "\<C-H> => ")
if executable("php")
    nnoremap <buffer> <silent> <Leader>x :<C-U>call shell#run('php %')<CR>
endif

" Options
setlocal foldenable
setlocal includeexpr=php#includeexpr(v:fname)
setlocal suffixesadd=.php
setlocal isfname+=\

" Variables
let b:commentprefix = '//'
let b:autoclose = ['expansion', 'square', 'quote']
let b:autocompile = 1
let b:funcsnippets = 1
let b:ftsnippets = {"elog": "error_log(%)", "vdump": "var_dump(%)", "printr": "print_r(%, true)"}
if executable("php-cs-fixer")
    let b:reformatprg = "php-cs-fixer --quiet --no-interaction fix --using-cache=no %s"
endif

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
