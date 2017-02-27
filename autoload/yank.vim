function! yank#incmap(type)
    if a:type ==# "line"
        return  ":\<C-U>call yank#incrange('".v:register."')\<CR>"
    elseif a:type ==# "operator"
        return  ":\<C-U>set operatorfunc=yank#opfunc\<CR>\"".v:register."g@"
    elseif a:type ==# "visual"
        return ":\<C-U>call yank#incvisual('".v:register."')\<CR>"
    endif
endfunction

function! yank#regappend(input, register)
    let l:reg = getreg(a:register)
    let l:type = getregtype(a:register)
    let l:reg .= a:input
    call setreg(a:register, l:reg, l:type)
    let l:count = len(split(a:input, '\n'))
    let l:total = len(split(l:reg, '\n'))
    if l:count > 1
        echom printf("%d lines added to register %s (%d total)", l:count, a:register, l:total)
    elseif a:input =~# "\\n$"
        echom printf("%d line added to register %s (%d total)", l:count, a:register, l:total)
    endif
endfunction

function! yank#incvisual(register)
    call yank#regappend(visual#gettext(), a:register)
endfunction

function! yank#incrange(register) range
    call yank#regappend(join(getline(a:firstline, a:lastline), "\n")."\n", a:register)
endfunction

function! yank#opfunc(type)
    let l:reg = getreg(v:register)
    let l:type = getregtype(v:register)
    if a:type ==# "char"
        execute "normal! `[v`]\"".v:register."y"
    elseif a:type ==# "line"
        execute "normal! '[V']\"".v:register."y"
    else
        return
    endif
    let l:target = getreg(v:register)
    call setreg(v:register, l:reg, l:type)
    call yank#regappend(l:target, v:register)
endfunction
