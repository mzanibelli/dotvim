if executable("xmllint")
    setlocal errorformat=%E,%C[error]\ %f:\ %m\ (%l:%c)%.%#,%-G%.%#
    setlocal makeprg=prettier\ --no-color\ --loglevel\ error\ --write\ --parser\ html
else
    echoerr "No suitable compiler found"
endif
