if executable("python2")
    setlocal errorformat=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
    setlocal makeprg=python2\ -m\ py_compile\ %
endif
