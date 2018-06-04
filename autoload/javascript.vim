function! javascript#includeexpr(target, current) abort
    let l:target = a:target
    if l:target =~# '^\.\.\=/'
        let l:target = simplify(fnamemodify(resolve(a:current), ':p:h') . '/' . l:target)
    endif
    let l:found = findfile(l:target)
    if l:found =~# '[\/]package\.json$' && l:target !~# '[\/]package\.json$'
        try
            let l:package = json_decode(join(readfile(l:found)))
            let l:target .= '/' . substitute(get(l:package, 'main', 'index'), '\.js$', '', '')
        catch
        endtry
    endif
    return l:target
endfunction
