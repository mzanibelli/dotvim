" Init
if exists(":CompilerSet") != 2
    command -nargs=* CompilerSet setlocal <args>
endif

" Options
CompilerSet errorformat&
CompilerSet makeprg=php\ -l\ %
