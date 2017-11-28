" Plugin
if exists('g:loaded_local_plugin_buffers')
    finish
endif
let g:loaded_local_plugin_buffers = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Mappings
nnoremap <silent> gb :<C-U>bn<CR>
nnoremap <silent> gB :<C-U>bp<CR>
nnoremap <silent> go :<C-U>%bd \| setlocal bufhidden=wipe<CR><C-^>
nnoremap gh :<C-U>e <C-R>=expand("%:h")<CR>/
nmap <Leader>l :<C-U>ls<CR>

" Autocommands
augroup BUFFERS
    autocmd!
    autocmd StdinReadPre * let g:reading_stdin = 1
    autocmd StdinReadPost * setlocal buftype=nofile
    autocmd BufEnter * silent! checktime
    autocmd VimEnter * if bufname("%") == "" && !exists("g:reading_stdin") | call mru#files() | endif
augroup END

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
