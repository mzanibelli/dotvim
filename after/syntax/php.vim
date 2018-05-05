syn match phpIdentifier "$\k*" contained contains=phpEnvVar,phpIntVar,phpVarSelector display
syn match phpIdentifierSimply "${\k*}" contains=phpOperator,phpParent contained display
syn keyword phpKeyword try catch finally throw contained
highlight phpMemberSelector ctermfg=255 ctermbg=none cterm=none guifg=#eeeeee guibg=NONE gui=NONE
