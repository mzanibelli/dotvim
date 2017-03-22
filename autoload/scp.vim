function! scp#on()
    return exists("g:mirror") && !empty(expand("%")) && &modifiable
endfunction

function! scp#getprotocol()
    return matchstr(g:mirror, '^\zs\w\{3,5}\ze://')
endfunction

function! scp#context(file)
    return scp#on() && !scp#is{a:file}()
endfunction

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

function! scp#isremote()
    return scp#on() && expand("%") =~# printf('\v^%s://', scp#getprotocol())
endfunction

function! scp#islocal()
    return !scp#isremote()
endfunction

function! scp#reset(remote)
    if empty(a:remote)
        unlet! g:mirror
    else
        let g:mirror = a:remote
    endif
endfunction

function! scp#statusline()
    if scp#on()
        return scp#isremote() ? '[remote]' : '[local]'
    endif
    return ''
endfunction

function! scp#edit(file)
    if scp#context(a:file)
        execute printf("edit %s", scp#get{a:file}file())
    endif
endfunction

function! scp#sync(file)
    if scp#context(a:file)
        echom printf("You are about to override %s", expand("%"))
        if confirm("Continue ?", "&Yes\n&No") == 1
            let l:filename = scp#get{a:file}file()
            silent! execute printf("bwipeout! %s", l:filename)
            silent! execute printf("write! %s", l:filename)
        endif
    endif
endfunction
