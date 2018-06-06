function! async#start(command, ...)
    let l:command = [&shell, &shellcmdflag, a:command]
    let l:options = {}
    let l:options["stoponexit"] = "kill"
    let l:options["cwd"] = getcwd()
    let l:options["exit_cb"] = "async#end"
    call extend(l:options, get(a:000, 0, {}))
    return job_getchannel(job_start(l:command, l:options))
endfunction

function! async#end(channel, status)
    call timer_start(5, "async#later")
endfunction

function! async#later(timer)
    redrawstatus!
endfunction
