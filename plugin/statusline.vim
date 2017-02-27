" Options
set statusline=(%n)
set statusline+=\ %t
set statusline+=\ %{file#size()}
set statusline+=\ %l/%L:%c/%{&textwidth}
set statusline+=\ %p%{'%'}
set statusline+=\ %y
set statusline+=[%{strlen(&fenc)?&fenc:'none'}]
set statusline+=[%{&ff}]
set statusline+=%{&ignorecase?'[i]':''}
set statusline+=%{&wrap?'[w]':''}
set statusline+=%{&paste?'[p]':''}
set statusline+=[%{&spelllang}]
set statusline+=%r
set statusline+=%m
set statusline+=%{format#alerts(1)?'[!]':''}
set statusline+=%{exists('b:large_file')?'[xxl]':''}
set statusline+=%<
