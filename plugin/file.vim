" Plugin
if exists('g:loaded_local_plugin_file')
  finish
endif
let g:loaded_local_plugin_file = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Mappings
nnoremap <silent> <Leader>f :<C-U>echo expand('%:p')<CR>

" Init
silent! call mkdir(&undodir, "p")
silent! call mkdir(&backupdir, "p")
silent! call mkdir(&directory, "p")

" Autocommands
augroup FILE
    autocmd!
    autocmd BufFilePost * filetype detect
    autocmd BufWritePre * call file#mkdir(expand("<afile>"), +expand("<abuf>"))
    autocmd BufWritePre * call file#backupext()
    autocmd CursorHold,BufWritePost * unlet! b:wrongformat
augroup END

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
