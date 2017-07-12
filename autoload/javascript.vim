function! javascript#format()
    call async#start("/usr/bin/eslint --fix ".expand("%"), "javascript#reload")
endfunction

function! javascript#reload(channel)
    checktime
    call async#end(a:channel)
    call make#auto()
endfunction
