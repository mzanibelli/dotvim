" Plugin
if exists('g:loaded_local_plugin_diff')
    finish
endif
let g:loaded_local_plugin_diff = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Commands
command! -nargs=0 NextConflict normal! /\v^[<>=]{4,7}<CR>
command! -nargs=0 PrevConflict normal! ?\v^[<>=]{4,7}<CR>
command! -nargs=0 Diff call diff#toggle()

" Autocommands
augroup DIFF
    autocmd!
    autocmd BufWritePost * if &diff | diffupdate | endif
    autocmd BufHidden,BufWipeout * if &diff && len(getwininfo()) == 2 | diffoff! | endif
augroup END

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
