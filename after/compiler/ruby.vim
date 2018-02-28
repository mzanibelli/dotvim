if executable("ruby")
    setlocal makeprg=ruby\ -c
else
    echoerr "No suitable compiler found"
endif
