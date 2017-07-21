if executable("php")
    setlocal makeprg=php\ -lq\ %
    setlocal errorformat=%m\ in\ %f\ on\ line\ %l,%-GErrors\ parsing\ %f,%-G
endif
