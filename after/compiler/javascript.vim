if executable("eslint_d")
    setlocal errorformat=%E%f:\ line\ %l\\,\ col\ %c\\,\ %m,%-G%.%#
    setlocal makeprg=eslint_d\ --no-color\ -f\ compact\ --quiet\ --fix
elseif executable("eslint")
    setlocal errorformat=%E%f:\ line\ %l\\,\ col\ %c\\,\ %m,%-G%.%#
    setlocal makeprg=eslint\ --no-color\ -f\ compact\ --quiet\ --fix
elseif executable("prettier")
    setlocal errorformat=%E,%C[error]\ %f:\ %m\ (%l:%c)%.%#,%-G%.%#
    setlocal makeprg=prettier\ --no-color\ --loglevel\ error\ --write
elseif executable("acorn")
    setlocal errorformat=%m\ (%l:%c)
    setlocal makeprg=acorn\ --silent
endif
