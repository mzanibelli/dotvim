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
    let l:suffix = executable("rg") ? "" : " -R ."
    call qf#cload("grep! -F ".shellescape(a:args, 1).l:suffix)
endfunction

function! grep#infile(visual)
    if a:visual && visualmode() !=# "^V"
        let l:search = search#escape(visual#gettext())
    elseif a:visual
        return
    else
        let l:search = "\\<".expand("<cword>")."\\>"
    endif
    call qf#cload("silent! vimgrep /".l:search."/ %")
endfunction

function! grep#configure()
    if executable("rg")
        let &grepprg="rg --color=never --vimgrep --threads ".default#units()
        set grepformat=%f:%l:%c:%m,%f:%l:%m
    elseif executable("ag")
        let &grepprg="ag --nogroup --nocolor --vimgrep --skip-vcs-ignores --workers ".default#units()
        set grepformat=%f:%l:%c:%m,%f:%l:%m
    else
        set grepprg=grep\ --exclude-dir={.svn,.git}\ --exclude={cscope.out,tags}\ --color=never\ -n\ $*\ /dev/null
        set grepformat=%f:%l:%m,%f:%l%m,%f\ \ %l%m
    endif
endfunction
