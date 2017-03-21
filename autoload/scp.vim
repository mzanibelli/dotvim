function! scp#getrelativepath()
    if scp#isremote()
        return substitute(expand("%"), printf('^%s/', g:mirror), '', '')
    else
        return fnamemodify(expand("%"), ":.")
    endif
endfunction

function! scp#getlocalfile()
    return printf("%s/%s", getcwd(), scp#getrelativepath())
endfunction

function! scp#getmirrorfile()
    return printf("%s/%s", g:mirror, scp#getrelativepath())
endfunction

function! scp#getprotocol()
    return matchstr(g:mirror, '^\zs\w\{3,5}\ze://')
endfunction

function! scp#isremote()
    return expand("%") =~# printf('\v^%s://', scp#getprotocol())
endfunction

function! scp#editremote()
    if exists("g:mirror") && !scp#isremote()
        execute printf("edit %s", scp#getmirrorfile())
    endif
endfunction

function! scp#editlocal()
    if exists("g:mirror") && scp#isremote()
        execute printf("edit %s", scp#getlocalfile())
    endif
endfunction

function! scp#setremote(remote)
    let g:mirror = a:remote
endfunction

function! scp#statusline()
    if exists("g:mirror") && expand("%") !=# ""
        return scp#isremote() ? '[remote]' : '[local]'
    endif
    return ''
endfunction
