" Init
if exists(":CompilerSet") != 2
    command -nargs=* CompilerSet setlocal <args>
endif

" Options
CompilerSet errorformat=%f:\ line\ %l\\,\ col\ %c\\,\ %m,%-G%.%#
CompilerSet makeprg=jshint\ --verbose\ %\ \\\|\ grep\ -E\ 'E[0-9]+.$'
