" Autocommands
augroup CMDWIN
    autocmd!
    autocmd CmdWinEnter * call cmdwin#mode()
augroup END
