if executable("shellcheck")
    setlocal makeprg=shellcheck\ -f\ gcc
endif
