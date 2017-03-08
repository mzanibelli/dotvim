function! git#diff(...)
    let l:args = a:0 > 0 ? a:1 ==# "" ? "" : shellescape(a:1, 1) : ""
    call shell#exec("git difftool ".l:args." -- %", 0)
endfunction

function! git#log(...)
    let l:args = a:0 > 0 ? a:1 ==# "" ? "" : shellescape(a:1, 1) : ""
    call shell#exec("git log ".l:args." -- %", 0)
endfunction

function! git#blame()
    let l:line = line(".")
    setlocal nowrap nofoldenable
    aboveleft 29vnew
    %!git blame -c "#" | awk 'BEGIN {FS="\t"}; {print $1," ",$2}' | sed 's/(//g'
    setlocal nomodified readonly buftype=nofile nowrap nonumber winfixwidth bufhidden=wipe
    execute "normal! " . l:line . "gg"
    setlocal scrollbind
    wincmd p
    setlocal scrollbind
    syncbind
endfunction

function! git#revert()
    echom "You are about to revert ".expand("%")
    if confirm("Continue ?", "&Yes\n&No") == 1
        call shell#exec("git checkout -- %", 0)
    endif
endfunction

function! git#add()
    call shell#exec("git add -- %", 1)
endfunction

function! git#commit(...)
    let l:args = a:0 > 0 ? a:1 ==# "" ? "" : shellescape(a:1, 1) : ""
    call shell#exec("git commit ".l:args, 0)
endfunction

function! git#build()
    call shell#exec("git ls-files --deleted --modified --others --exclude-standard > /tmp/git-changelist.tmp && $EDITOR /tmp/git-changelist.tmp", 0)
endfunction

function! git#send()
    call shell#exec("cat /tmp/git-changelist.tmp \| xargs -d '\\n' git add -- && git commit", 0)
endfunction

function! git#update()
    call shell#run("git pull")
endfunction

function! git#status()
    call shell#run("git status")
endfunction

function! git#tracked(file)
    if shell#exec("git ls-files --error-unmatch -- ".fnameescape(a:file), 1) == 0
        echom "Not a Git repository"
        return 0
    endif
    return 1
endfunction
