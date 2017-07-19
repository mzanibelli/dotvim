function! help#help(topic)
    let l:current = expand("%")
    if &ft !=# "help" && l:current !=# ""
        let @# = l:current
    endif
    execute "keepalt help ".a:topic
endfunction

function! help#back()
    if expand("#") !=# ""
        buffer #
    else
        quit
    endif
endfunction
