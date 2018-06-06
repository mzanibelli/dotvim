let g:threads = {}

function! make#auto(file)
    if exists("g:nocompile") && g:nocompile == 1
        return
    endif
    if !exists("b:autocompile") || b:autocompile == 0
        return
    endif
    let l:output = tempname()
    let l:options = {}
    let l:options['out'] = l:output
    let l:options['win'] = bufwinnr(a:file)
    let l:options['efm'] = &errorformat
    let l:channel = make#start(a:file, l:output)
    let g:threads[get(ch_info(l:channel), 'id', 0)] = l:options
endfunction

function! make#start(target, output)
    let l:options = {}
    let l:options['out_io'] = 'file'
    let l:options['out_name'] = a:output
    let l:options['close_cb'] = 'make#qf'
    return async#start(make#command(a:target), l:options)
endfunction

function! make#command(file)
    return join([&makeprg, shellescape(fnamemodify(a:file, ":p")), "2>&1"])
endfunction

function! make#qf(channel)
    silent! checktime
    let l:id = get(ch_info(a:channel), 'id', 0)
    let l:data = get(g:threads, l:id, {})
    call make#results(readfile(l:data.out), l:data.efm, l:data.win)
    call delete(l:data.out)
    call remove(g:threads, l:id)
endfunction

function! make#results(text, efm, window)
    if a:window == -1
        return
    endif
    call setloclist(a:window, [], 'r', {'lines': a:text, 'efm': a:efm})
    doautocmd QuickFixCmdPost lmake
endfunction

function! make#toggle()
    if exists("g:nocompile")
        let g:nocompile = 1 - g:nocompile
    else
        let g:nocompile = 1
    endif
endfunction
