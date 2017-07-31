function! make#auto()
    if exists("b:autocompile") && b:autocompile == 1
        call async#start(make#command(), 'make#qf')
    endif
endfunction

function! make#command()
    return substitute(&makeprg, "%", expand("%"), "")." 2>&1"
endfunction

function! make#qf(channel)
    execute "lgetfile ".g:bgoutput
    if exists("b:makefilter")
        call setloclist(winnr(), filter(getloclist(winnr()), b:makefilter))
    endif
    call async#end(a:channel)
endfunction
