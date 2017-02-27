command! -nargs=0 BufferKill call buffers#killall()

nnoremap <silent> <Leader>; :<C-U>checktime<CR>
nnoremap <silent> gb :bn<CR>
nnoremap <silent> gB :bp<CR>
nmap <Leader>l :<C-U>ls<CR>

if bufname("%") == ""
    set bufhidden=wipe
endif

augroup BUFFERS
    autocmd!
    autocmd StdinReadPost * setlocal buftype=nofile
    autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * silent! checktime
augroup END
