if executable("gofmt")
    setlocal makeprg=gofmt\ -e\ %
endif
