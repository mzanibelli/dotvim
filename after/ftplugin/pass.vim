" Ftplugin
if exists('b:loaded_local_ftplugin_pass')
    finish
endif
let b:loaded_local_ftplugin_pass = 1

" Options
setlocal noendofline
setlocal nofixendofline
setlocal noswapfile
