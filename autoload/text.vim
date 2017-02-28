function! text#mode()
    let b:textformat=1
    call surround#lightweight()
    setlocal nonumber
    setlocal textwidth=60
    setlocal spell
endfunction
