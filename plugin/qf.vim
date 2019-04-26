" Plugin
if exists('g:loaded_local_plugin_qf')
    finish
endif
let g:loaded_local_plugin_qf = 1

" Mappings
nnoremap <silent> Q :<C-U>call qf#cclear()<CR>
nnoremap <silent> L :<C-U>call qf#lclear()<CR>

" Autocommands
augroup QF
    autocmd!
    autocmd VimEnter * botright cwindow
    autocmd QuickFixCmdPost [^l]* botright cwindow
    autocmd QuickFixCmdPost l* lwindow
augroup END
