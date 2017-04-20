let s:vars = {
            \ "fname": "expand('%')",
            \ "fnamet": "fnamemodify(expand('%'), ':t')",
            \ "fnametr": "fnamemodify(expand('%'), ':t:r')",
        \}

function! template#make(input)
    let l:code = template#content(a:input)
    if !empty(l:code)
        let @" = join(l:code, "\n")
        echom "Template loaded"
        return
    endif
    echom "Template not found"
endfunction

function! template#complete(a, l, p)
    let l:matches = []
    for file in split(glob(template#dir()."/*"), "\n")
        let l:tail = fnamemodify(file, ':t')
        if l:tail =~# '^'.a:a
            let l:matches = add(l:matches, l:tail)
        endif
    endfor
    return l:matches
endfunction

function! template#content(input)
    let l:path = template#path(a:input)
    if file_readable(l:path)
        return template#map(readfile(l:path))
    endif
    return []
endfunction

function! template#dir()
    return printf("%s/template/%s", default#extra(), &ft)
endfunction

function! template#path(input)
    return template#dir()."/".a:input
endfunction

function! template#map(content)
    let l:content = []
    for line in a:content
        let l:content = add(l:content, template#replacevars(line))
    endfor
    return l:content
endfunction

function! template#replacevars(line)
    let l:line = a:line
    for [var, expr] in items(s:vars)
        let l:line = template#substitute(l:line, var, expr)
    endfor
    return l:line
endfunction

function! template#substitute(line, var, expr)
    return substitute(a:line, template#match(a:var), template#replace(a:expr), "")
endfunction

function! template#match(var)
    return printf("{%s}", a:var)
endfunction

function! template#replace(expr)
    return eval(a:expr)
endfunction
