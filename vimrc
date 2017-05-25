scriptencoding utf-8

filetype plugin indent on

syntax on
colorscheme greyscale

let mapleader="\<Space>"
let &showbreak='› '
let $TMPDIR=$HOME."/.vim/tmp"

runtime! macros/matchit.vim
packadd fugitive
packadd vdebug
packadd targets

silent! set autoindent
silent! set autoread
silent! set backspace=indent,eol,start
silent! set backup
silent! set backupcopy=auto
silent! set backupdir=$HOME/.vim/backup
silent! set belloff=all
silent! set breakindent
silent! set breakindentopt=shift:2
silent! set clipboard=
silent! set cmdheight=1
silent! set cmdwinheight=30
silent! set complete=.,w,b,u
silent! set completeopt=menuone
silent! set concealcursor=nvic
silent! set conceallevel=3
silent! set cpoptions=BceFs
silent! set cryptmethod=blowfish2
silent! set cscopequickfix=s-,c-,d-,i-,t-,e-,a-,g-
silent! set cscopetagorder=0
silent! set cscopeverbose
silent! set diffexpr=
silent! set diffopt=iwhite,filler,vertical
silent! set directory=$HOME/.vim/swap//
silent! set encoding=utf-8
silent! set endofline
silent! set equalalways
silent! set expandtab
silent! set fileencoding=utf-8
silent! set fileencodings=utf-8
silent! set fileformats=unix,dos,mac
silent! set fillchars=
silent! set foldclose=
silent! set foldexpr=fold#method(v:lnum)
silent! set foldlevel=1
silent! set foldmethod=expr
silent! set foldminlines=0
silent! set foldnestmax=3
silent! set foldopen=search,insert,quickfix,tag,undo
silent! set formatoptions=cqrj
silent! set guicursor=a:block-Cursor,a:blinkon0
silent! set guifont=Source\ Code\ Pro\ Regular\ 13
silent! set guioptions=i
silent! set hidden
silent! set history=1000
silent! set hlsearch
silent! set incsearch
silent! set laststatus=2
silent! set lazyredraw
silent! set linebreak
silent! set listchars=tab:▸\ ,eol:¬,extends:»,precedes:«,nbsp:○,space:·
silent! set magic
silent! set menuitems=10
silent! set mouse=
silent! set noautowrite
silent! set noautowriteall
silent! set nobomb
silent! set nocindent
silent! set noconfirm
silent! set noerrorbells
silent! set noexrc
silent! set nofoldenable
silent! set nofsync
silent! set nogdefault
silent! set noignorecase
silent! set nojoinspaces
silent! set nolist
silent! set nomodeline
silent! set nomore
silent! set nopaste
silent! set noshowcmd
silent! set noshowmode
silent! set nospell
silent! set notimeout
silent! set nowrap
silent! set nowritebackup
silent! set nrformats=
silent! set number
silent! set path=.,**
silent! set previewheight=12
silent! set pumheight=10
silent! set regexpengine=1
silent! set report=0
silent! set scrolloff=5
silent! set selectmode=
silent! set sessionoptions=blank,buffers,winsize
silent! set shell=/bin/bash
silent! set shellcmdflag=-c
silent! set shiftwidth=4
silent! set shortmess+=F
silent! set shortmess=aoOTIcsA
silent! set showtabline=1
silent! set sidescrolloff=10
silent! set nosmartindent
silent! set nosmarttab
silent! set softtabstop=4
silent! set spellcapcheck=
silent! set spelllang=en
silent! set splitbelow
silent! set splitright
silent! set startofline
silent! set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc,.png,.jpg
silent! set swapfile
silent! set swapsync=
silent! set switchbuf=useopen
silent! set synmaxcol=256
silent! set t_Co=256
silent! set t_ut=
silent! set t_vb=
silent! set tabstop=4
silent! set tagbsearch
silent! set tagcase=followic
silent! set tagrelative
silent! set tags=./tags;/
silent! set termencoding=utf-8
silent! set textwidth=72
silent! set title
silent! set ttimeout
silent! set ttimeoutlen=5
silent! set ttyfast
silent! set undodir=$HOME/.vim/undo//
silent! set undofile
silent! set undolevels=5000
silent! set updatecount=10
silent! set updatetime=500
silent! set viewoptions=folds,options,cursor,slash,unix
silent! set viminfo='30,<50,s10,h
silent! set virtualedit=block
silent! set visualbell
silent! set warn
silent! set wildignore=*/.svn/**/*,*/.git/**/*,*/.hg/**/*,tags,cscope.out,*%*
silent! set wildignorecase
silent! set wildmenu
silent! set wildmode=longest:full,full
silent! set winminheight=0
silent! set winminwidth=0
silent! set wrapscan

let g:html_indent_script1="inc"
let g:html_indent_style1="inc"

let g:netrw_liststyle=3
let g:netrw_banner=0
let g:netrw_preview=1
let g:netrw_alto=1
let g:netrw_silent=1
let g:netrw_use_errorwindow=0
let g:netrw_browse_split=0
let g:netrw_browsex_viewer= "xdg-open"
let g:netrw_ftp_cmd="ftp -p"

let g:PHP_autoformatcomment=1
let g:PHP_outdentphpescape=0
let g:PHP_removeCRwhenUnix=1
let g:PHP_vintage_case_default_indent=1

let g:python_highlight_all=1
let g:python_recommended_style=0

let g:ruby_no_expensive=1
let g:ruby_operators=1
let g:ruby_space_errors=0
let g:rubycomplete_buffer_loading=1
let g:rubycomplete_classes_in_global=1
let g:rubycomplete_rails=1

let g:vdebug_keymap = {
            \ "run"               : "<Leader>dr",
            \ "run_to_cursor"     : "<Leader>dw",
            \ "step_over"         : "<Leader>do",
            \ "step_into"         : "<Leader>di",
            \ "step_out"          : "<Leader>du",
            \ "close"             : "<Leader>dc",
            \ "detach"            : "<Leader>dd",
            \ "set_breakpoint"    : "<Leader>db",
            \ "get_context"       : "<Leader>dx",
            \ "eval_under_cursor" : "<Leader>de",
            \ "eval_visual"       : "<Leader>dv"
            \}

let g:vdebug_options = {
            \ "port"               : 9000,
            \ "timeout"            : 20,
            \ "server"             : '',
            \ "on_close"           : 'stop',
            \ "break_on_open"      : 1,
            \ "ide_key"            : '',
            \ "debug_window_level" : 0,
            \ "debug_file_level"   : 2,
            \ "debug_file"         : "/tmp/vdebug.log",
            \ "path_maps"          : {},
            \ "watch_window_style" : 'compact',
            \ "marker_default"     : '⬦',
            \ "marker_closed_tree" : '▸',
            \ "marker_open_tree"   : '▾',
            \ "continuous_mode"    : 0
            \}
