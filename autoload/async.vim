function! async#term(command, ...)
    let l:options = {}
    let l:options["stoponexit"] = "kill"
    let l:options["cwd"] = getcwd()
    let l:options["term_kill"] = "kill"
    let l:options["term_finish"] = "close"
    call extend(l:options, get(a:000, 0, {}))
    return term_start(a:command, l:options)
endfunction

function! async#job(command, ...)
    let l:options = {}
    let l:options["stoponexit"] = "kill"
    let l:options["cwd"] = getcwd()
    call extend(l:options, get(a:000, 0, {}))
    return job_start([&shell, &shellcmdflag, a:command], l:options)
endfunction

function! async#kill(str)
    let l:filter = "join(job_info(v:val).cmd) =~ a:str"
    let l:jobs = empty(a:str) ? async#jobs() : filter(async#jobs(), l:filter)
    call map(l:jobs, "job_stop(v:val)")
endfunction

function! async#complete(a, l, p)
    let l:cmds = map(job_info(), "join(split(join(job_info(v:val).cmd))[2:2])")
    return filter(l:cmds, "v:val =~ a:a")
endfunction
