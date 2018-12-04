if executable("zsh")
    setlocal makeprg=zsh\ -n\ --
    setlocal errorformat=%f:%l:\ %m
else
    echoerr "No suitable compiler found"
endif
