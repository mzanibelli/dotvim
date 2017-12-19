let s:bufname = "Files"

function! ranger#command(out, dir)
    return ["/usr/bin/ranger", "--clean", "--choosefiles", a:out, "--cmd", "set colorscheme snow", "--", a:dir]
endfunction

function! ranger#options(args)
    let l:opt = {}
    let l:opt["term_name"] = s:bufname
    let l:opt["err_io"] = "null"
    let l:opt["close_cb"] = "ranger#callback"
    let l:opt["stoponexit"] = "kill"
    let l:extra = get(a:args, 0, "")
    if l:extra =~# '\v^(curwin|vertical)$'
        let l:opt[l:extra] = v:true
    endif
    return l:opt
endfunction

function! ranger#open(dir, ...)
    if !isdirectory(a:dir)
        return
    endif
    if exists("t:fileselector")
        execute "keepalt" "buffer" s:bufname
        return
    endif
    let t:fileselector = tempname()
    let l:cmd = ranger#command(t:fileselector, a:dir)
    let l:opt = ranger#options(a:000)
    keepalt call term_start(l:cmd, l:opt)
endfunction

function! ranger#callback(channel)
    try
        let l:content = readfile(t:fileselector)
        execute "keepalt" "edit" l:content[0]
        call feedkeys("\<C-L>", "n")
    catch
        quit
    finally
        call delete(t:fileselector)
        unlet t:fileselector
    endtry
endfunction

function! ranger#onstart()
    if exists("g:reading_stdin")
        return
    endif
    call ranger#open(get(argv(), 0, ""), "curwin")
endfunction

function! ranger#onenter(dir)
    call ranger#open(a:dir, "curwin")
endfunction
