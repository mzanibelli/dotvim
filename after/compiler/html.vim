if executable("xmllint")
    setlocal makeprg=xmllint\ --html\ --valid\ --noout\ %
    setlocal errorformat=%f:%l:\ %m,%-G%.%#
endif
