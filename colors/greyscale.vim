set background=dark

highlight clear

if exists("syntax")
    syntax reset
endif

let g:colors_name = "greyscale"

highlight Boolean ctermfg=255 ctermbg=none cterm=bold guifg=#eeeeee guibg=NONE gui=bold
highlight Character ctermfg=255 ctermbg=none guifg=#eeeeee guibg=NONE
highlight ColorColumn ctermfg=16 ctermbg=255 guifg=#000000 guibg=#eeeeee
highlight Comment ctermfg=240 ctermbg=none guifg=#585858 guibg=NONE
highlight Condtional ctermfg=255 ctermbg=none guifg=#eeeeee guibg=NONE
highlight Constant ctermfg=252 ctermbg=none guifg=#d0d0d0 guibg=NONE
highlight Cursor ctermfg=255 ctermbg=255 guifg=#000000 guibg=#eeeeee
highlight CursorColumn ctermfg=255 ctermbg=255 guifg=#eeeeee guibg=#eeeeee
highlight CursorLine cterm=none ctermbg=233 gui=NONE guibg=#121212
highlight CursorLineNr ctermfg=255 cterm=bold guifg=#eeeeee gui=bold
highlight Debug ctermfg=255 ctermbg=none guifg=#eeeeee guibg=NONE
highlight Define ctermfg=255 ctermbg=none cterm=bold guifg=#eeeeee guibg=NONE gui=bold
highlight Delimiter ctermfg=255 ctermbg=none guifg=#eeeeee guibg=NONE
highlight DiffAdd ctermbg=none ctermfg=Green guibg=NONE guifg=Green
highlight DiffChange ctermbg=none ctermfg=White guibg=NONE guifg=White
highlight DiffDelete ctermbg=none ctermfg=Red guibg=NONE guifg=Red
highlight DiffText ctermbg=none ctermfg=Yellow guibg=NONE guifg=Yellow
highlight Directory ctermfg=255 ctermbg=none guifg=#eeeeee guibg=NONE
highlight Error ctermfg=255 ctermbg=none guifg=#eeeeee guibg=NONE
highlight ErrorMsg ctermfg=255 ctermbg=none guifg=#eeeeee guibg=NONE
highlight Exception ctermfg=255 ctermbg=none cterm=bold guifg=#eeeeee guibg=NONE gui=bold
highlight Float ctermfg=255 ctermbg=none guifg=#eeeeee guibg=NONE
highlight FoldColumn ctermfg=255 ctermbg=none guifg=#eeeeee guibg=NONE
highlight Folded ctermfg=255 ctermbg=none guifg=#eeeeee guibg=NONE
highlight Function ctermfg=255 ctermbg=none guifg=#eeeeee guibg=NONE
highlight Identifier cterm=bold ctermfg=255 ctermbg=none gui=bold guifg=#eeeeee guibg=NONE
highlight IncSearch ctermfg=255 ctermbg=none guifg=#eeeeee guibg=NONE
highlight Include ctermfg=255 ctermbg=none cterm=bold guifg=#eeeeee guibg=NONE gui=bold
highlight Keyword cterm=bold ctermfg=255 ctermbg=none gui=bold guifg=#eeeeee guibg=NONE
highlight Label ctermfg=255 ctermbg=none guifg=#eeeeee guibg=NONE
highlight LineNr ctermfg=240 ctermbg=none guifg=#585858 guibg=NONE
highlight Macro ctermfg=255 ctermbg=none guifg=#eeeeee guibg=NONE
highlight MatchParen cterm=underline ctermbg=none ctermfg=255 gui=underline guibg=NONE guifg=#eeeeee
highlight ModeMsg ctermfg=255 ctermbg=none guifg=#eeeeee guibg=NONE
highlight MoreMsg ctermfg=255 ctermbg=none guifg=#eeeeee guibg=NONE
highlight NonText ctermfg=240 ctermbg=none guifg=#585858 guibg=NONE
highlight Normal ctermfg=255 ctermbg=none guifg=#eeeeee guibg=#000000
highlight Number ctermfg=255 ctermbg=none guifg=#eeeeee guibg=NONE
highlight Operator ctermfg=255 ctermbg=none guifg=#eeeeee guibg=NONE
highlight Pmenu ctermfg=255 ctermbg=240 guifg=#eeeeee guibg=#585858
highlight PmenuSbar ctermfg=16 ctermbg=255 guifg=#000000 guibg=#eeeeee
highlight PmenuSel ctermfg=16 ctermbg=255 guifg=#000000 guibg=#eeeeee
highlight PmenuThumb ctermfg=255 ctermbg=240 guifg=#eeeeee guibg=#585858
highlight PreCondit ctermfg=255 ctermbg=none guifg=#eeeeee guibg=NONE
highlight PreProc cterm=bold ctermfg=255 ctermbg=none gui=bold guifg=#eeeeee guibg=NONE
highlight Question ctermfg=255 ctermbg=none guifg=#eeeeee guibg=NONE
highlight Repeat ctermfg=255 ctermbg=none cterm=bold guifg=#eeeeee guibg=NONE gui=bold
highlight Search ctermfg=none ctermbg=none cterm=underline guifg=NONE guibg=NONE gui=underline
highlight SignColumn ctermfg=255 ctermbg=none guifg=#eeeeee guibg=#000000
highlight Special ctermfg=255 ctermbg=none guifg=#eeeeee guibg=NONE
highlight SpecialChar ctermfg=255 ctermbg=none guifg=#eeeeee guibg=NONE
highlight SpecialComment ctermfg=240 ctermbg=none guifg=#585858 guibg=NONE
highlight SpecialKey ctermfg=240 ctermbg=none guifg=#585858 guibg=NONE
highlight SpellBad ctermfg=255 ctermbg=16 cterm=underline guifg=#eeeeee guibg=#000000 gui=underline
highlight SpellCap ctermfg=255 ctermbg=16 cterm=underline guifg=#eeeeee guibg=#000000 gui=underline
highlight SpellLocal ctermfg=255 ctermbg=16 cterm=underline guifg=#eeeeee guibg=#000000 gui=underline
highlight SpellRare ctermfg=255 ctermbg=16 cterm=underline guifg=#eeeeee guibg=#000000 gui=underline
highlight Statement cterm=bold ctermfg=255 ctermbg=none gui=bold guifg=#eeeeee guibg=NONE
highlight StatusLine ctermfg=255 ctermbg=16 guifg=#eeeeee guibg=#000000
highlight StatusLineNC ctermfg=255 ctermbg=16 guifg=#eeeeee guibg=#000000
highlight StorageClass ctermfg=255 ctermbg=none cterm=bold guifg=#eeeeee guibg=NONE gui=bold
highlight String ctermfg=245 ctermbg=none guifg=#8a8a8a guibg=NONE
highlight Structure ctermfg=255 ctermbg=none cterm=bold guifg=#eeeeee guibg=NONE gui=bold
highlight Tag ctermfg=255 ctermbg=none guifg=#eeeeee guibg=NONE
highlight Title ctermfg=255 ctermbg=none guifg=#eeeeee guibg=NONE
highlight Todo ctermfg=255 ctermbg=none guifg=#eeeeee guibg=NONE
highlight Type ctermfg=255 ctermbg=none guifg=#eeeeee guibg=NONE
highlight Typedef ctermfg=255 ctermbg=none guifg=#eeeeee guibg=NONE
highlight VertSplit ctermfg=255 ctermbg=none guifg=#eeeeee guibg=NONE
highlight Visual ctermfg=16 ctermbg=255 guifg=#000000 guibg=#eeeeee
highlight VisualNOS ctermfg=16 ctermbg=255 guifg=#000000 guibg=#eeeeee
highlight WarningMsg ctermfg=255 ctermbg=none guifg=#eeeeee guibg=NONE
highlight WildMenu ctermfg=255 ctermbg=16 cterm=bold guifg=#eeeeee guibg=#000000 gui=bold
highlight phpMemberSelector ctermfg=255 ctermbg=none cterm=none guifg=#eeeeee guibg=NONE gui=NONE
highlight qfFileName cterm=bold gui=bold
highlight qfLineNr ctermfg=255 guifg=#eeeeee
