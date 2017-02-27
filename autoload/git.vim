function! git#diff(...)
    if git#tracked(expand("%"))
        let l:args = a:0 > 0 ? a:1 ==# "" ? "" : shellescape(a:1, 1) : ""
        call shell#exec("git difftool ".l:args." %", 0)
    endif
endfunction

function! git#log(...)
    if git#tracked(expand("%"))
        let l:args = a:0 > 0 ? a:1 ==# "" ? "" : shellescape(a:1, 1) : ""
        call shell#exec("git log --graph ".l:args." %", 0)
    endif
endfunction

function! git#blame()
    if git#tracked(expand("%"))
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
    endif
endfunction

function! git#revert()
    if git#tracked(expand("%"))
        if confirm("Revert file ?", "&Yes\n&No") == 1
            call shell#exec("git checkout %", 0)
        endif
    endif
endfunction

function! git#details(line1, line2)
    if git#tracked(expand("%"))
        call shell#exec("git show $(git blame % -L ".a:line1.",".a:line2." \| awk '{print $1}')", 0)
    endif
endfunction

function! git#mappings()
    nnoremap <silent> <Leader>? :<C-U>call git#diff()<CR>
    nnoremap <silent> <Leader>+ :<C-U>call git#log()<CR>
    nnoremap <silent> <Leader>! :<C-U>call git#blame()<CR>
    nnoremap <silent> <Leader>$ :<C-U>call git#revert()<CR>
endfunction

function! git#tracked(file)
    if shell#exec("git ls-files ".fnameescape(a:file)." --error-unmatch", 1) == 0
        echom "Not a Git repository"
        return 0
    endif
    return 1
endfunction
