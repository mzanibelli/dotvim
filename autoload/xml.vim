function! xml#close()
    let l:line = getline(".")
    let l:tag = '<\(\h\w*\)\(''[^'']*''\|"[^"]*"\|[^>''"]\)*\/\@<!>\%'.col('.').'c'
    let l:start = match(l:line, l:tag)
    if l:start >= 0
        let l:closetag = substitute(l:line, '.*'.l:tag.'.*', '</\1>', "")
        let l:indent = printf('%'.l:start.'s', '')
        call append(".", l:indent.l:closetag)
        call append(".", l:indent)
        return "\<DOWN>\<TAB>"
    endif
    return ""
endfunction
