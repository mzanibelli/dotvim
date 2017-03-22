" Plugin
if exists('g:loaded_local_vimrc')
  finish
endif
let g:loaded_local_vimrc = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Autocommands
augroup VIMRC
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC | set ft=vim | execute "normal! zv"
    autocmd BufReadPost $MYVIMRC setlocal spelllang=en
augroup END

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
