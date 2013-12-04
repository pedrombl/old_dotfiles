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

" call vam#ActivateAddons(['tlib', 'snipmate-snippets', 'github:garbas/vim-snipmate', 'github:claco/jasmine.vim', 'The_NERD_tree', 'rails', 'FuzzyFinder', 'github:kchmck/vim-coffee-script', 'github:guns/vim-clojure-static'], {'auto_install' : 0})

source vundle.vim

