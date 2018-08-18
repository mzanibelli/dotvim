function! git#log()
    let l:file = expand("%:p")
    if empty(l:file)
        return
    endif
    let l:dir = fnamemodify(l:file, ":h")
    let l:options = {}
    let l:options["term_name"] = "Git"
    let l:options["stoponexit"] = "kill"
    let l:options["term_finish"] = "close"
    let l:options["cwd"] = l:dir
    let l:command = ["/usr/bin/tig", l:file]
    call term_start(l:command, l:options)
endfunction
