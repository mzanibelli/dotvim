function! grep#word()
    call grep#grep(expand('<cword>'), 'word')
endfunction

function! grep#visual()
    call grep#grep(visual#gettext(), 'fixed')
endfunction

function! grep#grep(args, type)
    call async#start(grep#command(a:args, a:type), 'grep#qf')
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
        let s:grepmodes = {'word': '-wFe', 'fixed': '-Fe'}
    else
        let &grepprg="/usr/bin/grep --recursive --color=never -n"
        let &grepformat='%f:%l:%m,%f:%l%m,%f  %l%m'
        let s:grepmodes = {'word': '-wFe', 'fixed': '-Fe'}
    endif
endfunction
