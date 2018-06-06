let &grepprg = "/usr/bin/grep --recursive --color=never -n"
let &grepformat = '%f:%l:%m,%f:%l%m,%f  %l%m'

function! grep#grep(...)
    let l:command = join([&grepprg, join(a:000), shellescape(getcwd())])
    call setqflist([], 'f')
    call async#start(l:command, {'out_cb': 'grep#qf'})
endfunction

function! grep#qf(channel, message)
    let l:efm = &errorformat
    try
        let &errorformat = &grepformat
        caddexpr a:message
    finally
        let &errorformat = l:efm
    endtry
endfunction

function! grep#configure()
    if executable("rg")
        let &grepprg = printf("/usr/bin/rg --no-ignore-parent --color=never --vimgrep --threads %d", default#units())
        let &grepformat = '%f:%l:%c:%m,%f:%l:%m'
    endif
endfunction
