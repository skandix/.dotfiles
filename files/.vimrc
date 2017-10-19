"" Skandix's Vim Conf

set nocompatible              " be iMproved, required
filetype plugin on                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"" VUNDLE PLUGIN MANAGER !
Plugin 'VundleVim/Vundle.vim'
"" PLUGIN LIST
" only uses it sometimes when i neeed it... keke
" Plugin 'davidhalter/jedi-vim'

" Other
Plugin 'mbbill/undotree'
Plugin 'anyakichi/vim-surround'
Plugin 'tpope/vim-projectionist'
Plugin 'scrooloose/syntastic'

" BEAUTY THINGS
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'

" GIT
Plugin 'airblade/vim-gitgutter'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Plugin Things hotkeys

"" NERD TREE
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"" NERDTREE TREE
map <C-d> :NERDTreeToggle<CR>

"" NERDTREE TABS
map  <C-f> :tabn<CR>	
map  <C-t> :tabnew<CR>

"" BUILDING 
" " building python inside vim
nnoremap <silent> <F2> :!clear;python %<CR>
nnoremap <silent> <F3> :!clear;python3 %<CR>

"nnoremap <silent> <F4> :GoBuild<CR>
"nnoremap <silent> <F5> :GoInstall<CR>
"nnoremap <silent> <F6> :GoTest<CR>

"undotree
nnoremap <F5> :UndotreeToggle<cr>


" KeyBinds 
nnoremap j gj 
nnoremap k gk
nnoremap B ^
nnoremap E $
nnoremap $ <nop>
nnoremap ^ <nop>
nnoremap <leader><space> :nohlsearch<CR>
nnoremap gV `[v`]

inoremap <F10> <C-x><C-o>
inoremap <C-@> <C-Space>

" Tagging
" sudo apt-get install exuberant-ctags
command! MakeTags !ctags -R .

" syntax
let g:airline_theme='wombat'
syntax enable
colorscheme brogrammer

" Behave
set foldlevelstart=10   " open most folds by default
set numberwidth=6	" with of the 'gutter' col for numbering
set softtabstop=4	" 
set foldnestmax=10      " 10 nested fold max
set shiftwidth=4	" 
set foldmethod=indent   " fold based on indent level
set undolevels=256	" how many times one can undo
set textwidth=128	" 
set scrolloff=8		" 
set encoding=utf-8	" encoding
set history=256		" history
set tabstop=4		" tabbing
set term=xterm-256color	" terminal
set path+=**

set autoindent		" copies indent from prev line, to next new line
set noswapfile		" stops the spawning of vim swap files
set cursorline		" highligths the line that contains cursor
set cursorline          " highlight current line
set lazyredraw          " redraw only when we need to.
set foldenable          " enable folding
set expandtab		" inserts space chars whenever tab is pressed
set showmatch           " highlight matching [{()}]
set incsearch           " search as characters are entered
set wildmenu            " visual autocomplete for command menu
set hlsearch            " highlight matches
set autoread 		" checks if file has changed externally
set ttyfast		" ...
set showcmd             " show command in bottom bar
set number              " show line numbers

set ruler 		" shows 'stats' in the rigth corner 
set rnu			" Relative line numbering

