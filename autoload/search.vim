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

function! search#ilist2qf(pattern)
    redir => l:output
        silent! execute "ilist ".a:pattern
    redir END
    let l:lines = split(l:output, '\n')
    if l:lines[0] =~# '^Error detected'
        let [l:filename, l:line_info] = [expand(l:lines[0]), l:lines[1:-1]]
        let l:qf_entries = map(l:line_info, "{'filename': l:filename, 'lnum': split(v:val)[1], 'text': getline(split(v:val)[1]) }")
        call setqflist(l:qf_entries)
    endif
endfunction
