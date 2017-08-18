function! qf#cclear()
    call setqflist([])
    cclose
endfunction

function! qf#cfirst()
    if len(getqflist()) == 1
        cc! 1
        call qf#cclear()
    endif
endfunction

function! qf#lclear()
    call setloclist(winnr(), [])
    lclose
endfunction

function! qf#quick()
    let l:prefix = qf#type() == 2 ? "l" : "c"
    execute "normal! \<CR>"
    execute "call qf#".l:prefix."clear()"
endfunction

function! qf#type()
    redir => l:output | silent ls | redir END
    if match(l:output, '%a-  "\[Location List\]"') >= 0
        return 2
    elseif match(l:output, '%a-  "\[Quickfix List\]"') >= 0
        return 1
    endif
    return 0
endfunction

function! qf#filter(pat, bang)
    let l:op = a:bang == 0 ? "=~" : "!~"
    let l:cond = a:bang == 0 ? "||" : "&&"
    let l:callback = "bufname(v:val['bufnr']) ".l:op." a:pat ".l:cond." v:val['text'] ".l:op." a:pat"
    if qf#type() == 2
        call setloclist(winnr(), filter(getloclist(winnr()), l:callback), "r")
    elseif qf#type() == 1
        call setqflist(filter(getqflist(), l:callback), "r")
    endif
endfunction
