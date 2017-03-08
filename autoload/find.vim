function! find#find(filename)
    silent call qf#cclear()
    if a:filename =~# '\v^(\*|\w|-|\.|/| )+$'
        call find#bgstart(a:filename)
    endif
endfunction

function! find#bgstart(filename)
    if !exists("g:bgoutput")
        let g:bgoutput = tempname()
        let l:filename = printf("*%s*", a:filename)
        let l:find = "find ".shellescape(getcwd())." -type f -ipath ".shellescape(l:filename)
        let l:command = [&shell, &shellcmdflag, l:find]
        call job_start(l:command, {'close_cb': 'find#bgend', 'out_io': 'file', 'out_name': g:bgoutput})
        redrawstatus!
    endif
endfunction

function! find#bgend(channel)
    call find#qf()
    call delete(g:bgoutput)
    unlet g:bgoutput
    redrawstatus!
endfunction

function! find#qf()
    let l:old_errfmt = &errorformat
    set errorformat=%f
    call qf#cload("cgetfile ".g:bgoutput)
    call qf#cfirst(1)
    let &errorformat = l:old_errfmt
endfunction
