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
    call qf#lload("lgetfile ".g:bgoutput)
    call async#end()
    silent! ll1
endfunction

function! make#getfile()
    let l:file = tempname()
    execute "noautocmd saveas ".l:file
    return l:file
endfunction
