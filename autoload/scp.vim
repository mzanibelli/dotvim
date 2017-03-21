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

function! scp#getremotefile()
    return printf("%s/%s", g:mirror, scp#getrelativepath())
endfunction

function! scp#getprotocol()
    return matchstr(g:mirror, '^\zs\w\{3,5}\ze://')
endfunction

function! scp#isremote()
    return expand("%") =~# printf('\v^%s://', scp#getprotocol())
endfunction

function! scp#do(command, remote)
    if !empty(expand("%")) && exists("g:mirror")
        if eval(printf("%sscp#isremote()", a:remote ? '' : '!'))
            execute a:command
        endif
    endif
endfunction

function! scp#local(command)
    call scp#do(a:command, 0)
endfunction

function! scp#remote(command)
    call scp#do(a:command, 1)
endfunction

function! scp#setremote(remote)
    let g:mirror = a:remote
endfunction

function! scp#statusline()
    if exists("g:mirror") && !empty(expand("%"))
        return scp#isremote() ? '[remote]' : '[local]'
    endif
    return ''
endfunction

function! scp#editremote()
    call scp#local(printf("edit %s", scp#getremotefile()))
endfunction

function! scp#editlocal()
    call scp#remote(printf("edit %s", scp#getlocalfile()))
endfunction

function! scp#sync()
    if !empty(expand("%")) && exists("g:mirror")
        let l:file = scp#isremote() ? 'local' : 'remote'
        echom printf("You are about to override the %s file", l:file)
        if confirm("Continue ?", "&Yes\n&No") == 1
            let l:filename = eval(printf("scp#get%sfile()", l:file))
            silent! execute printf("bwipeout! %s", l:filename)
            silent! execute printf("write! %s", l:filename)
        endif
    endif
endfunction
