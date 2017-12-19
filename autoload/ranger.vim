function! ranger#open(dir, ...)
    if isdirectory(a:dir) && !exists("s:tmp")
        let s:tmp = tempname()
        let l:cmd = ["ranger", "--choosefiles", s:tmp, "--clean", "--cmd", "set colorscheme snow", a:dir]
        let l:opt = {}
        let l:opt["term_name"] = "File Manager"
        let l:opt["close_cb"] = "ranger#callback"
        let l:opt["stoponexit"] = "kill"
        if a:0 > 0
            if a:1 !=# "curwin"
                let l:opt["term_finish"] = "close"
            endif
            if a:1 ==# "curwin" || a:1 ==# "vertical"
                let l:opt[a:1] = 1
            endif
        endif
        call term_start(l:cmd, l:opt)
    endif
endfunction

function! ranger#callback(channel)
    try
        let l:content = readfile(s:tmp)
        execute "argadd" join(l:content)
        execute "keepalt" "edit" l:content[0]
        call feedkeys("\<C-L>", "n")
    catch
        quit
    finally
        unlet s:tmp
    endtry
endfunction

function! ranger#onstart()
    if argc() == 1 && isdirectory(argv()[0]) && !exists("g:reading_stdin")
        call ranger#open(argv()[0])
    endif
endfunction
