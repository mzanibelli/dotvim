function! qf#cclear()
    cexpr []
    cclose
endfunction

function! qf#cfirst()
    if len(getqflist()) == 1
        cc! 1
        call qf#cclear()
    endif
endfunction

function! qf#cpost()
    call setqflist(filter(copy(getqflist()), "v:val.valid == 1"))
    botright cwindow
    redraw!
endfunction

function! qf#cload(command)
    silent execute a:command
endfunction

function! qf#lclear()
    lexpr []
    lclose
endfunction

function! qf#lfirst()
    if len(getloclist(winnr())) == 1
        ll! 1
        call qf#lclear()
    endif
endfunction

function! qf#lpost()
    call qf#lfilter()
    lwindow
    redraw!
endfunction

function! qf#lload(command)
    silent execute a:command
endfunction

function! qf#lfilter()
    let l:content = []
    for err in getloclist(winnr())
        if err.valid
            let err.bufnr = empty(err.bufnr) ? bufnr("%") : err.bufnr
            call add(l:content, err)
        endif
    endfor
    call setloclist(winnr(), l:content)
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
