function! find#find(filename)
    let s:refind_filename = a:filename
    if filereadable(a:filename)
        execute "edit ".a:filename
    elseif a:filename =~# '\v^(\*|\w|-|\.|/| )+$'
        call find#bgstart(a:filename)
    endif
endfunction

function! find#refind()
    if exists("s:refind_filename")
        call find#find(s:refind_filename)
    endif
endfunction

function! find#bgstart(filename)
    let l:filename = printf("*%s*", a:filename)
    let l:command = "find ".shellescape(getcwd())." -type f -ipath ".shellescape(l:filename)." -exec file -e soft {} +"
    call async#start(l:command, 'find#qf')
endfunction

function! find#qf(channel)
    let l:command = printf("cgetfile %s", g:bgoutput)
    call default#save('errorformat', shellescape('%f: %m'), l:command)
    call qf#cfirst()
    call async#end(a:channel)
endfunction
