function! shell#exec(command, null)
    let l:command = printf("!%s%s", a:command, a:null == 1 ? " > /dev/null 2>&1" : "")
    silent execute l:command
    redraw!
    return v:shell_error == 0
endfunction

function! shell#run(command)
    execute printf("!clear;%s", a:command)
    redraw!
    return v:shell_error == 0
endfunction

function! shell#background(command)
    call async#start(a:command, 'async#end')
endfunction
