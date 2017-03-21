" Commands
command! -nargs=0 Mirror call scp#editmirror()
command! -nargs=0 Local call scp#editlocal()
command! -nargs=* SetRemote call scp#setremote(<q-args>)
