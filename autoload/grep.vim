function! grep#grep(...)
    let l:command = join([&grepprg, join(a:000), shellescape(getcwd())])
    call qf#cclear()
    call async#start(l:command, {'out_cb': 'grep#qf'})
endfunction

function! grep#qf(channel, message)
    call qf#append(a:message, &grepformat)
endfunction

function! grep#configure()
    if executable("rg")
        let &grepprg = printf("/usr/bin/rg --no-ignore-parent --color=never --vimgrep --threads %d", default#units())
        let &grepformat = '%f:%l:%c:%m,%f:%l:%m'
    endif
endfunction
