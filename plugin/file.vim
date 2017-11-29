" Plugin
if exists('g:loaded_local_plugin_file')
    finish
endif
let g:loaded_local_plugin_file = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Mappings
nnoremap <silent> <Leader>f :<C-U>call file#path()<CR>

" Commands
command! -nargs=1 -complete=file Rename call file#rename(<q-args>)
command! -nargs=0 Delete call file#delete()

" Autocommands
augroup FILE
    autocmd!
    autocmd BufFilePost * filetype detect
    autocmd BufWritePre * call file#mkdir(expand("<afile>"), +expand("<abuf>"))
    autocmd BufWritePre * call file#backupext()
    autocmd User DeferPost silent! call mkdir(&undodir, "p")
    autocmd User DeferPost silent! call mkdir(&backupdir, "p")
    autocmd User DeferPost silent! call mkdir(&directory, "p")
    autocmd FileChangedRO * setlocal noreadonly
    autocmd FileChangedShell * let v:fcs_choice = "reload"
augroup END

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
