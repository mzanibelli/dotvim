setlocal errorformat=%f:\ line\ %l\\,\ col\ %c\\,\ %m,%-G%.%#
setlocal makeprg=jshint\ --verbose\ %\ \\\|\ grep\ -E\ 'E[0-9]+.$'
