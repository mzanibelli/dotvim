" Plugin
if exists('g:loaded_local_plugin_defer')
    finish
endif
let g:loaded_local_plugin_defer = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Autocommands
augroup DEFER
    autocmd!
    autocmd VimEnter * call timer_start(500, "defer#load")
augroup END

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
