let &grepprg = '/usr/bin/rg --no-ignore-parent --color=never --vimgrep'
let &grepformat = '%f:%l:%c:%m,%f:%l:%m'

function! grep#grep(...)
    call qf#system(join([&grepprg, join(a:000), shellescape(getcwd())]), &grepformat)
endfunction
