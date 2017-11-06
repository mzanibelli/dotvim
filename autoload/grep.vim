let &grepprg = "/usr/bin/grep --recursive --color=never -n"
let &grepformat = '%f:%l:%m,%f:%l%m,%f  %l%m'

function! grep#grep(...)
    let l:command = join([&grepprg, join(a:000), shellescape(getcwd())])
    call async#start(l:command, 'grep#qf')
endfunction

function! grep#qf(channel)
    let l:command = printf("cgetfile %s", g:bgoutput)
    call default#save('errorformat', shellescape(&grepformat), l:command)
    call async#end(a:channel)
endfunction

function! grep#configure()
    if executable("rg")
        let &grepprg = printf("/usr/bin/rg --no-ignore-parent --color=never --vimgrep --threads %d", default#units())
        let &grepformat = '%f:%l:%c:%m,%f:%l:%m'
    endif
endfunction
