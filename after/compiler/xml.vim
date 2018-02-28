if executable("xmllint")
    setlocal makeprg=xmllint\ --valid\ --noout\ --nodtd
    setlocal errorformat=%f:%l:\ %m,%-G%.%#
else
    echoerr "No suitable compiler found"
endif
