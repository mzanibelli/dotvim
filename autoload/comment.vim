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
    let l:oldpaste = &paste
    set paste
    if comment#commented(a:firstline, a:lastline) == 1
        call windows#preserve(a:firstline.",".a:lastline."s/\\v^\\s*\\zs(".escape(comment#prefix(), '/')." ){1}\\ze//g")
    else
        call windows#preserve(a:firstline.",".a:lastline."v/\\v^(\\s)*$/normal! 0i".comment#prefix()." ")
    endif
    let &paste = l:oldpaste
endfunction

function! comment#commented(first, last)
    for line in getline(a:first, a:last)
        if line =~# "\\v^(\\s)*$"
            continue
        elseif line !~# "\\v^\\s*(".escape(comment#prefix(), '/')." ){1}"
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
