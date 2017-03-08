function! shell#exec(command, null)
    let l:command = printf("!%s%s", a:command, a:null == 1 ? " > /dev/null 2>&1" : "")
    call suspend#stdout2shell()
    silent execute l:command
    call suspend#stdout2vim()
    redraw!
    return v:shell_error == 0
endfunction

function! shell#run(command)
    call suspend#stdout2shell()
    execute printf("!clear;%s", a:command)
    call suspend#stdout2vim()
    redraw!
    echom v:shell_error == 0 ? "Execution successful" : "An error occurred"
    return v:shell_error == 0
endfunction

function! shell#bgstart(command)
    if !exists("g:bgoutput")
        let g:bgoutput = tempname()
        call job_start(a:command, {'close_cb': 'shell#bgend', 'out_io': 'file', 'out_name': g:bgoutput})
        redrawstatus!
    endif
endfunction

function! shell#bgend(channel)
    unlet g:bgoutput
    redrawstatus!
endfunction
