function! scp#getserver()
    return printf("scp://%s/", g:mirror)
endfunction

function! scp#getrelativepath()
    if scp#isremote()
        return substitute(expand("%"), '^'.scp#getserver(), '', '')
    else
        return fnamemodify(expand("%"), ":.")
    endif
endfunction

function! scp#getlocalfile()
    return printf("%s/%s", getcwd(), scp#getrelativepath())
endfunction

function scp#getmirrorfile()
    return printf("%s%s", scp#getserver(), scp#getrelativepath())
endfunction

function scp#isremote()
    return expand("%") =~# '\v^scp://'
endfunction

function! scp#editmirror()
    if exists("g:mirror") && !scp#isremote()
        execute printf("edit %s", scp#getmirrorfile())
    endif
endfunction

function! scp#editlocal()
    if exists("g:mirror") && scp#isremote()
        execute printf("edit %s", scp#getlocalfile())
    endif
endfunction

function scp#setremote(remote)
    let g:mirror = a:remote
endfunction
