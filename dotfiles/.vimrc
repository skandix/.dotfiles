set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required || plugin manager 
Plugin 'VundleVim/Vundle.vim'

"" Pluging list
Plugin 'tmhedberg/SimpylFold'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'Valloric/YouCompleteMe'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'davidhalter/jedi-vim'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'ervandew/supertab'


Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'

Plugin 'git://git.wincent.com/command-t.git'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Pluging Things hotkeys
" " NERD TREE
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" opening and closing with ctrl+n
map <C-d> :NERDTreeToggle<CR>

" Nerdtree tabss
" ctrl + l move to next tab
map  <C-f> :tabn<CR>
" ctrl + h prev tab
" map  <C-h> :tabp<CR>
" ctrl + n new tab
map  <C-t> :tabnew<CR>

" " building python inside vim
nnoremap <silent> <F5> :!clear;python %<CR>

" youcomplete me 
let g:ycm_autoclose_preview_window_after_completion=1 
map <C-g>  :YcmCompleter GoToDefinitionElseDeclaration<CR>


syntax enable
colorscheme brogrammer

set tabstop=4 " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
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

" backuping
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

