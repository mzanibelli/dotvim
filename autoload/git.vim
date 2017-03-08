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

function! git#tracked(file)
    if shell#exec("git ls-files --error-unmatch -- ".fnameescape(a:file), 1) == 0
        echom "Not a Git repository"
        return 0
    endif
    return 1
endfunction
