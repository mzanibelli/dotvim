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

function! qf#system(cmd, efm)
    let l:options = {}
    let l:options['efm'] = a:efm
    let l:options['lines'] = systemlist(a:cmd)
    call setqflist([], 'r', l:options)
    doautocmd QuickFixCmdPost system
endfunction
