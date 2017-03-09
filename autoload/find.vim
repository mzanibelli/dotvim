function! find#find(filename)
    silent call qf#cclear()
    if a:filename =~# '\v^(\*|\w|-|\.|/| )+$'
        call find#bgstart(a:filename)
    endif
endfunction

function! find#bgstart(filename)
    let l:filename = printf("*%s*", a:filename)
    let l:command = "find ".shellescape(getcwd())." -type f -ipath ".shellescape(l:filename)
    call async#start(l:command, 'find#bgend')
endfunction

function! find#bgend(channel)
    call find#qf()
    call async#end()
endfunction

function! find#qf()
    let l:old_errfmt = &errorformat
    set errorformat=%f
    call qf#cload("cgetfile ".g:bgoutput)
    let &errorformat = l:old_errfmt
endfunction
