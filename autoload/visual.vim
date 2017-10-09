function! visual#align()
    if visualmode() !=# "V"
        normal! gv
    else
        call fold#bypass("'<,'>!column -t|sed 's/  \\(\\S\\)/ \\1/g'")
        call fold#bypass("normal! gv=")
    endif
endfunction

function! visual#down()
    if visualmode() !=# "V" || line(".") == line("$")
        normal! gv
    else
        call fold#bypass("normal! gvxp`[V`]=gv")
    endif
endfunction

function! visual#up()
    if visualmode() !=# "V" || line(".") == 1
        normal! gv
    else
        if line(".") == line("$")
            call fold#bypass("normal! gvxP`[V`]=gv")
        else
            call fold#bypass("normal! gvxkP`[V`]=gv")
        endif
    endif
endfunction

function! visual#duplicate()
    if visualmode() !=# "V"
        normal! gv
    else
        call fold#bypass("normal! gvyPgv")
    endif
endfunction

function! visual#gettext()
    return default#gettext("'<", "'>")
endfunction

function! visual#copy(dir)
    let l:column = virtcol('.')
    let l:pattern = '\%' . l:column . 'v.'
    let l:sourceline = search(l:pattern . '*\S', a:dir == 'up' ? 'bnW' : 'nW')
    if !l:sourceline
        return ""
    else
        return matchstr(getline(l:sourceline), l:pattern)
    endif
endfunction

function! visual#curly(way)
    let l:line = line(".")
    if a:way == 1
        if getline(l:line) =~# '\v\{\s*$'
            return "$%"
        elseif getline(l:line + 1) =~# '\v^\s*\{\s*$'
            return "j^%"
        endif
    elseif a:way == 0
        if getline(l:line) =~# '\v^\s*\}'
            return "^%"
        endif
        return "k"
    endif
    return "j"
endfunction
