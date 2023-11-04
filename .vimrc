" .vimrc

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

filetype indent on    " activates indenting for files
set autoindent        " auto indenting
set background=light  " background color
set backspace=2       " backspace in insert mode works like normal editor
set cursorline        " show location of cursor using a horizontal line.
set encoding=utf-8    "
set expandtab         " Convert tabs to spaces
set hlsearch          " highlight search terms (:noh to turn off temporarily)
set ignorecase        " Do case insensitive matching
set incsearch         " Incremental search
set laststatus=2
set nobackup          " get rid of anoying ~file
set nocompatible      " do not make vim compatible with vi.
set noswapfile        "
set number            " number the lines.
set ruler             " Always show current position
set scrolloff=999     " keep cursor in the middle of the screen while scrolling up and down.
set shiftwidth=4      "
set showcmd           " Show (partial) command in status line.
set showmatch         " Show matching brackets.
set smartcase         " Do smart case matching
set tabstop=4         " <TAB> four spaces
set wildmenu          " show auto complete menus.
set wildmode=list:longest,full " Make wildmenu behave like bash completion. Finding commands are so easy now.

"colorscheme slate     " colorscheme
colorscheme monokai-chris     " colorscheme
let mapleader = " "   " map leader to space
imap jk <Esc>

noremap <leader>n :NERDTreeFocus<CR>

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l


"inoremap <special> jk <ESC> " commented out 2022-12
"inoremap jk <ESC>           " commented out 2022-12

" end
