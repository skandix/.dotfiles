" Skandix's Vim Conf

set nocompatible
filetype plugin on

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin('~/.vim/plugins')

"" VUNDLE PLUGIN MANAGER !
Plugin 'VundleVim/Vundle.vim'

""" PLUGIN LIST START
"" You Complete Me
""Plugin 'valloric/youcompleteme'

"" NERD Tree Syntax
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'

"" NERD tree Tabs
Plugin 'jistr/vim-nerdtree-tabs'

"" NERD tree
Plugin 'scrooloose/nerdtree'

"" fuzzy file finder
Plugin 'kien/ctrlp.vim'

"" Vim Markdown
Plugin 'plasticboy/vim-markdown'

"" Vim Instant Markdown
Plugin 'suan/vim-instant-markdown'

"" PEP8 checking
Plugin 'nvie/vim-flake8'

"" HTML5
Plugin 'othree/html5.vim'

"" Vim JSON
Plugin 'elzr/vim-json'

"" Vim Go
Plugin 'fatih/vim-go'

"" Conque Shell
" Run commands inside vim
Plugin 'vim-scripts/Conque-Shell'

"" Better Whitespace
Plugin 'ntpeters/vim-better-whitespace'

"" Ligth version of Powerline
Plugin 'itchyny/lightline.vim'

"" Async lint engine
Plugin 'w0rp/ale'

"" Vim Gitgutter, shows diff in Vim
Plugin 'airblade/vim-gitgutter'

"" Collection of language packs for Vim
Plugin 'sheerun/vim-polyglot'

"" Syntax highligth for common filetypes
Plugin 'pearofducks/ansible-vim'

"" Auto close brackets
Plugin 'cohama/lexima.vim'

"Plugin 'scrooloose/syntastic'

""" PLUGIN LIST END
call vundle#end()            " end of plugin section
filetype plugin indent on    " required

""" Lettings
let mapleader="-"
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
let g:ycm_autoclose_preview_window_after_completion=1

""" KEYBINDS
map <C-g>  :YcmCompleter GoToDefinitionElseDeclaration<CR>
map <C-d> :NERDTreeToggle<CR>
map  <C-f> :tabn<CR>
map  <C-t> :tabnew<CR>
nnoremap <F1> :set hlsearch!<CR>
nnoremap <silent> <F2> :!clear;python %<CR>
nnoremap <silent> <F3> :!clear;python3 %<CR>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <BS> X



""" COLORSCHEME
let g:lightline = {
      \ 'colorscheme': 'Dracula',
      \ }
syntax enable
colorscheme brogrammer

""" BEHAVE

set wildmode=list:longest,full	" Show vim completion menu
set term=xterm-256color
set encoding=utf-8				" encoding
set undolevels=256				" how many times one can undo
set updatetime=250				" Faster update of internals
set numberwidth=6				" with of the 'gutter' col for numbering
set foldmethod=indent
set foldlevel=99
set splitright
set backspace=indent,eol,start
set matchpairs+=<:>
set splitbelow
set textwidth=128				" 
set shiftwidth=8				" 
set laststatus=2				" Display statusline
set cmdheight=1					" Height of the command bar
set history=256					" How much history to save.
set noshowmode 					" Lightline handle this
set autoindent					" copies indent from prev line, to next new line
set cursorline          		" highlight current line
set ignorecase					" Ignore case when searching.
set smartcase					" Dont ignore case if there is capitals in the search pattern
set showmatch           		" highlight matching [{()}]
set incsearch           		" search as characters are entered
set smarttab
set wildmenu            		" visual autocomplete for command men
set hlsearch            		" highlight matches
set autoread 					" checks if file has changed externally
set ttyfast						" faster redrawing
set showcmd             		" show command in bottom bar
set number              		" show line numbers
set rnu							" Relative line numbering


""" COMMMANDS (taken from lasseh .vimrc)
command! Q q
command! W w

""" NERDTREE SETTINGS (taken from lasseh .vimrc)
" Open Nerdtree if no files specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Close vim if nerdtree is only buffer left when :q
function! s:CloseIfOnlyControlWinLeft()
	if winnr("$") != 1
		return
	endif
	if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
				\ || &buftype == 'quickfix'
		q
	endif
endfunction
augroup CloseIfOnlyControlWinLeft
	au!
	au BufEnter * call s:CloseIfOnlyControlWinLeft()
augroup END

""" ALE (taken from lasseh .vimrc)
let g:ale_sign_warning = '▲'
let g:ale_sign_error = '✗'
highlight link ALEWarningSign String
highlight link ALEErrorSign Title
