" Skandix's Vim Conf
set nocompatible
filetype plugin on

" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

""" checks if n package is installed.
function! s:Py3freeze(package)
     if empty(system("pip3 freeze | grep " . a:package))
        echo "Installing Package " . a:package
        execute "!pip3 install " . a:package . " --user"
    endif
endfunction

call plug#begin('~/.vim/plugged')

""" PLUGIN LIST START
""" Rust 
Plug 'rust-lang/rust.vim'

""" Ansible
Plug 'pearofducks/ansible-vim'

""" Visual Help
Plug 'nathanaelkane/vim-indent-guides'

""" 
Plug 'scrooloose/nerdtree'
Plug 'yassinebridi/vim-purpura'
Plug 'vimsence/vimsence'
Plug 'scrooloose/nerdcommenter'
Plug 'sheerun/vim-polyglot'
Plug 'mhinz/vim-startify'
Plug 'elzr/vim-json'
Plug 'ntpeters/vim-better-whitespace'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'
Plug 'airblade/vim-gitgutter'
Plug 'luochen1990/rainbow'
Plug 'ray-x/aurora'
Plug 'cohama/lexima.vim'

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
nnoremap <Leader>r :so $MYVIMRC<CR>

"""" Splitting Keybinds
"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


""" colorscheme

colorscheme purpura

""" ligthline config
syntax enable

""" Startify
let g:startify_session_dir = '~/.vim/session'

if &term =~ '256color'
  set t_ut=
endif

""" Indent guides enable
let g:indent_guides_enable_on_vim_startup = 1


""" BEHAVE
set wildmode=list:longest,full	" Show vim completion menu
set encoding=utf-8				" encoding
set undolevels=256				" how many times one can undo
set updatetime=250				" Faster update of internals
set numberwidth=6				" with of the 'gutter' col for numbering
set foldmethod=indent
set termguicolors               " 24 bit colors
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
set showcmd                     " show command in bottom bar
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

""" unbinde the fucking arrow keys also they are broken on my cooler master keyboard ;_;
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
