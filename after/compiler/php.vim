if executable("php")
    setlocal makeprg=php\ -lq
    setlocal errorformat=%m\ in\ %f\ on\ line\ %l,%-G%.%#
else
    echoerr "No suitable compiler found"
endif
