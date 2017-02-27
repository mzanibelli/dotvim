function! suspend#stdout2vim()
    let &t_ti = ''
    let &t_te = ''
endfunction

function! suspend#stdout2shell()
    let &t_ti="\<Esc>[?1049h"
    let &t_te="\<Esc>[?1049l"
endfunction

function! suspend#ctrlz()
    try
        call suspend#stdout2shell()
        suspend!
    finally
        call suspend#stdout2vim()
    endtry
endfunction
