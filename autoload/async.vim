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
