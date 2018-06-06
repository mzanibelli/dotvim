function! make#auto(file)
    if exists("g:nocompile") && g:nocompile == 1
        return
    endif
    if exists("b:autocompile") && b:autocompile == 1
        let g:makeoutput = tempname()
        let l:options = {}
        let l:options['out_io'] = 'file'
        let l:options['out_name'] = g:makeoutput
        let l:options['close_cb'] = 'make#qf'
        call async#start(make#command(a:file), l:options)
    endif
endfunction

function! make#command(file)
    return join([&makeprg, shellescape(fnamemodify(a:file, ":p")), "2>&1"])
endfunction

function! make#qf(channel)
    silent! checktime
    execute "lgetfile" g:makeoutput
    call delete(g:makeoutput)
    unlet g:makeoutput
endfunction

function! make#toggle()
    if exists("g:nocompile")
        let g:nocompile = 1 - g:nocompile
    else
        let g:nocompile = 1
    endif
endfunction
