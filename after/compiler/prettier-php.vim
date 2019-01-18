if executable("prettier")
    setlocal errorformat=%E,%C[error]\ %f:\ %m\ on\ line\ %l%.%#,%-G%.%#
    setlocal makeprg=prettier\ --no-color\ --loglevel\ error\ --write\ --parser\ php
else
    echoerr "No suitable compiler found"
endif
