" Plugin
if exists('g:loaded_local_plugin_qf')
    finish
endif
let g:loaded_local_plugin_qf = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Mappings
nnoremap <silent> Q :<C-U>call qf#ctoggle()<CR>
nnoremap <silent> L :<C-U>call qf#lclear()<CR>

" Autocommands
augroup QF
    autocmd!
    autocmd QuitPre * if &ft != 'qf' | call qf#lclear() | endif
    autocmd QuickFixCmdPre [^l]* call qf#cclear()
    autocmd QuickFixCmdPre l* call qf#lclear()
    autocmd QuickFixCmdPost [^l]* call qf#cpost()
    autocmd QuickFixCmdPost l* call qf#lpost()
    autocmd FileType qf call matchadd('Conceal', '|| $')
augroup END

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
