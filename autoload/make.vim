function! make#auto(file)
    if exists("g:nocompile") && g:nocompile == 1
        return
    endif
    if !exists("b:autocompile") || b:autocompile == 0
        return
    endif
    let l:output = tempname()
    let l:options = {}
    let l:options['out_io'] = 'file'
    let l:options['out_name'] = l:output
    let l:options['close_cb'] = 'make#qf'
    let l:metadata = {}
    let l:metadata['win'] = bufwinnr(a:file)
    let l:metadata['efm'] = &errorformat
    call async#start(make#command(a:file), l:options, l:metadata)
endfunction

function! make#command(file)
    return join([&makeprg, shellescape(fnamemodify(a:file, ":p")), "2>&1"])
endfunction

function! make#qf(metadata)
    let l:win = a:metadata.win
    let l:out = a:metadata.out_name
    let l:efm = a:metadata.efm
    if l:win == -1
        return
    endif
    if win_getid(l:win) == 0
        return
    endif
    call setloclist(l:win, [], 'r', {'lines': readfile(l:out), 'efm': l:efm})
    execute printf("%dwindo", l:win) "lwindow"
endfunction

function! make#toggle()
    if exists("g:nocompile")
        let g:nocompile = 1 - g:nocompile
    else
        let g:nocompile = 1
    endif
endfunction
