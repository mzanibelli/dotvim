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
