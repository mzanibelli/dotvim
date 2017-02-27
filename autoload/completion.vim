function! completion#complete(reverse)
    if pumvisible()
        return a:reverse ? "\<C-P>" : "\<C-N>"
    elseif default#getchar(1) =~# '\K' || completion#method()
        if a:reverse && completion#hasomni()
            return completion#dynamic(0)
        endif
        return "\<C-P>"
    endif
    return "\<Tab>"
endfunction

function! completion#dynamic(attempt)
    if !a:attempt
        return "\<C-X>\<C-O>\<C-R>=completion#dynamic(1)\<CR>"
    elseif !pumvisible()
        call feedkeys("\<C-E>\<C-P>", "n")
    endif
    return ""
endfunction

function! completion#undouble()
    let l:col = getpos('.')[2]
    let l:line = getline('.')
    call setline('.', substitute(l:line, '\(\k\+\)\%'.l:col.'c\zs\1', '', ''))
endfunction

function! completion#method()
    return default#getchar(2).default#getchar(1) =~# '\(->\|::\)' || default#getchar(1) ==# '.'
endfunction

function! completion#hasomni()
    return strlen(&omnifunc) > 0 && !syntax#commentorstring()
endfunction
