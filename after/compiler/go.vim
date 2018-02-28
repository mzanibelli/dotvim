if executable("goimports")
    setlocal makeprg=goimports\ -e\ -w
elseif executable("gofmt")
    setlocal makeprg=gofmt\ -e\ -s\ -w
else
    echoerr "No suitable compiler found"
endif
