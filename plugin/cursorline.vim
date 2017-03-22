" Plugin
if exists('g:loaded_local_cursorline')
  finish
endif
let g:loaded_local_cursorline = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Autocommands
augroup CURSORLINE
    autocmd!
    autocmd BufEnter,WinEnter * setlocal cursorline
    autocmd BufLeave,WinLeave * setlocal nocursorline
augroup END

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
