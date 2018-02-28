if executable("shellcheck")
    setlocal makeprg=shellcheck\ -f\ gcc
else
    echoerr "No suitable compiler found"
endif
