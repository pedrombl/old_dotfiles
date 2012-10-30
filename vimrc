" Color
syntax enable

" Show number
set nu

" Text, tab and ident related
set expandtab " spaces instead of tab
set smarttab

set shiftwidth=2 " tab == 2 spaces
set tabstop=2

set ai "Auto ident

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Abreviations
cab W w| cab Q q| cab Wq wq| cab wQ wq| cab WQ wq

" Turn of backup since there is version controls
set nobackup
set nowb
set noswapfile
