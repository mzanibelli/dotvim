" Plugin
if exists('g:loaded_local_buffers')
  finish
endif
let g:loaded_local_buffers = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Commands
command! -nargs=0 BufferKill call buffers#killall()

" Mappings
nnoremap <silent> <Leader>; :<C-U>checktime<CR>
nnoremap <silent> gb :bn<CR>
nnoremap <silent> gB :bp<CR>
nmap <Leader>l :<C-U>ls<CR>

" Init
if bufname("%") == ""
    set bufhidden=wipe
endif

" Autocommands
augroup BUFFERS
    autocmd!
    autocmd StdinReadPost * setlocal buftype=nofile
    autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * silent! checktime
augroup END

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
