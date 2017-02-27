function! syntax#toggle()
    if !exists("g:syntax_on")
        syntax on
    else
        syntax off
    endif
endfunction

function! syntax#commentorstring()
    let l:group = synIDattr(synIDtrans(synID(line('.'), col('.') - 1, 1)), 'name')
    if stridx(l:group, 'Comment') > -1
        return 1
    endif
    if stridx(l:group, 'String') > -1
        return 2
    endif
    return 0
endfunction
