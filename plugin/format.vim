" Plugin
if exists('g:loaded_local_plugin_format')
  finish
endif
let g:loaded_local_plugin_format = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Commands
command! -buffer -nargs=0 Format call format#format()
command! -nargs=0 Fix silent! call format#fix()
command! -nargs=0 Reindent silent! call format#reindent()

" Autocommands
augroup FORMAT
    autocmd!
    autocmd BufWritePre * call format#auto()
    autocmd FileType * call format#forceoptions()
augroup END

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
