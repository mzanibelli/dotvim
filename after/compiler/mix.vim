if executable("mix")
    setlocal makeprg=mix\ format
    setlocal errorformat=%-Gmix\ format\ failed%.%#,**\ (%.%#)\ %f:%l:\ %m,%-G%.%#
else
    echoerr "No suitable compiler found"
endif
