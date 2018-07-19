let s:vars = {
    \ "fname": "fnamemodify(expand('%'), ':p')",
    \ "fname-t": "fnamemodify(expand('%'), ':p:t')",
    \ "fname-tr": "fnamemodify(expand('%'), ':p:t:r')",
    \ "fname-ht": "fnamemodify(expand('%'), ':p:h:t')",
    \ "datetime": "strftime('%Y-%m-%d %H:%M:%S')",
    \ "date": "strftime('%Y-%m-%d')",
    \ "date-en": "strftime('%m/%d/%Y')",
    \ "date-fr": "strftime('%d/%m/%Y')",
    \ "time": "strftime('%H:%M:%S')",
    \ "year": "strftime('%Y')",
    \}

function! template#make(input)
    let l:code = template#content(a:input)
    let @" = join(l:code, "\n")
endfunction

function! template#complete(a, l, p)
    return default#dirmatches(template#dir(), a:a)
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
    return substitute(a:line, template#match(a:var), template#replace(a:expr), "g")
endfunction

function! template#match(var)
    return printf("{%s}", a:var)
endfunction

function! template#replace(expr)
    return eval(a:expr)
endfunction
