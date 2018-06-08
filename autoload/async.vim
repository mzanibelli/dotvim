let g:threads = {}

function! async#start(command, ...)
    let l:options = {}
    let l:options["stoponexit"] = "kill"
    let l:options["cwd"] = getcwd()
    call extend(l:options, get(a:000, 0, {}))
    let l:metadata = get(a:000, 1, {})
    call extend(l:metadata, l:options)
    let l:job = async#makejob(a:command, l:options)
    call async#register(l:job, l:metadata)
endfunction

function! async#makejob(command, options)
    let l:command = [&shell, &shellcmdflag, a:command]
    let l:options = a:options
    let l:options["close_cb"] = "async#close"
    return job_start(l:command, l:options)
endfunction

function! async#register(job, metadata)
    let l:id = get(ch_info(job_getchannel(a:job)), 'id', 0)
    let g:threads[l:id] = a:metadata
endfunction

function! async#close(channel)
    let l:id = get(ch_info(a:channel), 'id', 0)
    let l:thread = get(g:threads, l:id, {})
    let Callback = function(get(l:thread, 'close_cb', 'async#stub'))
    call Callback(l:thread)
    if get(l:thread, 'out_io', '') ==# 'file'
        call delete(get(l:thread, 'out_name', ''))
    endif
    call remove(g:threads, l:id)
    redrawstatus!
endfunction

function! async#stub(thread)
endfunction

function! async#kill(str)
    if empty(a:str)
        let l:jobs = job_info()
    else
        let l:jobs = filter(job_info(), "join(job_info(v:val).cmd) =~ a:str")
    endif
    call map(l:jobs, "job_stop(v:val)")
endfunction

function! async#complete(a, l, p)
    let l:cmds = map(job_info(), "join(split(join(job_info(v:val).cmd))[2:2])")
    return filter(l:cmds, "v:val =~ a:a")
endfunction
