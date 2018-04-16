if executable("prettier")
    setlocal errorformat=%E,%C[error]\ %f:\ %m\ (%l:%c)%.%#,%-G%.%#
    setlocal makeprg=prettier\ --no-color\ --loglevel\ error\ --write\ --parser\ markdown
else
    echoerr "No suitable compiler found"
endif
