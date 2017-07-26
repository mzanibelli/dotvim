if executable("eslint_d")
    setlocal errorformat=%f:\ line\ %l\\,\ col\ %c\\,\ %m
    setlocal makeprg=eslint_d\ --no-color\ -f\ compact\ --quiet\ --fix\ %
elseif executable("eslint")
    setlocal errorformat=%f:\ line\ %l\\,\ col\ %c\\,\ %m
    setlocal makeprg=eslint\ --no-color\ -f\ compact\ --quiet\ --fix\ %
elseif executable("acorn")
    setlocal errorformat=%m\ (%l:%c)
    setlocal makeprg=acorn\ --silent\ %
endif
