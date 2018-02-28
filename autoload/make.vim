function! make#auto(file)
    if exists("g:nocompile") && g:nocompile == 1
        return
    endif
    if exists("b:autocompile") && b:autocompile == 1
        call async#start(make#command(a:file), 'make#qf')
    endif
endfunction

function! make#command(file)
    return join([&makeprg, shellescape(fnamemodify(a:file, ":p")), "2>&1"])
endfunction

function! make#qf(channel)
    silent! checktime
    execute "lgetfile" g:bgoutput
    call async#end(a:channel)
endfunction

function! make#toggle()
    if !exists("g:nocompile")
        let g:nocompile = 1
    else
        let g:nocompile = 1 - g:nocompile
    endif
endfunction
