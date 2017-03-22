" Init
if exists(":CompilerSet") != 2
    command -nargs=* CompilerSet setlocal <args>
endif

" Options
CompilerSet errorformat=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
CompilerSet makeprg=python2\ -m\ py_compile\ %
