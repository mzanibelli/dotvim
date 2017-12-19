function! ranger#open(dir, ...)
    if isdirectory(a:dir) && !exists("s:tmp")
        let s:tmp = tempname()
        let l:cmd = ["ranger", "--choosefiles", s:tmp, "--selectfile", a:dir, "--clean", "--cmd", "set colorscheme snow"]
        let l:opt = {}
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
    if filereadable(s:tmp)
        let l:content = readfile(s:tmp)
        if len(l:content) > 0
            execute "argadd" join(l:content)
            execute "keepalt" "edit" l:content[0]
            call feedkeys("\<C-L>", "n")
        endif
    endif
    unlet s:tmp
endfunction

function! ranger#onstart()
    if argc() == 1 && isdirectory(argv()[0]) && !exists("g:reading_stdin")
        call ranger#open(argv()[0])
    endif
endfunction
