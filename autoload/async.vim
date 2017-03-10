function! async#start(command, callback)
    if !exists("g:bgoutput")
        let g:bgoutput = tempname()
        let l:command = [&shell, &shellcmdflag, a:command]
        call job_start(l:command, {'close_cb': a:callback, 'out_io': 'file', 'out_name': g:bgoutput})
        redrawstatus!
    endif
endfunction

function! async#end()
    unlet g:bgoutput
    redrawstatus!
endfunction
