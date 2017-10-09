function! shell#run(command)
    execute printf("!clear;%s", a:command)
    redraw!
    return v:shell_error == 0
endfunction
