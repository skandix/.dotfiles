" Skandix's Vim Conf
set nocompatible
filetype plugin on

" checks if plug is installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent execute "!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  autocmd VimEnter * PlugInstall | source $HOME/.vimrc
endif

""" checks if n package is installed.
function! s:Py3freeze(package)
    if empty(system("pip3 freeze | grep " . a:package))
        echo "Installing Package " . a:package
        execute "!pip3 install " . a:package . " --user "
    else
        echo "Found " . a:package
    endif
endfunction

"" installing required python packages
call s:Py3freeze("pynvim")
call s:Py3freeze("jedi")
call plug#begin('~/.vim/plugged')

""" PLUGIN LIST START
"" NERDtree tabs
Plug 'jistr/vim-nerdtree-tabs'

" indenting fancy stuff
Plug 'nathanaelkane/vim-indent-guides'

"" NERDtree
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'

"" Fuzzy File Finder
Plug 'kien/ctrlp.vim'

"" Polyglot
Plug 'sheerun/vim-polyglot'

"" Startscreen
Plug 'mhinz/vim-startify'

"" Vim JSON
Plug 'elzr/vim-json'

"" Telling discord what i'm working on and how long i've been working on that specific thing.. super fancy
Plug 'aurieh/discord.nvim', { 'do': ':UpdateRemotePlugins'}

"" Better Whitespace
Plug 'ntpeters/vim-better-whitespace'

"" Ligth version of Powerline
Plug 'itchyny/lightline.vim'

"" Async lint engine
Plug 'w0rp/ale'

 Vim Gitgutter, shows diff in Vim
Plug 'airblade/vim-gitgutter'

"" Colorscheme
Plug 'liuchengxu/space-vim-dark'
Plug 'sainnhe/vim-color-vanilla-cake'
Plug 'Rigellute/shades-of-purple.vim'

"" Auto close brackets
Plug 'cohama/lexima.vim'

"" Distracton free
Plug 'junegunn/goyo.vim'

"" Deoplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'deoplete-plugins/deoplete-jedi'

let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#jedi#statement_length = 5
let g:deoplete#sources#jedi#enable_typeinfo = 0

""" PLUGIN LIST END
call plug#end()            " end of plugin section
filetype plugin indent on    " required

""" codeformat
au BufNewFile,BufRead *.py
    \ set tabstop=4
    \| set softtabstop=4
    \| set shiftwidth=4
    \| set textwidth=79
    \| set autoindent
    \| set fileformat=unix

au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \| set softtabstop=2
    \| set shiftwidth=2


""" Lettings
let mapleader=" "
let g:ycm_autoclose_preview_window_after_completion=1
let g:go_version_warning = 0

""" KEYBINDS
"""" F-Keys
nnoremap <F1> :set hlsearch!<CR>
nnoremap <F2> :StripWhitespace<CR>

map <C-g>  :YcmCompleter GoToDefinitionElseDeclaration<CR>
map <C-d> :NERDTreeToggle<CR>
map  <C-f> :tabn<CR>
map  <C-t> :tabnew<CR>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <BS> X

""" LEADER
nnoremap <Leader>w :write <CR>
nnoremap <Leader>x :xit <CR>
nnoremap <Leader>q :quit <CR>

nnoremap <Leader>b :!python3 %<CR>

"""" Splitting Keybinds
"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


""" ligthline config
let g:shades_of_purple_lightline = 1
let g:lightline = { 'colorscheme': 'shades_of_purple' }

syntax enable
colorscheme shades_of_purple

hi Normal     ctermbg=NONE guibg=NONE
hi LineNr     ctermbg=NONE guibg=NONE
hi SignColumn ctermbg=NONE guibg=NONE

""" Startify
let g:startify_session_dir = '~/.vim/session'

if &term =~ '256color'
  set t_ut=
endif
""" BEHAVE

set wildmode=list:longest,full	" Show vim completion menu
set encoding=utf-8				" encoding
set undolevels=256				" how many times one can undo
set updatetime=250				" Faster update of internals
set numberwidth=6				" with of the 'gutter' col for numbering
set foldmethod=indent
set termguicolors
set foldlevel=99
set splitright
set backspace=indent,eol,start
set matchpairs+=<:>
set splitright
set textwidth=128
set shiftwidth=4
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
set tabstop=4
set shiftwidth=4
set expandtab
set wildmenu            		" visual autocomplete for command men
set hlsearch            		" highlight matches
set autoread 					" checks if file has changed externally
set showcmd             		" show command in bottom bar
set number              		" show line numbers
set rnu							" Relative line numbering


""" COMMMANDS (taken from lasseh .vimrc)
command! Q q
command! W w

""" NERDTREE SETTINGS (taken from lasseh .vimrc)
" Open Nerdtree if no files specified
autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

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
let g:ale_use_deprecated_neovim = 1
highlight link ALEWarningSign String
highlight link ALEErrorSign Title

""" unbinde the fucking arrow keys
" noremap <Up> <Nop>
" noremap <Down> <Nop>
" noremap <Left> <Nop>
" noremap <Right> <Nop>
