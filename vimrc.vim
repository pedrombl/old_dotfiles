" Set leader
let mapleader = ','

" Color
syntax enable
if has('gui_running')
  colorscheme solarized
else
  colorscheme slate
endif

set background=dark
" Show number and ruler
set nu
set ruler

" incremental search
set incsearch

" highlight search
set hlsearch
map <Enter> :nohlsearch <Enter>

" Text, tab and ident related
"set smarttab
set expandtab " spaces instead of tab
set shiftwidth=2 " tab == 2 spaces
set tabstop=2

set ai "Auto ident

" Set font
set guifont=Monaco:h16

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Navigation between files
nnoremap ,, <c-^>

" NERDTree biding key
nnoremap <silent> <F7> :NERDTreeToggle<cr>
nmap <S-F7> :NERDTreeClose<CR>

" Abreviations
cab W w| cab Q q| cab Wq wq| cab wQ wq| cab WQ wq

" Turn of backup since there is version controls
set nobackup
set nowb
set noswapfile

" To always show status line
set laststatus=2

" source $MYVIMRC reloads the saved $MYVIMRC
:nmap <Leader>s :source $MYVIMRC<CR>

" opens $MYVIMRC for editing, or use :tabedit $MYVIMRC
:nmap <Leader>v :e $MYVIMRC<CR>

"set trailing spaces
:set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
:nmap <Leader>l :set list<CR>
:nmap <Leader>L :set nolist<CR>

source ~/Workspace/pleal-vimrc/vundle.vim
