" Plugin
if exists('g:loaded_local_plugin_svn')
    finish
endif
let g:loaded_local_plugin_svn = 1

" Autocommands
augroup SVN
    autocmd!
    autocmd BufRead *.svn-base if &diff && argc() == 2 | execute 'doautocmd filetypedetect BufRead '.argv(1) | endif
    autocmd BufNewFile *.svn-base if &diff && argc() == 2 | execute 'doautocmd filetypedetect BufNewFile '.argv(1) | endif
augroup END
