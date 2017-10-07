" Ftplugin
if exists('b:loaded_local_ftplugin_lisp')
    finish
endif
let b:loaded_local_ftplugin_lisp = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Mappings
if executable("clisp")
    nnoremap <buffer> <silent> <Leader>x :<C-U>call shell#run("clisp %")<CR>
endif

" Options
setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2
setlocal expandtab
setlocal lisp

" Variables
let b:commentprefix = ';'
let b:autoclose = ['quote', 'parenthesis']

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
