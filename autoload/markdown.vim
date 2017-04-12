function! markdown#render()
    if executable("pandoc") && executable("w3m")
        call shell#exec("pandoc % \| w3m -T text/html", 0)
    endif
endfunction
