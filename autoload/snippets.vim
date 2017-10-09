let s:matches = {
        \ "abs" : "abstract ",
        \ "fin" : "final ",
        \ "pub" : "public ",
        \ "pri" : "private ",
        \ "pro" : "protected ",
        \ "sta" : "static ",
    \}

function! snippets#snippet(abb, exp)
    execute 'inoreabbrev <buffer> <silent> '.a:abb.' '.a:exp.'<Esc>F%"_s<C-O>:call getchar()<CR>'
endfunction

function! snippets#functions()
    for a in [ "abs", "fin", "" ]
        for v in [ "pub", "pri", "pro" ]
            for s in [ "sta", "" ]
                call snippets#snippet(a.v.s."func", get(s:matches, a, "").s:matches[v].get(s:matches, s, "")."function %()")
            endfor
        endfor
    endfor
endfunction

function! snippets#init()
    if exists("b:funcsnippets") && b:funcsnippets == 1
        call snippets#functions()
    endif
    if exists("b:ftsnippets")
        for [abr, exp] in items(b:ftsnippets)
            call snippets#snippet(abr, exp)
        endfor
    endif
endfunction
