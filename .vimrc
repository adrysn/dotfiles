" ============================================================================
" Vundle
set nocompatible        " this is 21st century
filetype off            " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')
" let vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" add all your plugins here (note older versions of Vundle used Bundle instead of Plugins)

"" Visual
Plugin 'altercation/vim-colors-solarized'   " solarized theme
Plugin 'vim-airline/vim-airline'    " pretty status bar
Plugin 'vim-airline/vim-airline-themes'
Plugin 'airblade/vim-gitgutter'     " shows a git diff in the gutter
set updatetime=250      " vim-gutter
""" vim-airline
let g:airline_powerline_fonts = 1   " display buffer name
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'

"" Addons
Plugin 'ctrlpvim/ctrlp.vim'     " finder
Plugin 'jeetsukumaran/vim-buffergator'  " buffer management
Plugin 'sjl/vitality.vim'       " make vim play nicely with iTerm 2 and tmux
" ctrlp.vim
let g:ctrlp_user_command = [
    \ '.git/',
    \ 'git --git-dir=%s/.git ls-files -oc --exclude-standard | grep -Ev "(jpg|png|gif)"'
    \ ]
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/](\.(git|hg|svn)|(__pycache__|build|dist|venv[^\/]*))$',
    \ 'file': '\v\.(exe|so|dll)$',
    \ 'link': 'some_bad_symbolic_links',
    \ }
set wildignore+=*.swp,*.zip,*.exe
set wildignore+=*.jpg,*.png,*.gif
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*
" buffergator
let g:buffergator_suppress_keymaps = 1

"" Editing
Plugin 'jiangmiao/auto-pairs'   " auto-pair parenthesis, brackets
Plugin 'tpope/vim-endwise'      " cleverly add end or endfunction
Plugin 'tpope/vim-surround'     " all about parens, brackets, quotes, ...
Plugin 'tpope/vim-commentary'   " easier commenting
Plugin 'vim-scripts/ReplaceWithRegister'    " replace text with register
Plugin 'christoomey/vim-sort-motion'    " sort paragraph alphabetically, etc
Plugin 'christoomey/vim-system-copy'    " interact with system clipboard
Plugin 'kana/vim-textobj-user'          " customize text obj
Plugin 'kana/vim-textobj-indent'        " indent block as a text obj

"" Syntax
Plugin 'nvie/vim-flake8'
Plugin 'Valloric/YouCompleteMe'
Plugin 'achimnol/python-syntax'
"Plugin 'webdesus/polymer-ide.vim'
" YouCompleteMe
let g:ycm_python_binary_path = 'python'
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_complete_in_strings = 1

"" Language specifics
Plugin 'alfredodeza/pytest.vim' " inline pytesting

call vundle#end()           " required
filetype plugin indent on   " required


" ============================================================================
"" UI
syntax enable           " syntax highlighting
let opacity=100
let blur=0
let python_highlight_all=1

if has("gui_running")
    if has("gui_macvim")
        set guifont=Hack:h13
        set background=dark
        let g:solarized_visibility="low"
        colorscheme solarized
    endif
else
endif

highlight SpecialKey ctermfg=darkgrey guifg=#424242
highlight ColorColumn ctermbg=black guibg=#053440
set guioptions=         " no scroll bars
set laststatus=2        " display status line always
set number              " show line number
set relativenumber      " use relative line number
set colorcolumn=80      " draw vertical line
set list                " show tabs, spaces, trailing blanks
set listchars=tab:\┃\ ,space:·,trail:~,extends:>,precedes:<,nbsp:+
set wildmenu            " tab completion for menu commands


" ============================================================================
" General
autocmd! bufwritepost .vimrc source %   " auto reload .vimrc when saved
autocmd BufLeave,FocusLost * wall       " auto save when loose focus/buffer
set encoding=utf-8      " use UTF-8
set mouse=a             " use mouse
let mapleader = ","     " easier leader key
set nobackup            " disable stupid backup and swap files
set nowritebackup
set noswapfile
set path+=**            " search down into subfolders

"" Editing
set autoindent          " indent when moving to the next line while coding
set smartindent         " tab is converted to 4 spaces (Python convention)
set tabstop=4
set shiftwidth=0        " use tabstop value
set softtabstop=-1      " use shiftwidth value
set expandtab           " tabs into spaces
set smarttab
set bs=2                " make backspace behave naturally
set history=500         " limit history/undo levels
set undolevels=500
set hlsearch            " highlight matches
set ignorecase          " make search case insensitive
set incsearch           " searching while typing
set smartcase
set pastetoggle=<F2>    " fix indent problem when pasting from ext. source

" File browsing (netRW)
let g:netrw_banner=0        " disable banner
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view


" ============================================================================
" Key bindings
map <F2> <Esc>:w<CR>:!python %:p<CR>
inoremap jk <Esc>
noremap <Leader>bb :CtrlPBuffer<CR>    " CtrlP
noremap <Leader>bm :CtrlPMixed<CR>
noremap <Leader>bs :CtrlPMRU<CR>
noremap <Leader>jj :BuffergatorMruCyclePrev<CR>     " buffergator
noremap <Leader>kk :BuffergatorMruCycleNext<CR>
noremap <Leader>bl :BuffergatorOpen<CR>
noremap <Leader>bt :enew<CR>
noremap <Leader>bq :bp <BAR> bd #<CR>
noremap <c-j> <c-w>j    " <ctrl - move> to move around the windows
noremap <c-k> <c-w>k
noremap <c-l> <c-w>l
noremap <c-h> <c-w>h
nnoremap <Leader><space> :nohlsearch<CR>
nnoremap <space> za
nnoremap <F5> :checktime<CR>
vnoremap <Leader>s :sort<CR>        " map sort function to a key

" Snippets
nnoremap \html :-1read $HOME/.vim/.skeleton.html<CR>3jf>a
nnoremap \pywait oimport time; time.sleep(5000)<ESC>


" ============================================================================
" IDE-like Setup
"" Python
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

"" Web
au BufNewFile,BufRead *.js,*.html,*.css
    \ set tabstop=2
