function! async#start(command, ...)
    let l:options = {}
    let l:options["stoponexit"] = "kill"
    let l:options["cwd"] = getcwd()
    call extend(l:options, get(a:000, 0, {}))
    call async#makejob(a:command, l:options)
endfunction

function! async#makejob(command, options)
    let l:command = [&shell, &shellcmdflag, a:command]
    let l:options = a:options
    let l:out = get(l:options, 'out_name', v:false)
    let Callback = get(a:options, 'close_cb', {-> v:false})
    let l:options["close_cb"] = async#close(Callback, l:out)
    return job_start(l:command, l:options)
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
    let l:jobs = empty(a:str) ? job_info() : filter(job_info(), "join(job_info(v:val).cmd) =~ a:str")
    call map(l:jobs, "job_stop(v:val)")
endfunction

function! async#complete(a, l, p)
    let l:cmds = map(job_info(), "join(split(join(job_info(v:val).cmd))[2:2])")
    return filter(l:cmds, "v:val =~ a:a")
endfunction
