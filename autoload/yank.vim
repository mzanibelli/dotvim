let s:markers = {'char': '`[v`]','line': "'[V']"}

function! yank#incmap(type)
    if a:type ==# "line"
        return  ":\<C-U>call yank#incrange('".v:register."')\<CR>"
    elseif a:type ==# "operator"
        return  ":\<C-U>set operatorfunc=yank#opfunc\<CR>\"".v:register."g@"
    elseif a:type ==# "visual"
        return ":\<C-U>call yank#incvisual('".v:register."')\<CR>"
    endif
endfunction

function! yank#getreg(reg)
    return {"content": getreg(a:reg), "type": getregtype(a:reg)}
endfunction

function! yank#setreg(reg, val)
    call setreg(a:reg, a:val["content"], a:val["type"])
endfunction

function! yank#regappend(input, register)
    let l:reg = yank#getreg(a:register)
    let l:reg["content"] .= a:input
    call yank#setreg(a:register, l:reg)
    echom printf("%s lines in register %s", len(split(l:reg["content"], '\n')), a:register)
endfunction

function! yank#incvisual(register)
    call yank#regappend(visual#gettext(), a:register)
endfunction

function! yank#incrange(register) range
    call yank#regappend(join(getline(a:firstline, a:lastline), "\n")."\n", a:register)
endfunction

function! yank#opfunc(type)
    if a:type ==# "char" || a:type ==# "line"
        let l:reg = yank#getreg(v:register)
        execute printf("normal! %s\"%sy", s:markers[a:type], v:register)
        let l:target = getreg(v:register)
        call yank#setreg(v:register, l:reg)
        call yank#regappend(l:target, v:register)
    endif
endfunction
