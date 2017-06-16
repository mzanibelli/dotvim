function! grep#grep(args, type)
    let s:regrep_args = a:args
    let s:regrep_type = a:type
    call async#start(grep#command(a:args, a:type), 'grep#qf')
endfunction

function! grep#regrep()
    if exists("s:regrep_args") && exists("s:regrep_type")
        call grep#grep(s:regrep_args, s:regrep_type)
    endif
endfunction

function! grep#command(args, type)
    return join([&grepprg, s:grepmodes[a:type], shellescape(a:args), getcwd()])
endfunction

function! grep#qf(channel)
    let l:command = printf("cgetfile %s", g:bgoutput)
    call default#save('errorformat', shellescape(&grepformat), l:command)
    call async#end(a:channel)
endfunction

function! grep#configure()
    if executable("rg")
        let &grepprg="/usr/bin/rg --no-ignore-parent --color=never --vimgrep --threads ".default#units()
        let &grepformat='%f:%l:%c:%m,%f:%l:%m'
        let s:grepmodes = {'regex': '-e', 'fixed': '-Fe'}
    else
        let &grepprg="/usr/bin/grep --dereference-recursive --exclude-dir={.svn,.git} --exclude={cscope.out,tags} --color=never -n"
        let &grepformat='%f:%l:%m,%f:%l%m,%f  %l%m'
        let s:grepmodes = {'regex': '-Ee', 'fixed': '-Fe'}
    endif
endfunction
