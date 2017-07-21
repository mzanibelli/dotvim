if executable("eslint")
    setlocal errorformat=%f:\ line\ %l\\,\ col\ %c\\,\ %m
    setlocal makeprg=eslint\ --no-color\ -f\ compact\ --quiet\ %
elseif executable("acorn")
    setlocal errorformat=%m\ (%l:%c)
    setlocal makeprg=acorn\ --silent\ %
endif
