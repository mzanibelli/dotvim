function! async#start(command, callback)
    if exists("g:bgoutput")
        call async#enqueue(a:command, a:callback)
        return
    endif
    let g:bgoutput = tempname()
    let l:command = [&shell, &shellcmdflag, a:command]
    let l:options = {
                \ 'close_cb': a:callback,
                \ 'out_io': 'file',
                \ 'out_name': g:bgoutput,
                \ 'stoponexit': 'kill'
                \ }
    call job_start(l:command, l:options)
    redrawstatus!
endfunction


function! async#end(channel)
    call delete(g:bgoutput)
    unlet g:bgoutput
    call async#next()
    redrawstatus!
endfunction

function! async#enqueue(command, callback)
    if !exists("g:bgqueue")
        let g:bgqueue = []
    endif
    call add(g:bgqueue, {"cmd": a:command, "cb": a:callback})
endfunction

function! async#next()
    if exists("g:bgqueue") && !empty(g:bgqueue)
        let l:payload = remove(g:bgqueue, 0)
        call async#start(l:payload["cmd"], l:payload["cb"])
    endif
endfunction
