"""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim Configs
"""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""
" VUNDLE
"""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible              " be improved, required
filetype off                  " required

"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Plugins
Plugin 'airblade/vim-gitgutter'
Plugin 'christoomey/vim-sort-motion'
Plugin 'crusoexia/vim-monokai'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'ElmCast/elm-vim'
Plugin 'henrik/vim-indexed-search'
Plugin 'itchyny/lightline.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'mthadley/syntastic-csf'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'SirVer/ultisnips' " Maybe use this
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'valloric/youcompleteme'
Plugin 'Yggdroot/indentline'

" Syntax Files
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'

" Themes
Plugin 'altercation/vim-colors-solarized'
Plugin 'whatyouhide/vim-gotham'

call vundle#end()            " required
filetype plugin indent on    " required

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


"""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""
set background=dark
set backupcopy=yes
set hlsearch
set ignorecase
set mouse=a
set noeol
set nofixeol
set number
set relativenumber
set shiftwidth=2
set splitbelow
set splitright
set tabstop=2
set guifont=Source\ Code\ Pro\ 10
" set so=999
syntax on
set t_Co=256

colorscheme monokai

let g:plug_timeout = 5

" CtrlP Vim
let g:ctrlp_working_path_mode = 'a'
let g:ctrlp_custom_ignore = {
      \ 'dir': '\v[\/]\.?(git|hg|svn|node_modules|classes|build)$',
      \ }

" ElmCast/elm-vim
let g:elm_setup_keybindings = 0
let g:elm_format_autosave = 1
let g:elm_make_show_warnings = 1
let g:elm_detailed_complete = 1

" Indent Line
let g:indentLine_char = '·'

let g:jsx_ext_required = 0

set laststatus=2

" Syntastic
let g:syntastic_css_checkers = ['csf']
let g:syntastic_scss_checkers = ['csf']
let g:syntastic_javascript_checkers = ['csf']

" let g:syntastic_show_warnings = 1
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1

let g:closetag_filenames = "*.html,*.xhtml,*.js,*.jsp,*.jsx,*.xml"
let g:mta_filetypes = {
	\ 'html' : 1,
	\ 'xhtml': 1,
	\ 'xml' : 1,
	\ 'js' : 1,
	\ 'jsx' : 1,
	\ 'jsp': 1
	\}

function! s:DiffWithSaved()
	let filetype=&ft
		diffthis
			vnew | r # | normal! 1Gdd
				diffthis
					exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap j jzz
nnoremap k kzz

" Key Bindings
map <C-\> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"""""""""""""""""""""""""""""""""""""""""""""""""""
" Macros
"""""""""""""""""""""""""""""""""""""""""""""""""""

" Break a 3 attribute single-line tag into a multi-line tag
let @n='f xif xif xif>i'

" Break text after space into new line
let @l='f xi'

" Trim js ext off imports & add ;
let @i = 'vbbxa;'