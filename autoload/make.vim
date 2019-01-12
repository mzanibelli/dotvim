function! make#auto(file)
    if exists("g:nocompile") && g:nocompile == 1
        return
    endif
    if !exists("b:autocompile") || b:autocompile == 0
        return
    endif
    let l:output = tempname()
    let l:options = {}
    let l:options['err_io'] = 'out'
    let l:options['out_io'] = 'file'
    let l:options['out_name'] = l:output
    let l:options['exit_cb'] = {-> make#qf(bufwinnr(a:file), l:output, &errorformat)}
    call async#job(make#command(a:file), l:options)
endfunction

function! make#command(file)
    return join([&makeprg, shellescape(fnamemodify(a:file, ":p"))])
endfunction

function! make#qf(win, out, efm)
    silent checktime
    if a:win == -1 || win_getid(a:win) == 0
        return
    endif
    call setloclist(a:win, [], 'r', {'lines': readfile(a:out), 'efm': a:efm})
    execute printf("%dwindo", a:win) "lwindow"
endfunction

function! make#toggle()
    if exists("g:nocompile")
        let g:nocompile = 1 - g:nocompile
    else
        let g:nocompile = 1
    endif
endfunction
