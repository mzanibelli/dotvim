function! comment#opfunc(type)
    if a:type ==# "line"
        call windows#preserve("'[,']call comment#comment()")
    elseif a:type ==# "V"
        call windows#preserve("'<,'>call comment#comment()")
    elseif a:type == 1
        call windows#preserve(".,.call comment#comment()")
    endif
endfunction

function! comment#comment() range
    let l:i = a:firstline
    let l:comment = comment#commented(a:firstline, a:lastline)
    while l:i <= a:lastline
        let l:line = getline(l:i)
        if l:line !~# '\v^\s*$'
            call setline(l:i, comment#line(l:line, l:comment))
        endif
        let l:i += 1
    endwhile
endfunction

function! comment#line(line, comment)
    let l:string = printf('%s ', comment#prefix())
    if a:comment
        let l:match = printf('^\s*\zs%s\ze', l:string)
        let l:replace = ''
    else
        let l:match = '^'
        let l:replace = l:string
    endif
    return substitute(a:line, l:match, l:replace, '')
endfunction

function! comment#commented(first, last)
    for line in getline(a:first, a:last)
        if line =~# '\v^\s*$'
            continue
        elseif line !~# printf('\v^\s*%s ', comment#prefix())
            return 0
        endif
    endfor
    return 1
endfunction

function! comment#prefix()
    if exists("b:commentprefix")
        return b:commentprefix
    endif
    return '#'
endfunction
