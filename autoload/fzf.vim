function! fzf#find()
    if exists("g:fzf")
        return
    endif
    let g:fzf = {"out": tempname(), "win": winnr()}
    call term_start(fzf#command(), fzf#options(g:fzf["out"]))
endfunction

function! fzf#command()
    return ["/usr/bin/fzf"]
endfunction

function! fzf#options(output)
    let l:opt = {}
    let l:opt["term_name"] = "Find"
    let l:opt["out_io"] = "file"
    let l:opt["out_name"] = a:output
    let l:opt["close_cb"] = "fzf#callback"
    let l:opt["stoponexit"] = "kill"
    let l:opt["term_finish"] = "close"
    return l:opt
endfunction

function! fzf#callback(channel)
    if filereadable(g:fzf["out"])
        let l:content = readfile(g:fzf["out"])
        if len(l:content) > 0
            execute printf("%dwindo", g:fzf["win"]) "edit" l:content[0]
        endif
    endif
    call fzf#cleanup()
endfunction

function! fzf#cleanup()
    if !exists("g:fzf")
        return
    endif
    if filereadable(g:fzf["out"])
        call delete(g:fzf["out"])
    endif
    unlet g:fzf
endfunction
