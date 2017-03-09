function! make#make()
    update
    call async#start(make#command(), 'make#qf')
endfunction

function! make#command()
    return substitute(&makeprg, "%", expand("%"), "")." 2>&1"
endfunction

function! make#qf(channel)
    call qf#lload("lgetfile ".g:bgoutput)
    call async#end()
    silent! ll1
endfunction
