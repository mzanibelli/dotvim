" Plugin
if exists('g:loaded_local_plugin_terminal')
    finish
endif
let g:loaded_local_plugin_terminal = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Mappings
tnoremap <silent> <C-^> <C-W>:<C-U>buffer #<CR>
tnoremap <C-H> <C-W>h
tnoremap <C-J> <C-W>j
tnoremap <C-K> <C-W>k
tnoremap <C-L> <C-W>l

" Autocommands
augroup TERMINAL
    autocmd!
    autocmd BufEnter * filetype detect
augroup END

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
