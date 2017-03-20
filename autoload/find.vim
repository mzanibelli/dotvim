function! find#find(filename)
    if a:filename =~# '\v^(\*|\w|-|\.|/| )+$'
        call find#bgstart(a:filename)
    else
        echom "Invalid file pattern"
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
    let l:command = printf('call qf#cload("cgetfile %s")', g:bgoutput)
    call default#save('errorformat', shellescape('%f'), l:command)
    call qf#cfirst()
endfunction
