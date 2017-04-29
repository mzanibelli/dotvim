function! search#selection()
    let @/ = search#escape(visual#gettext())
endfunction

function! search#replace(visual)
    if a:visual
        return ":\<C-U>%s/\<C-R>=search#escape(visual#gettext())\<CR>//g\<Left>\<Left>"
    endif
    let l:word = expand("<cword>")
    if l:word ==# ""
        let l:word = @/
    endif
    return ":\<C-U>%s/".l:word."//g\<Left>\<Left>"
endfunction

function! search#escape(string)
  let l:string = escape(a:string, '^$.*\/~[]')
  let l:string = substitute(l:string, '\n', '\\n', 'g')
  return l:string
endfunction

function! search#toqf()
    call qf#cload("vimgrep /".@/."/ %")
endfunction
