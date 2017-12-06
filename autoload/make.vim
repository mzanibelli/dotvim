function! make#auto(file)
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
