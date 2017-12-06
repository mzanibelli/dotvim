function! async#start(command, callback)
    if exists("g:bgoutput")
        return
    endif
    let g:bgoutput = tempname()
    let l:command = [&shell, &shellcmdflag, a:command]
    let l:options = {}
    let l:options["close_cb"] = a:callback
    let l:options["out_io"] = "file"
    let l:options["out_name"] = g:bgoutput
    let l:options["stoponexit"] = "kill"
    call job_start(l:command, l:options)
    redrawstatus!
endfunction


function! async#end(channel)
    call delete(g:bgoutput)
    unlet g:bgoutput
    redrawstatus!
endfunction
