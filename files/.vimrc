"" Skandix's Vim Conf
"" Langs; Go, Python, Bash.
"" 
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"" VUNDLE PLUGIN MANAGER !
Plugin 'VundleVim/Vundle.vim'

"" PLUGIN LIST
Plugin 'tmhedberg/SimpylFold'
Plugin 'tpope/vim-fugitive'
Plugin 'godlygeek/tabular'
Plugin 'ervandew/supertab'

"" OTHER BEAUTY THINGS
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'

"" PYTHON
Plugin 'Valloric/YouCompleteMe'
Plugin 'davidhalter/jedi-vim'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'nvie/vim-flake8'

"" GIT
Plugin 'airblade/vim-gitgutter'

"" MARKDOWN
Plugin 'tpope/vim-markdown' 



Plugin 'scrooloose/syntastic'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Pluging Things hotkeys
" " NERD TREE
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" opening and closing with ctrl+d
map <C-d> :NERDTreeToggle<CR>

"" NERDTREE TABS
" ctrl + l move to next tab
map  <C-f> :tabn<CR>
" ctrl + n new tab
map  <C-t> :tabnew<CR>


"" BUILDING 
" " building python inside vim
nnoremap <silent> <F2> :!clear;python %<CR>
nnoremap <silent> <F3> :!clear;python3 %<CR>
nnoremap <silent> <F4> :!clear;go run % %<CR>

" YOUCOMPLETEME - PYTHON 
let g:ycm_autoclose_preview_window_after_completion=1 
map <C-g>  :YcmCompleter GoToDefinitionElseDeclaration<CR>



syntax enable
colorscheme brogrammer

set tabstop=2 " number of visual spaces per TAB
set softtabstop=2   " number of spaces in tab when editing
set backspace=2
set expandtab       " tabs are spaces

set number              " show line numbers
set showcmd             " show command in bottom bar
set cursorline          " highlight current line
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
nnoremap <leader><space> :nohlsearch<CR>
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
set foldmethod=indent   " fold based on indent level

" move vertically by visual line
nnoremap j gj 
nnoremap k gk

" move to beginning/end of line
nnoremap B ^
nnoremap E $

" unbind $ ^ to do nothing
nnoremap $ <nop>
nnoremap ^ <nop>

" highlight last inserted text
nnoremap gV `[v`]
<<<<<<< HEAD:files/.vimrc

" backuping
set backup no
=======
>>>>>>> 32a8caedb50594d1e0e1392ca3f6d6745991dc07:dotfiles/.vimrc
