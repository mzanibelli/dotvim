function! make#auto()
    if exists("b:autocompile") && b:autocompile == 1
        if &modifiable && exists("b:textchanged") && b:textchanged < b:changedtick
            call async#start(make#command(), 'make#qf')
        endif
    endif
endfunction

function! make#make()
    call make#unplace()
    call qf#lload("lmake")
    silent! ll1
endfunction

function! make#command()
    let l:output = make#copy()
    execute printf("autocmd User AsyncPost call delete('%s')", l:output)
    return substitute(&makeprg, "%", l:output, "")." 2>&1"
endfunction

function! make#unplace()
    execute "sign unplace * buffer=".bufnr("%")
endfunction

function! make#place(err, i)
    let l:err = a:err
    let l:err.lnum = a:err.lnum > line("$") ? line(".") : a:err.lnum
    let l:err.bufnr = bufnr("%")
    execute "sign place ".a:i." line=".l:err.lnum." name=MakeprgError buffer=".l:err.bufnr
    return l:err
endfunction

function! make#qf(channel)
    let l:content = []
    call make#unplace()
    execute "lgetfile ".g:bgoutput
    for err in getloclist(winnr())
        if err.valid
            call add(l:content, make#place(err, len(l:content) + 1))
        endif
    endfor
    call make#setloclist(l:content)
    call async#end(a:channel)
endfunction

function! make#setloclist(content)
    if len(a:content) == 0
        silent call qf#lclear()
    else
        call setloclist(winnr(), a:content)
    endif
endfunction

function! make#copy()
    let l:file = default#tempname()
    call writefile(getline(1, "$"), l:file)
    return l:file
endfunction
