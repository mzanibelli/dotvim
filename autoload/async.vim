function! async#term(command, ...)
    let l:options = {}
    let l:options["stoponexit"] = "kill"
    let l:options["cwd"] = getcwd()
    let l:options["term_kill"] = "kill"
    let l:options["term_finish"] = "close"
    call extend(l:options, get(a:000, 0, {}))
    return async#makejob(a:command, l:options, "term")
endfunction

function! async#job(command, ...)
    let l:options = {}
    let l:options["stoponexit"] = "kill"
    let l:options["cwd"] = getcwd()
    call extend(l:options, get(a:000, 0, {}))
    return async#makejob(a:command, l:options, "job")
endfunction

function! async#makejob(command, options, type)
    let l:options = a:options
    let l:options["close_cb"] = async#close(
        \ get(l:options, 'close_cb', {-> v:false}),
        \ get(l:options, 'out_name', v:false)
        \ )
    if a:type ==# "job"
        let l:command = [&shell, &shellcmdflag, printf("exec %s", a:command)]
        return job_start(l:command, l:options)
    endif
    return term_start(a:command, l:options)
endfunction

function! async#close(func, out)
    return {channel -> a:func() || async#cleanup(a:out)}
endfunction

function! async#cleanup(out)
    if filereadable(a:out)
        call delete(a:out)
    endif
    silent checktime
    redrawstatus!
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

function! async#jobs()
    return filter(job_info(), "job_status(v:val) !=# 'dead'")
endfunction
