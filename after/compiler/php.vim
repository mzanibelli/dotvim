if executable("php")
    setlocal makeprg=php\ -l\ %
    setlocal errorformat=%m\ in\ %f\ on\ line\ %l,%-GErrors\ parsing\ %f,%-G
endif
