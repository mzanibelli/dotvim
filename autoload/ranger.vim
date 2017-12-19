function! ranger#options()
    let l:opt = {}
    let l:opt["term_name"] = "Files"
    let l:opt["err_io"] = "null"
    let l:opt["close_cb"] = "ranger#callback"
    let l:opt["stoponexit"] = "kill"
    return l:opt
endfunction

function! ranger#command(out, dir)
    return ["/usr/bin/ranger", "--clean", "--choosefiles", a:out, "--cmd", "set colorscheme snow", "--", a:dir]
endfunction

function! ranger#open(dir, ...)
    if !exists("t:fileselector") && isdirectory(a:dir)
        let t:fileselector = tempname()
        let l:opt = ranger#options()
        if get(a:000, 0, "") =~# '\v^(curwin|vertical)$'
            let l:opt[a:1] = v:true
        endif
        let l:cmd = ranger#command(t:fileselector, a:dir)
        keepalt call term_start(l:cmd, l:opt)
    endif
endfunction

function! ranger#callback(channel)
    try
        let l:content = readfile(t:fileselector)
        execute "argadd" join(l:content)
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
    if argc() == 1 && isdirectory(argv()[0]) && !exists("g:reading_stdin")
        call ranger#open(argv()[0], "curwin")
    endif
endfunction
