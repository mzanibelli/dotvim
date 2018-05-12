" Plugin
if exists('g:loaded_local_plugin_file')
    finish
endif
let g:loaded_local_plugin_file = 1

" Commands
command! -nargs=1 -complete=file Move call file#move(<q-args>)
command! -nargs=0 Delete call file#delete()
command! -nargs=0 Path call file#path()
command! -nargs=1 -complete=filetype Filetype setlocal filetype=<args>

" Mappings
inoremap <C-X><C-T> <C-R>=expand("%:t:r")<CR>
inoremap <C-X><C-H> <C-R>=expand("%:p:h")<CR>

" Autocommands
augroup FILE
    autocmd!
    autocmd BufWritePre * call file#mkdir(expand("<afile>"), +expand("<abuf>"))
    autocmd BufWritePre * call file#backupext()
    autocmd User DeferPost silent! call mkdir(&undodir, "p")
    autocmd User DeferPost silent! call mkdir(&backupdir, "p")
    autocmd User DeferPost silent! call mkdir(&directory, "p")
    autocmd FileChangedRO * setlocal noreadonly
    autocmd FileChangedShell * let v:fcs_choice = "reload"
augroup END
