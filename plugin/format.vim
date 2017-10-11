" Plugin
if exists('g:loaded_local_plugin_format')
    finish
endif
let g:loaded_local_plugin_format = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Commands
command! -nargs=0 Reindent silent! call format#reindent()
command! -nargs=0 Reformat silent! call format#reformat()
command! -nargs=0 Trim silent! call format#trim()
command! -nargs=0 Pack silent! call format#pack()
command! -nargs=0 Retab silent! call format#retab()
command! -nargs=0 Fix silent! call format#fix()

" Autocommands
augroup FORMAT
    autocmd!
    autocmd FileType * call format#forceoptions()
    autocmd CursorHold,BufWritePost * unlet! b:wrongformat
augroup END

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
