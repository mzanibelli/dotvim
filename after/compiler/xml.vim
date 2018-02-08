if executable("xmllint")
    setlocal makeprg=xmllint\ --valid\ --noout\ %
    setlocal errorformat=%f:%l:\ %m,%-G%.%#
endif
