function! text#mode()
    let b:textformat=1
    let b:completiontype="\<C-X>S"
    call surround#lightweight()
    setlocal nonumber
    setlocal textwidth=60
    setlocal spell
endfunction
