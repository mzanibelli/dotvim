if executable("pdflatex")
    setlocal makeprg=pdflatex\ \-file\-line\-error\ \-interaction=nonstopmode
    setlocal errorformat=%f:%l:\ %m,%-G%.%#
else
    echoerr "No suitable compiler found"
endif
