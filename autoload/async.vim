function! async#start(command, callback)
    if exists("*job_start") && !exists("g:bgoutput")
        let g:bgoutput = default#tempname()
        let l:command = [&shell, &shellcmdflag, escape(a:command, '\')]
        call job_start(l:command, {'close_cb': a:callback, 'out_io': 'file', 'out_name': g:bgoutput})
        redrawstatus!
    endif
endfunction

function! async#end(channel)
    silent doautocmd User AsyncPost
    autocmd! User AsyncPost
    call delete(g:bgoutput)
    unlet g:bgoutput
    redrawstatus!
endfunction
