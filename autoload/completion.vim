function! completion#complete(reverse)
    if col('.') == 1
        return "\<Tab>"
    elseif pumvisible()
        return a:reverse ? "\<C-P>" : "\<C-N>"
    elseif default#getchar(1) =~# '\k' || completion#method()
        if a:reverse && completion#hasdynamic()
            return completion#dynamic(0)
        endif
        return "\<C-P>"
    endif
    return "\<Tab>"
endfunction

function! completion#type()
    return exists("b:completiontype") ? b:completiontype : "\<C-X>\<C-O>"
endfunction

function! completion#dynamic(attempt)
    if !a:attempt
        return completion#type()."\<C-R>=completion#dynamic(1)\<CR>"
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

function! completion#hasdynamic()
    if completion#type() ==# "\<C-X>\<C-O>"
        return strlen(&omnifunc) > 0
    elseif completion#type() ==# "\<C-X>\<C-K>"
        return &spell
    endif
    return 1
endfunction
