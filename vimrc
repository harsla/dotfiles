set nocompatible              " be iMproved, required

" =============== Bad Habits ============
"noremap <Up> <NOP>
"noremap <Down> <NOP>
"noremap <Left> <NOP>
"noremap <Right> <NOP>

" =============== Plugin Initialization =============
call plug#begin('~/.vim/plugged')

Plug 'VundleVim/Vundle.vim'
Plug 'pangloss/vim-javascript'
Plug 'burnettk/vim-angular'
Plug 'jelera/vim-javascript-syntax'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-surround'
Plug 'gregsexton/MatchTag'
Plug 'chrisgillis/vim-bootstrap3-snippets'
Plug 'matthewsimo/angular-vim-snippets'
Plug 'digitaltoad/vim-jade'
Plug 'terryma/vim-multiple-cursors'
Plug 'Chiel92/vim-autoformat'

call plug#end()

" ================ Enable mouse clicks ==============
set mouse=a

" ================ Enable spell checking ============
"set spell spelllang=en_us

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

" ================== Colors =========================
set background=dark

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
let g:syntastic_html_tidy_ignore_errors= ["discarding unexpected <timepicker>","discarding unexpected </timepicker>", "<form> id and name attribute value mismatch", "proprietary attribute \"autofocus", "proprietary attribute \"ui-", "proprietary attribute \"ng-", "<form> proprietary attribute \"novalidate\"", "<form> lacks \"action\" attribute", "trimming empty <span>", "<input> proprietary attribute \"autofocus\"", "unescaped & which should be written as &amp;", "inserting implicit <span>", "<input> proprietary attribute \"required\"", "trimming empty <select>", "trimming empty <button>", "<img> lacks \"src\" attribute", "plain text isn't allowed in <head> elements", "<html> proprietary attribute \"app\"", "<link> escaping malformed URI reference", "</head> isn't allowed in <body> elements", "<script> escaping malformed URI reference", "discarding unexpected <body>", "'<' + '/' + letter not allowed here", "missing </script>", "proprietary attribute \"autocomplete\"", "trimming empty <i>", "proprietary attribute \"required\"", "proprietary attribute \"placeholder\"", "<ng-include> is not recognized!", "discarding unexpected <ng-include>", "missing </button>", "replacing unexpected button by </button>", "<ey-confirm> is not recognized!", "discarding unexpected <ey-confirm>", "discarding unexpected </ey-confirm>", "discarding unexpected </ng-include>", "discarding unexpected <navbar>", "discarding unexpected </navbar>", "discarding unexpected <md-", "discarding unexpected </md-"]
let g:syntastic_javascript_checkers = ['jshint']


set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_quiet_messages={'level':'errors'}
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"dont format paste
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

" nerdtree
map <C-d> :NERDTreeToggle<CR>
let g:NERDTreeDirArrows = 0
:let g:NERDTreeWinSize=60
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Utilisnips
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"format on save
au BufWrite * :Autoformat
