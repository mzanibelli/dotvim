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

function! async#ls()
    let l:jobs = job_info()
    if empty(l:jobs)
        echo "No jobs currently running"
        return
    endif
    for j in l:jobs
        let l:info = job_info(j)
        echo printf("[%s] %d %s", l:info.status, l:info.process, join(l:info.cmd))
    endfor
endfunction
