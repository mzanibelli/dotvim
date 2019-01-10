function! edit#open(mode, cwd)
    let l:out = tempname()
    let l:win = winnr()
    let l:options = edit#options(l:out, l:win, a:cwd)
    call async#term(edit#command(l:out)[a:mode], l:options)
endfunction

function! edit#command(output)
    let l:commands = {}
    let l:commands["fzf"] = ["/usr/bin/fzf"]
    let l:commands["noice"] = ["/usr/bin/noicepick"]
    return l:commands
endfunction

function! edit#options(out, win, cwd)
    let l:options = {}
    let l:options["close_cb"] = {-> edit#callback(a:out, a:win)}
    let l:options["term_name"] = "Edit"
    let l:options["out_io"] = "file"
    let l:options["out_name"] = a:out
    let l:options["cwd"] = a:cwd
    return l:options
endfunction

function! edit#callback(out, win)
    if !filereadable(a:out)
        return
    endif
    let l:target = get(readfile(a:out), -1, v:false)
    if filereadable(l:target)
        execute printf("%dwindo edit %s", a:win, l:target)
    endif
    call delete(a:out)
endfunction
