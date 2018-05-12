function! edit#find(mode)
    if exists("g:edit")
        return
    endif
    let g:edit = {"out": tempname(), "win": winnr()}
    call term_start(edit#command(g:edit["out"])[a:mode], edit#options(g:edit["out"])[a:mode])
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

function! edit#options(output)
    let l:common = {}
    let l:common["term_name"] = "Edit"
    let l:common["close_cb"] = "edit#callback"
    let l:common["stoponexit"] = "kill"
    let l:common["term_finish"] = "close"
    let l:fzf = {}
    let l:fzf["out_io"] = "file"
    let l:fzf["out_name"] = a:output
    let l:result = {}
    let l:result["ranger"] = deepcopy(l:common)
    let l:result["fzf"] = extend(l:common, l:fzf)
    return l:result
endfunction

function! edit#callback(channel)
    let l:edit = deepcopy(g:edit)
    unlet g:edit
    if !exists("l:edit") || !filereadable(l:edit["out"])
        return
    endif
    let l:target = get(readfile(l:edit["out"]), 0, v:false)
    if filereadable(l:target)
        execute printf("%dwindo edit %s", l:edit["win"], l:target)
    endif
    call delete(l:edit["out"])
endfunction
