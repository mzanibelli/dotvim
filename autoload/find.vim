let s:findprg = "/usr/bin/find"
let s:findargs = "-type f -path"

function! find#find(filename)
    if filereadable(a:filename)
        execute "edit ".a:filename
    elseif a:filename =~# '\v^(\*|\w|-|\.|/| )+$'
        call find#bgstart(a:filename)
    endif
endfunction

function! find#bgstart(filename)
    let l:filename = printf("*%s*", a:filename)
    let l:command = join([s:findprg, shellescape(getcwd()), s:findargs, shellescape(l:filename)])
    call async#start(l:command, 'find#qf')
endfunction

function! find#qf(channel)
    let l:command = printf("cgetfile %s", g:bgoutput)
    call default#save('errorformat', shellescape('%f'), l:command)
    call qf#cfirst()
    call async#end(a:channel)
endfunction

function find#configure()
    if executable("rg")
        let s:findprg = "/usr/bin/rg"
        let s:findargs = printf("--no-ignore-parent --color=never --threads %d --files --glob", default#units())
    endif
endfunction
