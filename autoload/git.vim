function! git#diff()
    call shell#exec("git difftool -- %", 0)
endfunction

function! git#log()
    call shell#exec("git log --oneline --graph -- %", 0)
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
        call shell#exec("git checkout -- %", 1)
        checktime
    endif
endfunction

function! git#build()
    call shell#exec("git ls-files --deleted --modified --others --exclude-standard | sort | uniq > $GIT_CHANGELIST && $EDITOR $GIT_CHANGELIST", 0)
endfunction

function! git#send()
    call shell#exec("cat $GIT_CHANGELIST \| xargs -d '\\n' git add -- && git commit", 0)
endfunction

function! git#commit()
    call git#build()
    call git#send()
endfunction

function! git#update()
    call shell#background("git pull")
    checktime
endfunction

function! git#status()
    call shell#exec("git --paginate status", 0)
endfunction

function! git#tracked(file)
    if shell#exec("git ls-files --error-unmatch -- ".fnameescape(a:file), 1) == 0
        return 0
    endif
    return 1
endfunction
