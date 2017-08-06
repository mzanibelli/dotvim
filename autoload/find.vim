function! find#find(filename)
    if filereadable(a:filename)
        execute "edit ".a:filename
    elseif a:filename =~# '\v^(\*|\w|-|\.|/| )+$'
        call find#bgstart(a:filename)
    endif
endfunction

function! find#bgstart(filename)
    let l:filename = printf("*%s*", a:filename)
    let l:command = "find ".shellescape(fnamemodify(getcwd(), ':p'))." -type f -ipath ".shellescape(l:filename)
    call async#start(l:command, 'find#qf')
endfunction

function! find#qf(channel)
    let l:command = printf("cgetfile %s", g:bgoutput)
    call default#save('errorformat', shellescape('%f'), l:command)
    call qf#cfirst()
    call async#end(a:channel)
endfunction
