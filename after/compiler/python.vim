if executable("python2")
    setlocal errorformat=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m,%-G%.%#
    setlocal makeprg=python2\ -m\ py_compile
else
    echoerr "No suitable compiler found"
endif
