function! cli#override(abb, exp, ...)
    let l:buf = a:0 > 0 ? a:1 : 0
    execute 'cnoreabbr '.(l:buf ? "<buffer> " : "").a:abb.' <C-R>=getcmdpos() == 1 && getcmdtype() == ":" ? "'.a:exp.'" : "'.a:abb.'"<CR>'
endfunction
