function! edit#find(mode)
    let l:out = tempname()
    let l:win = winnr()
    let l:options = edit#options(l:out, l:win)
    call term_start(edit#command(l:out)[a:mode], l:options[a:mode])
endfunction

function! edit#command(output)
    let l:commands = {}
    let l:commands["fzf"] = ["/usr/bin/fzf"]
    let l:commands["ranger"] = ["/usr/bin/ranger", "--choosefile", a:output]
    if filereadable(expand('%'))
        call extend(l:commands["ranger"], ["--selectfile", expand("%")])
    endif
    return l:commands
endfunction

function! edit#options(out, win)
    let l:common = {}
    let l:common["term_name"] = "Edit"
    let l:common["close_cb"] = {channel -> edit#callback(a:out, a:win)}
    let l:common["stoponexit"] = "kill"
    let l:common["term_finish"] = "close"
    let l:fzf = {}
    let l:fzf["out_io"] = "file"
    let l:fzf["out_name"] = a:out
    let l:result = {}
    let l:result["ranger"] = deepcopy(l:common)
    let l:result["fzf"] = extend(l:common, l:fzf)
    return l:result
endfunction

function! edit#callback(out, win)
    if !filereadable(a:out)
        return
    endif
    let l:target = get(readfile(a:out), 0, v:false)
    if filereadable(l:target)
        execute printf("%dwindo edit %s", a:win, l:target)
    endif
    call delete(a:out)
endfunction
