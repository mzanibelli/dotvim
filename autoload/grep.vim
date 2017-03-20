function! grep#opfunc(type)
    let l:reg = @@
    if a:type ==# "v"
        normal! `<v`>y
    elseif a:type ==# "char"
        normal! `[v`]y
    else
        return
    endif
    call grep#grep(@@)
    let @@ = l:reg
endfunction

function! grep#grep(args)
    call async#start(grep#command(a:args), 'grep#qf')
endfunction

function! grep#qf(channel)
    let l:command = printf('call qf#cload("cgetfile %s")', g:bgoutput)
    call default#save('errorformat', shellescape(&grepformat), l:command)
    call async#end()
endfunction

function! grep#command(args)
    let l:suffix = executable("rg") ? "" : " -R"
    return &grepprg." -F ".shellescape(a:args).l:suffix." ".getcwd()
endfunction

function! grep#configure()
    if executable("rg")
        let &grepprg="rg --color=never --vimgrep --threads ".default#units()
        set grepformat=%f:%l:%c:%m,%f:%l:%m
    elseif executable("ag")
        let &grepprg="ag --nogroup --nocolor --vimgrep --skip-vcs-ignores --workers ".default#units()
        set grepformat=%f:%l:%c:%m,%f:%l:%m
    else
        let &grepprg="grep --exclude-dir={.svn,.git} --exclude={cscope.out,tags} --color=never -n"
        set grepformat=%f:%l:%m,%f:%l%m,%f\ \ %l%m
    endif
endfunction
