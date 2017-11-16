" Plugin
if exists('g:loaded_local_plugin_svn')
    finish
endif
let g:loaded_local_plugin_svn = 1

" Force incompatibility
let s:save_cpo = &cpo
set cpo&vim

" Autocommands
augroup SVN
    autocmd!
    autocmd BufRead *.svn-base if &diff && argc() == 2 | execute 'doautocmd filetypedetect BufRead '.argv(1) | endif
    autocmd BufNewFile *.svn-base if &diff && argc() == 2 | execute 'doautocmd filetypedetect BufNewFile '.argv(1) | endif
augroup END

" Restore compatibility
let &cpo = s:save_cpo
unlet s:save_cpo
