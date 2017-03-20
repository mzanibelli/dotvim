let s:markers = {'v': '`<v`>','char': '`[v`]'}

function! grep#getval(type)
    let l:reg = @@
    execute printf('normal! %sy', s:markers[a:type])
    let l:result = @@
    let @@ = l:reg
    return l:result
endfunction

function! grep#opfunc(type)
    if a:type ==# "v" || a:type ==# "char"
        call grep#grep(grep#getval(a:type), 'fixed')
    endif
endfunction

function! grep#grep(args, type)
    call async#start(grep#command(a:args, a:type), 'grep#qf')
endfunction

function! grep#command(args, type)
    return join([&grepprg, g:grepmodes[a:type], shellescape(a:args), getcwd()])
endfunction

function! grep#qf(channel)
    let l:command = printf('call qf#cload("cgetfile %s")', g:bgoutput)
    call default#save('errorformat', shellescape(&grepformat), l:command)
    call async#end()
endfunction

function! grep#configure()
    if executable("rg")
        let &grepprg="rg --color=never --vimgrep --threads ".default#units()
        let &grepformat='%f:%l:%c:%m,%f:%l:%m'
        let g:grepmodes = {'regex': '-e', 'fixed': '-F'}
    elseif executable("ag")
        let &grepprg="ag --nogroup --nocolor --vimgrep --skip-vcs-ignores --workers ".default#units()
        let &grepformat='%f:%l:%c:%m,%f:%l:%m'
        let g:grepmodes = {'regex': '', 'fixed': '-F'}
    else
        let &grepprg="grep --dereference-recursive --exclude-dir={.svn,.git} --exclude={cscope.out,tags} --color=never -n"
        let &grepformat='%f:%l:%m,%f:%l%m,%f  %l%m'
        let g:grepmodes = {'regex': '-E', 'fixed': '-F'}
    endif
endfunction
