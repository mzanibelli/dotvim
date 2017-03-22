" Plugin
if exists('g:loaded_local_plugin_cursor')
  finish
endif
let g:loaded_local_plugin_cursor = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Autocommands
augroup CURSOR
    autocmd!
    autocmd VimEnter * if &term ==# "linux" | let &t_ve = substitute(&t_ve, '\e[?\zs0c', '6;14;224c', 'g') | endif
augroup END

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
