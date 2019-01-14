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

function! async#kill(pid)
    let l:jobs = job_info()
    let l:filter = "string(job_info(v:val).process) ==# a:pid"
    call map(empty(a:pid) ? l:jobs : filter(l:jobs, l:filter), "job_stop(v:val, 'kill')")
endfunction

function! async#complete(a, l, p)
    let l:cmds = map(job_info(), "string(job_info(v:val).process)")
    return filter(l:cmds, "v:val =~ a:a")
endfunction

function! async#ls()
    let l:jobs = job_info()
    if empty(l:jobs)
        echo "No jobs currently running"
        return
    endif
    echo printf("%d job(s) found:", len(l:jobs))
    for j in l:jobs
        let l:info = job_info(j)
        echo printf("[%s] %d %s", l:info.status, l:info.process, join(l:info.cmd))
    endfor
endfunction
