function! qf#cclear()
    call setqflist([], 'r')
    cclose
endfunction

function! qf#lclear()
    call setloclist(winnr(), [], 'r')
    lclose
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

function! qf#append(value, efm)
    let l:options = {}
    let l:options['efm'] = a:efm
    let l:options['lines'] = [a:value]
    call setqflist([], 'a', l:options)
    doautocmd QuickFixCmdPost append
endfunction
