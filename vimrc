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
    autocmd User DeferPost packadd vdebug
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
set winminheight=0
set winminwidth=0
set wrapscan

let g:html_indent_script1="inc"
let g:html_indent_style1="inc"

let g:netrw_liststyle=0
let g:netrw_banner=0
let g:netrw_preview=0
let g:netrw_alto=1
let g:netrw_altv=1
let g:netrw_altfile=1
let g:netrw_silent=1
let g:netrw_use_errorwindow=0
let g:netrw_browse_split=0
let g:netrw_browsex_viewer="xdg-open"
let g:netrw_ftp_cmd="ftp -p"
let g:netrw_mousemaps=0
let g:netrw_winsize=0
let g:netrw_nobeval=1
let g:netrw_keepdir=1

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

let g:vdebug_keymap={}
let g:vdebug_keymap["run"]="<Leader>dr"
let g:vdebug_keymap["run_to_cursor"]="<Leader>dw"
let g:vdebug_keymap["step_over"]="<Leader>do"
let g:vdebug_keymap["step_into"]="<Leader>di"
let g:vdebug_keymap["step_out"]="<Leader>du"
let g:vdebug_keymap["close"]="<Leader>dc"
let g:vdebug_keymap["detach"]="<Leader>dd"
let g:vdebug_keymap["set_breakpoint"]="<Leader>db"
let g:vdebug_keymap["get_context"]="<Leader>dx"
let g:vdebug_keymap["eval_under_cursor"]="<Leader>de"
let g:vdebug_keymap["eval_visual"]="<Leader>dv"

let g:vdebug_options={}
let g:vdebug_options["port"]=9000
let g:vdebug_options["timeout"]=30
let g:vdebug_options["server"]=''
let g:vdebug_options["on_close"]='stop'
let g:vdebug_options["break_on_open"]=0
let g:vdebug_options["ide_key"]=''
let g:vdebug_options["debug_window_level"]=0
let g:vdebug_options["debug_file_level"]=2
let g:vdebug_options["debug_file"]="/tmp/vdebug.log"
let g:vdebug_options["path_maps"]={}
let g:vdebug_options["watch_window_style"]='expanded'
let g:vdebug_options["marker_default"]='•'
let g:vdebug_options["marker_closed_tree"]='▸'
let g:vdebug_options["marker_open_tree"]='▾'
let g:vdebug_options["continuous_mode"]=0
