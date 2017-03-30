function! doc#browse(search)
    if executable("firefox")
        let l:search = substitute(a:search, ' ', '+', '')
        if &ft == "php"
            silent execute "!firefox https://php.net/manual-lookup.php?pattern=".l:search
        elseif &ft == "python"
            silent execute "!firefox https://docs.python.org/2.7/search.html?q=".l:search
        elseif &ft == "go"
            silent execute "!firefox https://golang.org/search?q=".l:search
        elseif &ft == "sh"
            silent execute "!firefox http://explainshell.com/explain?cmd=".l:search
        else
            silent execute "!firefox https://www.google.com/search?q=".&ft."+".l:search
        endif
        redraw!
    endif
endfunction
