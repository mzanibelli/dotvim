" Mappings
command! -nargs=* SVNDiff call svn#diff(<q-args>)
command! -nargs=* SVNLog call svn#log(<q-args>)
command! -nargs=0 SVNBlame call svn#blame()
command! -nargs=0 SVNRevert call svn#revert()
command! -nargs=0 SVNRoot call source#root("svn")

" Autocommands
augroup SVN
    autocmd!
    autocmd BufRead *.svn-base if &diff && argc() == 2 | execute 'doautocmd filetypedetect BufRead '.argv(1) | endif
    autocmd BufNewFile *.svn-base if &diff && argc() == 2 | execute 'doautocmd filetypedetect BufNewFile '.argv(1) | endif
augroup END
