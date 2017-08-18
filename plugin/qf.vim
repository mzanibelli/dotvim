" Plugin
if exists('g:loaded_local_plugin_qf')
    finish
endif
let g:loaded_local_plugin_qf = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Mappings
nnoremap <silent> Q :<C-U>call qf#cclear()<CR>
nnoremap <silent> L :<C-U>call qf#lclear()<CR>

" Autocommands
augroup QF
    autocmd!
    autocmd QuitPre * if &ft != 'qf' | call qf#lclear() | endif
    autocmd VimEnter * botright cwindow
    autocmd QuickFixCmdPost [^l]* botright cwindow
    autocmd QuickFixCmdPost l* lwindow
    autocmd FileType qf call matchadd('Conceal', '|| $', 0)
augroup END

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
