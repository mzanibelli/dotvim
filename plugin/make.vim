" Plugin
if exists('g:loaded_local_plugin_make')
    finish
endif
let g:loaded_local_plugin_make = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Commands
command! -nargs=* Make call make#make()

" Autocommands
augroup MAKE
    autocmd!
    autocmd BufWritePost * call make#auto()
augroup END

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
