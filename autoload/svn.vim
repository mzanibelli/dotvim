function! svn#diff(...)
    let l:args = a:0 > 0 ? a:1 ==# "" ? "" : shellescape(a:1, 1) : ""
    call shell#exec("svn diff ".l:args." %", 0)
endfunction

function! svn#log(...)
    let l:default = "-l 10"
    let l:args = a:0 > 0 ? a:1 ==# "" ? l:default : shellescape(a:1, 1) : l:default
    call shell#exec("svn log ".l:args." % | less", 0)
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
        call shell#exec("svn revert %", 0)
    endif
endfunction

function! svn#add()
    call shell#exec("svn add --force %", 1)
endfunction

function! svn#commit(...)
    let l:args = a:0 > 0 ? a:1 ==# "" ? "" : shellescape(a:1, 1) : ""
    call shell#exec("svn commit ".l:args, 0)
endfunction

function! svn#build()
    call shell#exec("svn diff --summarize | cut -c 9- > /tmp/svn-changelist.tmp && $EDITOR /tmp/svn-changelist.tmp", 0)
endfunction

function! svn#send()
    call shell#exec("svn commit --targets /tmp/svn-changelist.tmp", 0)
endfunction

function svn#update()
    call shell#run("svn update")
endfunction

function svn#status()
    call shell#run("svn status")
endfunction

function! svn#tracked(file)
    if shell#exec("svn info ".fnameescape(a:file), 1) == 0
        echom "Not an SVN repository"
        return 0
    endif
    return 1
endfunction

