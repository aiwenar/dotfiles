" aiwenár - .vimrc

" tabs and spaces
set expandtab " tab → spaces
set ai        " auto ident
set si        " smart ident
set smarttab
set tabstop=2
set shiftwidth=2

" misc

set number
set wildmenu
set autoread      " auto-read modified fikes
set nocompatible  "
set showmatch     " hilight matching braces

" better search
set hlsearch
set incsearch

" set undo directory
try
  set undodir="~/.vim_runtime/undodir"
  set undofile
catch
endtry

" filetypes
filetype on
filetype plugin on
filetype indent on

" eable mouse
set mouse=vin

" syntax hilighting
syntax enable

" pathogen
call pathogen#infect ()

