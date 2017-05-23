function! make#auto()
    if exists("b:autocompile") && b:autocompile == 1
        call async#start(make#command(), 'make#qf')
    endif
endfunction

function! make#make()
    update
    silent execute lmake
    silent! ll1
endfunction

function! make#command()
    return substitute(&makeprg, "%", expand("%"), "")." 2>&1"
endfunction

function! make#qf(channel)
    silent execute "lgetfile ".g:bgoutput
    call async#end(a:channel)
endfunction
