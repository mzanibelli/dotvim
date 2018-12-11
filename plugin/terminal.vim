" Plugin
if exists('g:loaded_local_plugin_terminal')
    finish
endif
let g:loaded_local_plugin_terminal = 1

" Autocommands
augroup TERMINAL
    autocmd!
    autocmd TerminalOpen * if &buftype ==# 'terminal' | setlocal statusline=[TERMINAL] | endif
augroup END
