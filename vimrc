set nocompatible              " be iMproved, required

" =============== Vundle Initialization =============
filetype off                  "required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" =============== Vundle Plugin Start ===============
Plugin 'VundleVim/Vundle.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'burnettk/vim-angular'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-surround'
Plugin 'gregsexton/MatchTag'
Plugin 'chrisgillis/vim-bootstrap3-snippets'
Plugin 'matthewsimo/angular-vim-snippets'
Plugin 'Townk/vim-autoclose'
Plugin 'digitaltoad/vim-jade'

call vundle#end()
filetype plugin indent on

" ================ Enable mouse clicks ==============
set mouse=a

" ================ Turn Off Swap Files ==============
set noswapfile
set nobackup
set nowb

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.
if has('persistent_undo')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

" ================ Indentation ======================
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

filetype plugin on
filetype indent on

" ================ Line Numbers =====================
set number

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points

" ================ Folds ============================
set foldmethod=indent     "fold based on indent
set foldnestmax=3         "deepest fold is 3 levels
set nofoldenable          "dont fold by default

" ================ Leader ===========================
let mapleader ='\'

" ================ Plugin Configs ===================
" turn syntax higlighting on
syntax on

" javascript lib syntax
let g:used_javascript_libs = 'underscore,angularjs,angularuirouter,angularui'

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" nerdtree
map <C-d> :NERDTreeToggle<CR>
let g:NERDTreeDirArrows = 0
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Utilisnips
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
