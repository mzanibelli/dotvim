scriptencoding utf-8

filetype plugin indent on

syntax on
colorscheme greyscale

let mapleader="\<Space>"
let &showbreak='› '

if has("termguicolors")
    set t_8f=[38;2;%lu;%lu;%lum
    set t_8b=[48;2;%lu;%lu;%lum
    set termguicolors
endif

augroup PLUGINS
    autocmd!
    autocmd User DeferPost packadd targets
    autocmd User DeferPost packadd editorconfig
augroup END

set autoindent
set autoread
set backspace=indent,eol,start
set backup
set backupcopy=auto
set backupdir=$HOME/.vim/backup
set belloff=all
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
set cscopequickfix=s-,c-,d-,i-,t-,e-,a-,g-
set cscopetagorder=0
set cscopeverbose
set diffexpr=
set diffopt=iwhite,filler,vertical
set directory=$HOME/.vim/swap//
set encoding=utf-8
set endofline
set equalalways
set expandtab
set exrc
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
set guicursor=a:block-Cursor,a:blinkon0
set guifont=Source\ Code\ Pro\ Regular\ 13
set guioptions=i
set hidden
set history=1000
set hlsearch
set incsearch
set keywordprg=:DevDocs
set laststatus=2
set lazyredraw
set linebreak
set listchars=tab:▸\ ,eol:¬,extends:»,precedes:«,nbsp:○,space:·
set magic
set menuitems=10
set more
set mouse=
set noautowrite
set noautowriteall
set nobomb
set nocindent
set noconfirm
set noerrorbells
set nofoldenable
set nofsync
set nogdefault
set noignorecase
set nojoinspaces
set nolist
set nomodeline
set nopaste
set noshowcmd
set noshowmode
set nosmartindent
set nosmarttab
set nospell
set notimeout
set nowrap
set nowritebackup
set nrformats=
set number
set path=.,**
set previewheight=12
set pumheight=10
set regexpengine=0
set report=0
set scrolloff=5
set secure
set selectmode=
set sessionoptions=blank,buffers,winsize,tabpages
set shell=/bin/bash
set shellcmdflag=-c
set shiftwidth=4
set shortmess=aTIcsAWF
set showtabline=2
set sidescrolloff=10
set softtabstop=4
set spellcapcheck=
set spelllang=en,fr
set splitbelow
set splitright
set startofline
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc,.png,.jpg
set swapfile
set swapsync=
set switchbuf=useopen
set synmaxcol=256
set t_Co=256
set t_ut=
set t_vb=
set tabline=%!tabs#tabline()
set tabstop=4
set tagbsearch
set tagcase=followic
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
set updatetime=1000
set viewoptions=folds,options,cursor,slash,unix
set viminfo='30,<50,s10,h
set virtualedit=block
set visualbell
set warn
set wildignore=*/.svn/**/*,*/.git/**/*,*/.hg/**/*,tags,cscope.out,*%*,**/*.retry
set wildignorecase
set wildmenu
set wildmode=longest:full,full
set winheight=1
set winwidth=1
set winminheight=0
set winminwidth=0
set wrapscan

let g:html_indent_script1="inc"
let g:html_indent_style1="inc"

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

let g:omni_sql_no_default_maps=1

let g:yaml_schema="pyyaml"

let g:tex_flavor="latex"

let g:loaded_2html_plugin=1
let g:loaded_getscript=1
let g:loaded_gzip=1
let g:loaded_logiPat=1
let g:loaded_rrhelper=1
let g:loaded_sql_completion=1
let g:loaded_syntax_completion=1
let g:loaded_tar=1
let g:loaded_vimball=1
let g:loaded_zip=1
let g:loaded_netrw=1
