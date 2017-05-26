" Plugin
if exists('g:loaded_local_plugin_file')
    finish
endif
let g:loaded_local_plugin_file = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Mappings
command! -nargs=0 Path echo expand('%:p')

" Autocommands
augroup FILE
    autocmd!
    autocmd BufFilePost * filetype detect
    autocmd BufWritePre * call file#mkdir(expand("<afile>"), +expand("<abuf>"))
    autocmd BufWritePre * call file#backupext()
    autocmd User DeferPost silent! call mkdir(&undodir, "p")
    autocmd User DeferPost silent! call mkdir(&backupdir, "p")
    autocmd User DeferPost silent! call mkdir(&directory, "p")
    autocmd User DeferPost silent! call mkdir($TMPDIR, "p")
augroup END

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
