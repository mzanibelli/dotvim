" Plugin
if exists('g:loaded_local_plugin_make') || v:version < 800
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
    autocmd CursorHold * silent call make#auto()
    autocmd BufEnter * let b:textchanged = b:changedtick
    autocmd BufLeave * unlet! b:textchanged
    autocmd VimEnter * sign define MakeprgError text=>> texthl=Normal
augroup END

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
