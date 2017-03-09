function! make#auto()
    if exists("b:autocompile") && b:autocompile == 1
        call make#make()
    endif
endfunction

function! make#make()
    call async#start(make#command(), 'make#qf')
endfunction

function! make#command()
    return substitute(&makeprg, "%", make#getfile(), "")." 2>&1"
endfunction

function! make#qf(channel)
    let l:i = 1
    let l:content = []
    let l:buffer = bufnr("%")
    silent call qf#lclear()
    execute "sign unplace * buffer=".l:buffer
    execute "lgetfile ".g:bgoutput
    for err in getloclist(winnr())
        if err.valid
            let l:num = err.lnum > line("$") ? line(".") : err.lnum
            let err.bufnr = bufnr("%")
            let err.lnum = l:num
            execute "sign place ".l:i." line=".l:num." name=MakeprgError buffer=".l:buffer
            call add(l:content, err)
            let l:i += 1
        endif
    endfor
    call setloclist(winnr(), l:content)
    call async#end()
endfunction

function! make#getfile()
    let l:file = tempname()
    execute "noautocmd write ".l:file
    return l:file
endfunction
