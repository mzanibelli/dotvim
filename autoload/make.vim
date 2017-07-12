function! make#auto()
    if exists("b:autocompile") && b:autocompile == 1
        call async#start(make#command(), 'make#qf')
    endif
endfunction

function! make#command()
    return make#fixpipe(substitute(&makeprg, "%", expand("%"), "")." 2>&1")
endfunction

function! make#fixpipe(str)
    return substitute(a:str, '\\|', '\|', '')
endfunction

function! make#qf(channel)
    execute "lgetfile ".g:bgoutput
    call async#end(a:channel)
endfunction
