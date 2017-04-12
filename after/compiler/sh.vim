if executable("shellcheck")
    setlocal makeprg=shellcheck\ -f\ gcc\ %\ \\\|\ grep\ -F\ '\ error:\ '
endif
