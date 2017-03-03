let s:matches = {
        \ "abs" : "abstract ",
        \ "fin" : "final ",
        \ "pub" : "public ",
        \ "pri" : "private ",
        \ "pro" : "protected ",
        \ "sta" : "static ",
        \ "" : "",
    \}

function! cpp#funcsnippets()
    for a in [ "abs", "fin", "" ]
        for v in [ "pub", "pri", "pro" ]
            for s in [ "sta", "" ]
                call default#snippet(a.v.s, s:matches[a].s:matches[v].s:matches[s]."function %()")
            endfor
        endfor
    endfor
endfunction
