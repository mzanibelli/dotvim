function! sql#quote()
    if syntax#commentorstring() == 2
        return "''"
    endif
    return "''\<Left>"
endfunction
