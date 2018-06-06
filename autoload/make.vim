function! make#auto(file)
    if exists("g:nocompile") && g:nocompile == 1
        return
    endif
    if exists("b:autocompile") && b:autocompile == 1
        call setloclist(winnr(), [], 'f')
        call async#start(make#command(a:file), 'make#qf')
    endif
endfunction

function! make#command(file)
    return join([&makeprg, shellescape(fnamemodify(a:file, ":p")), "2>&1"])
endfunction

function! make#qf(channel, message)
    execute printf('laddexpr "%s"', escape(a:message, '"'))
endfunction

function! make#toggle()
    if exists("g:nocompile")
        let g:nocompile = 1 - g:nocompile
    else
        let g:nocompile = 1
    endif
endfunction
