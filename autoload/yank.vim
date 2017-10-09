function! yank#incmap(type)
    if a:type ==# "line"
        return  ":\<C-U>call yank#incrange('".v:register."')\<CR>"
    elseif a:type ==# "operator"
        return  ":\<C-U>set operatorfunc=yank#opfunc\<CR>\"".v:register."g@"
    elseif a:type ==# "visual"
        return ":\<C-U>call yank#incvisual('".v:register."')\<CR>"
    endif
endfunction

function! yank#incvisual(register)
    if visualmode() ==# "V"
        '<,'>call yank#incrange(a:register)
    else
        call setreg(a:register, visual#gettext(), "a")
    endif
endfunction

function! yank#incrange(register) range
    for line in getline(a:firstline, a:lastline)
        call setreg(a:register, line."\n", "a")
    endfor
endfunction

function! yank#opfunc(type)
    if a:type ==# "char"
        call setreg(v:register, default#gettext("'[", "']"), "a")
    elseif a:type ==# "line"
        '[,']call yank#incrange(v:register)
    endif
endfunction
