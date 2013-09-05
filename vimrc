" Color
syntax enable
colorscheme desert

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

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" NERDTree biding key
nnoremap <silent> <F7> :NERDTreeToggle<cr>
nmap <S-F7> :NERDTreeClose<CR>

nnoremap <F6> :FufRenewCache<cr>

" Abreviations
cab W w| cab Q q| cab Wq wq| cab wQ wq| cab WQ wq

" Turn of backup since there is version controls
set nobackup
set nowb
set noswapfile

" To use VAM
" put this line first in ~/.vimrc
set nocompatible | filetype indent plugin on | syn on

fun! EnsureVamIsOnDisk(vam_install_path)
	" windows users may want to use http://mawercer.de/~marc/vam/index.php
	" to fetch VAM, VAM-known-repositories and the listed plugins
	" without having to install curl, 7-zip and git tools first
	" -> BUG [4] (git-less installation)
	let is_installed_c = "isdirectory(a:vam_install_path.'/vim-addon-manager/autoload')"
	if eval(is_installed_c)
		return 1
	else
		if 1 == confirm("Clone VAM into ".a:vam_install_path."?","&Y\n&N")
			" I'm sorry having to add this reminder. Eventually it'll pay off.
			call confirm("Remind yourself that most plugins ship with ".
									\"documentation (README*, doc/*.txt). It is your ".
									\"first source of knowledge. If you can't find ".
									\"the info you're looking for in reasonable ".
									\"time ask maintainers to improve documentation")
			call mkdir(a:vam_install_path, 'p')
			execute '!git clone --depth=1 git://github.com/MarcWeber/vim-addon-manager '.shellescape(a:vam_install_path, 1).'/vim-addon-manager'
			" VAM runs helptags automatically when you install or update 
			" plugins
			exec 'helptags '.fnameescape(a:vam_install_path.'/vim-addon-manager/doc')
		endif
		return eval(is_installed_c)
	endif
endfun

fun! SetupVAM()
	" Set advanced options like this:
	" let g:vim_addon_manager = {}
	" let g:vim_addon_manager['key'] = value
	"     Pipe all output into a buffer which gets written to disk
	" let g:vim_addon_manager['log_to_buf'] =1

	" Example: drop git sources unless git is in PATH. Same plugins can
	" be installed from www.vim.org. Lookup MergeSources to get more control
	" let g:vim_addon_manager['drop_git_sources'] = !executable('git')
	" let g:vim_addon_manager.debug_activation = 1

	" VAM install location:
	let vam_install_path = expand('$HOME') . '/Workspace/pleal-vimrc/vam' "TODO if you change of computer change this file
	if !EnsureVamIsOnDisk(vam_install_path)
		echohl ErrorMsg | echomsg "No VAM found!" | echohl NONE
		return
	endif
	exec 'set runtimepath+='.vam_install_path.'/vim-addon-manager'

	" Tell VAM which plugins to fetch & load:
	call vam#ActivateAddons(['tlib', 'snipmate-snippets', 'github:garbas/vim-snipmate', 'github:claco/jasmine.vim', 'The_NERD_tree', 'rails', 'FuzzyFinder', 'github:kchmck/vim-coffee-script', 'github:guns/vim-clojure-static'], {'auto_install' : 0})
	" sample: call vam#ActivateAddons(['pluginA','pluginB', ...], {'auto_install' : 0})

	" Addons are put into vam_install_path/plugin-name directory
	" unless those directories exist. Then they are activated.
	" Activating means adding addon dirs to rtp and do some additional
	" magic

	" How to find addon names?
	" - look up source from pool
	" - (<c-x><c-p> complete plugin names):
	" You can use name rewritings to point to sources:
	"    ..ActivateAddons(["github:foo", .. => github://foo/vim-addon-foo
	"    ..ActivateAddons(["github:user/repo", .. => github://user/repo
	" Also see section "2.2. names of addons and addon sources" in VAM's documentation
endfun
call SetupVAM()
" experimental [E1]: load plugins lazily depending on filetype, See
" NOTES
" experimental [E2]: run after gui has been started (gvim) [3]
" option1:  au VimEnter * call SetupVAM()
" option2:  au GUIEnter * call SetupVAM()
" See BUGS sections below [*]
" Vim 7.0 users see BUGS section [3]
"
"-------
"To import color syntax

" To use FuzzyFinder
map <F5> :FufFile **/<CR>
let g:fuf_file_exclude = '\v\~$|\.(o|exe|dll|bak|orig|swp)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|(^|[/\\])(tmp)($|[/\\])'
