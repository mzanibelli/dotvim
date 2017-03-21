" Commands
command! -nargs=0 Remote call scp#editremote()
command! -nargs=0 Local call scp#editlocal()
command! -nargs=0 Sync call scp#sync()
command! -nargs=* Mirror call scp#setremote(<q-args>)
