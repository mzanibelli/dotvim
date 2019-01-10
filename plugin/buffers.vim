" Plugin
if exists('g:loaded_local_plugin_buffers')
    finish
endif
let g:loaded_local_plugin_buffers = 1

" Mappings
nnoremap <silent> gb :<C-U>bn<CR>
nnoremap <silent> gB :<C-U>bp<CR>
nnoremap <silent> go :<C-U>%bd \| setlocal bufhidden=wipe<CR><C-^>
nnoremap <Leader>l :<C-U>ls<CR>:buffer<Space>

" Autocommands
augroup BUFFERS
    autocmd!
    autocmd StdinReadPost * setlocal buftype=nofile
    autocmd BufEnter * silent! checktime
    autocmd BufEnter * call mru#ls("%")
augroup END
