function! edit#open(mode, cwd)
    let l:out = tempname()
    let l:win = winnr()
    let l:options = edit#options(l:out, l:win, a:cwd)
    call async#term(edit#command()[a:mode], l:options)
endfunction

function! edit#command()
    let l:commands = {}
    let l:commands["fzf"] = ["/usr/bin/fzf"]
    let l:commands["noice"] = ["/usr/bin/nnn", "-p", "-"]
    return l:commands
endfunction

function! edit#options(out, win, cwd)
    let l:options = {}
    let l:options["exit_cb"] = {-> edit#callback(a:out, a:win)}
    let l:options["term_name"] = "Edit"
    let l:options["out_io"] = "file"
    let l:options["out_name"] = a:out
    if !empty(a:cwd)
        let l:options["cwd"] = a:cwd
    endif
    return l:options
endfunction

function! edit#callback(out, win)
    for file in readfile(a:out)
        execute printf("%dwindo", a:win) "edit" fnameescape(file)
    endfor
endfunction
