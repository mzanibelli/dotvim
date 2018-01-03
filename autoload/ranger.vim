let s:bufname = "Files"

function! ranger#open(...)
    if a:0 == 0
        call ranger#open(getcwd())
        return
    endif
    if !isdirectory(a:1) || ranger#focus()
        return
    endif
    let g:ranger = tempname()
    call term_start(ranger#command(g:ranger, a:1), ranger#options())
endfunction

function! ranger#command(out, dir)
    return ["/usr/bin/ranger", "--choosefile", a:out, "--", a:dir]
endfunction

function! ranger#options()
    let l:opt = {}
    let l:opt["term_name"] = s:bufname
    let l:opt["err_io"] = "null"
    let l:opt["close_cb"] = "ranger#callback"
    let l:opt["stoponexit"] = "kill"
    let l:opt["curwin"] = v:true
    return l:opt
endfunction

function! ranger#cleanup()
    if !exists("g:ranger")
        return
    endif
    if filereadable(g:ranger)
        call delete(g:ranger)
    endif
    unlet g:ranger
endfunction

function! ranger#window()
    for win in getwininfo()
        if win.bufnr == bufnr(s:bufname)
            execute "tabnext" win.tabnr
            execute printf("%dwincmd", win.winnr) "w"
            return 1
        endif
    endfor
    return 0
endfunction

function! ranger#buffer()
    try
        execute "buffer" s:bufname
        return 1
    catch
        call ranger#cleanup()
    endtry
    return 0
endfunction

function! ranger#focus()
    return ranger#window() || ranger#buffer()
endfunction

function! ranger#callback(channel)
    try
        let l:content = readfile(g:ranger)
        execute "edit" l:content[0]
        call feedkeys("\<C-L>", "n")
    catch
        quit
    finally
        call ranger#cleanup()
    endtry
endfunction

function! ranger#auto(file)
    if  !exists("g:reading_stdin") && isdirectory(a:file)
        keepalt bwipeout
        call ranger#open(a:file)
    endif
endfunction
