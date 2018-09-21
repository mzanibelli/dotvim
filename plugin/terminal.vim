" Plugin
if exists('g:loaded_local_plugin_terminal')
    finish
endif
let g:loaded_local_plugin_terminal = 1

" Mappings
tnoremap <C-H> <C-^>h
tnoremap <C-J> <C-^>j
tnoremap <C-K> <C-^>k
tnoremap <C-L> <C-^>l

" Autocommands
augroup TERMINAL
    autocmd!
    autocmd TerminalOpen * if &buftype ==# 'terminal' | setlocal statusline=[TERMINAL] | endif
augroup END
