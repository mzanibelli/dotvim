if executable("acorn")
    setlocal errorformat=%m\ (%l:%c)
    setlocal makeprg=acorn\ --silent\ %
endif
