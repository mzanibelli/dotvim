function! cpp#funcsnippets()
    for abstraction in [ "abs", "fin", "" ]
        for visibility in [ "pub", "pri", "pro" ]
            for static in [ "sta", "" ]
                execute printf("inoreabbrev <buffer> <silent> <expr> %s%s%sfunc cpp#snippet('%s', '%s', '%s')",
                            \ abstraction, visibility, static,
                            \ abstraction, visibility, static
                            \ )
            endfor
        endfor
    endfor
endfunction

function! cpp#snippet(abs, vis, sta)
    if a:abs ==# "abs"
        let l:abs = "abstract "
    elseif a:abs ==# "fin"
        let l:abs = "final "
    else
        let l:abs = ""
    endif
    if a:vis ==# "pub"
        let l:vis = "public "
    elseif a:vis ==# "pri"
        let l:vis = "private "
    else
        let l:vis = "protected "
    endif
    let l:sta = a:sta ==# "sta" ? "static " : ""
    return printf("%s%s%sfunction", l:abs, l:vis, l:sta)
endfunction
