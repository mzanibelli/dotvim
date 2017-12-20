let s:bufname = "Files"

function! ranger#command(out, dir)
    return ["/usr/bin/ranger", "--clean", "--choosefile", a:out, "--cmd", "set colorscheme snow", "--", a:dir]
endfunction

function! ranger#options()
    let l:opt = {}
    let l:opt["term_name"] = s:bufname
    let l:opt["err_io"] = "null"
    let l:opt["close_cb"] = "ranger#callback"
    let l:opt["stoponexit"] = "kill"
    let l:opt["env"] = {"EDITOR": "gvim"}
    let l:opt["curwin"] = v:true
    return l:opt
endfunction

function! ranger#cleanup()
    if !exists("g:fileselector")
        return
    endif
    if filereadable(g:fileselector)
        call delete(g:fileselector)
    endif
    unlet g:fileselector
endfunction

function! ranger#isopen()
    for win in getwininfo()
        if win.bufnr == bufnr(s:bufname)
            return 1
        endif
    endfor
    return 0
endfunction

function! ranger#focus()
    if ranger#isopen()
        return 1
    endif
    try
        let l:cmd = []
        if bufnr("#") == bufnr(s:bufname)
            call add(l:cmd, "keepalt")
        endif
        call add(l:cmd, "buffer")
        call add(l:cmd, s:bufname)
        execute join(l:cmd)
        return 1
    catch
        call ranger#cleanup()
    endtry
    return 0
endfunction

function! ranger#open(dir)
    if !isdirectory(a:dir) || ranger#focus() == 1
        return
    endif
    let g:fileselector = tempname()
    let l:cmd = ranger#command(g:fileselector, a:dir)
    let l:opt = ranger#options()
    keepalt call term_start(l:cmd, l:opt)
endfunction

function! ranger#callback(channel)
    try
        let l:content = readfile(g:fileselector)
        execute "keepalt" "edit" l:content[0]
        call feedkeys("\<C-L>", "n")
    catch
        quit
    finally
        call ranger#cleanup()
    endtry
endfunction

function! ranger#onstart()
    if exists("g:reading_stdin")
        return
    endif
    call ranger#open(get(argv(), 0, ""))
endfunction

function! ranger#onenter(dir)
    call ranger#open(a:dir)
endfunction
