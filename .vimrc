" aiwenár - .vimrc

"""""""""""
" general "
"""""""""""

set nocompatible  " disable compatibility

" undo directory
try
  set undodir="~/.vim_runtime/undodir"
  set undofile
catch
endtry

set autoread      " auto-reload modified files
set number        " enable line numbering
set hidden        "

filetype on
filetype plugin on
filetype indent on

""""""
" ui "
""""""

set wildmenu
set smartcase " smartcase search
set hlsearch  " highlight search results
set incsearch " schows results as you type
set magic     " magic for regular expressions
set showmatch " highlight matching braces
set title     " change terminal's title
set mouse=vin " enable mouse
set list
set fillchars=vert:│,fold:┄,diff:╱
set listchars=tab:⋮\ ,trail:⌴,eol:·,precedes:◂,extends:▸
set showbreak=↪

""""""""""""""""""""
" colors and fonts "
""""""""""""""""""""

syntax enable " syntax highlighting
colorscheme aiwenárs

set encoding=utf-8  " utf-8 as standard encoding

""""""""""""""""""""""""""
" tab and indent related "
""""""""""""""""""""""""""

set expandtab " tabs to spaces
set smarttab  " smart tabs
set ai        " auto indent
set si        " smart indent
set copyindent
" 1 tab = 2 spaces
set shiftwidth=2
set tabstop=2
set backspace=indent,eol,start

autocmd BufWrite * :%s/\s\+$//e

"""""""""""""""
" status line "
"""""""""""""""

set laststatus=2

"""""""""""
" plugins "
"""""""""""

" powerline
let g:Powerline_symbols='fancy' " set powerline to use fancy symbols

" pathogen
call pathogen#infect ()

"""""""""""""""
" key mapping "
"""""""""""""""

map g :GundoToggle<CR>
imap <C-w> <C-\><C-O>:w<CR>
nmap <C-w> :w<CR>
