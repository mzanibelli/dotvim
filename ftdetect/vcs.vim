augroup VCS
    autocmd!
    autocmd BufReadPost *.svn-base,/tmp/svn-*,git-changelist.tmp setlocal filetype=vcs
augroup END
