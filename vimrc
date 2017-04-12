scriptencoding utf-8
filetype plugin indent on
runtime! macros/matchit.vim
syntax on
colorscheme greyscale
let mapleader="\<Space>"
let &showbreak='› '
let $TMPDIR=$HOME."/.vim/tmp"

set autoindent
set autoread
set backspace=indent,eol,start
set backup
set backupcopy=auto
set backupdir=$HOME/.vim/backup
if has("belloff")
    set belloff=all
endif
set breakindent
set breakindentopt=shift:2
set clipboard=
set cmdheight=1
set cmdwinheight=30
set complete=.,w,b,u
set completeopt=menuone
set concealcursor=nvic
set conceallevel=3
set cpoptions=BceFs
set cryptmethod=blowfish2
if has("cscope")
    silent! set cscopequickfix=s-,c-,d-,i-,t-,e-,a-,g-
    set cscopetagorder=0
    set cscopeverbose
endif
set diffexpr=
set diffopt=iwhite,filler,vertical
set directory=$HOME/.vim/swap//
set encoding=utf-8
set endofline
set equalalways
set expandtab
set fileencoding=utf-8
set fileencodings=utf-8
set fileformats=unix,dos,mac
set fillchars=
set foldclose=
set foldexpr=fold#method(v:lnum)
set foldlevel=1
set foldmethod=expr
set foldminlines=0
set foldnestmax=3
set foldopen=search,insert,quickfix,tag,undo
set formatoptions=cqrj
set guicursor=a:block-Cursor
set guifont=Source\ Code\ Pro\ Regular\ 13
set guioptions=i
set hidden
set history=1000
set hlsearch
set incsearch
set laststatus=2
set lazyredraw
set linebreak
set listchars=tab:▸\ ,eol:¬,extends:»,precedes:«,nbsp:○
if has("patch-7.4.710")
    set listchars+=space:·
endif
set magic
set menuitems=10
set mouse=
set noautowrite
set noautowriteall
set nobomb
set noconfirm
set noerrorbells
set noexrc
set nofoldenable
set nogdefault
set noignorecase
set nojoinspaces
set nolist
set nomodeline
set nomore
set nopaste
set noshowcmd
set nospell
set notimeout
set nowrap
set nowritebackup
set nrformats=
set number
set path=.,**
set previewheight=12
set pumheight=10
set report=0
set scrolloff=5
set selectmode=
set sessionoptions=blank,buffers,winsize
set shell=/bin/bash
set shellcmdflag=-c
set shiftwidth=4
set shortmess=aoOTIcsA
silent! set shortmess+=F
set showmode
set showtabline=0
set sidescrolloff=10
set smartindent
set smarttab
set softtabstop=4
set spellcapcheck=
set spelllang=en
set splitbelow
set splitright
set startofline
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc,.png,.jpg
set swapfile
set switchbuf=useopen
set synmaxcol=800
set t_Co=256
set t_ut=
set t_vb=
set tabstop=4
set tagbsearch
if has("tagcase")
    set tagcase=followic
endif
set tagrelative
set tags=./tags;/
set termencoding=utf-8
set textwidth=72
set title
set ttimeout
set ttimeoutlen=5
set ttyfast
set undodir=$HOME/.vim/undo//
set undofile
set undolevels=5000
set updatecount=10
set updatetime=500
set viewoptions=folds,options,cursor,slash,unix
set viminfo='30,<50,s10,h
set virtualedit=block
set visualbell
set warn
set wildignore=.svn,.git,tags,cscope.out
set wildignorecase
set wildmenu
set wildmode=longest:full,full
set winminheight=0
set winminwidth=0
set wrapscan

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
