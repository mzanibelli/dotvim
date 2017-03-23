let s:changelist = "/tmp/svn-changelist.tmp"

function! svn#diff()
    call shell#exec("svn diff %", 0)
endfunction

function! svn#log()
    call shell#exec("svn log -l 10 % | less", 0)
endfunction

function! svn#blame()
    let l:line = line(".")
    setlocal nowrap nofoldenable
    aboveleft 18vnew
    %!svn blame -x-w "#" | cut -c 1-18
    setlocal nomodified readonly buftype=nofile nowrap nonumber winfixwidth bufhidden=wipe
    execute "normal! " . l:line . "gg"
    setlocal scrollbind
    wincmd p
    setlocal scrollbind
    syncbind
endfunction

function! svn#revert()
    echom "You are about to revert ".expand("%")
    if confirm("Continue ?", "&Yes\n&No") == 1
        call shell#exec("svn revert %", 1)
        checktime
    endif
endfunction

function! svn#build()
    call shell#exec("svn diff --summarize \| cut -c 9- | sort | uniq > ".s:changelist." && $EDITOR ".s:changelist, 0)
endfunction

function! svn#send()
    call shell#exec("svn commit --targets ".s:changelist, 0)
endfunction

function! svn#commit()
    call svn#build()
    call svn#send()
endfunction

function! svn#update()
    call shell#run("svn update")
    checktime
endfunction

function! svn#status()
    call shell#exec("svn status | less", 0)
endfunction

function! svn#tracked(file)
    if shell#exec("svn info ".fnameescape(a:file), 1) == 0
        return 0
    endif
    return 1
endfunction
