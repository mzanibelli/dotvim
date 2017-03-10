function! make#auto(async)
    if exists("b:autocompile") && b:autocompile == 1
        if a:async
            call async#start(make#command(), 'make#qf')
        else
            call make#make()
        endif
    endif
endfunction

function! make#make()
    call qf#lload("lmake")
    silent! ll1
endfunction

function! make#command()
    return substitute(&makeprg, "%", make#copy(), "")." 2>&1"
endfunction

function! make#qf(channel)
    let l:i = 0
    let l:content = []
    let l:buffer = bufnr("%")
    execute "sign unplace * buffer=".l:buffer
    execute "lgetfile ".g:bgoutput
    for err in getloclist(winnr())
        if err.valid
            let l:num = err.lnum > line("$") ? line(".") : err.lnum
            let err.bufnr = bufnr("%")
            let err.lnum = l:num
            execute "sign place ".(l:i + 1)." line=".l:num." name=MakeprgError buffer=".l:buffer
            call add(l:content, err)
            let l:i += 1
        endif
    endfor
    call make#setloclist(l:content)
    call delete(b:makecopy)
    call async#end()
endfunction

function make#setloclist(content)
    if len(a:content) == 0
        silent call qf#lclear()
    else
        call setloclist(winnr(), a:content)
    endif
endfunction

function! make#copy()
    let b:makecopy = tempname()
    execute "noautocmd write ".b:makecopy
    return b:makecopy
endfunction
