function! fold#toggleall()
    if &foldenable
        normal! zi
    else
        normal! zX
    endif
endfunction

function! fold#toggle()
    if &foldenable
        if foldclosed('.') != -1
            normal! zA
        else
            silent! normal! zc
        endif
    else
        normal! zX
    endif
endfunction

function! fold#method(line)
    let l:level = &l:foldlevel + 1
    if getline(a:line) =~# '\v^\s*$'
        return -1
    endif
    let l:indent = indent(a:line) / &shiftwidth
    if l:indent < l:level
        return 0
    endif
    return l:level
endfunction
