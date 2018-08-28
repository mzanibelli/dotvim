let s:commands = ["log", "show", "blame", "grep", "refs", "stash", "status"]

function! git#log()
    let l:file = expand("%:p")
    if empty(l:file)
        return
    endif
    let l:dir = fnamemodify(l:file, ":h")
    let l:options = {}
    let l:options["term_name"] = "Git"
    let l:options["cwd"] = l:dir
    let l:command = ["/usr/bin/tig", l:file]
    call async#term(l:command, l:options)
endfunction

function! git#complete(a, l, p)
    for c in s:commands
        if index(split(a:l), c) ==# 1
            return []
        endif
    endfor
    return filter(copy(s:commands), printf("v:val =~# '^%s'", a:a))
endfunction
