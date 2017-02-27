function! help#help(topic)
    let l:current = expand("%")
    if &ft !=# "help" && l:current !=# ""
        let @# = l:current
    endif
    try
        execute "keepalt help ".a:topic
    catch
        echom "Help not found"
    endtry
endfunction
