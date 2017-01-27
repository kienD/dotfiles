"""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim Configs
"""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""
" VUNDLE
"""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible              " be iMproved, required
filetype off                  " required

"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Plugins
Plugin 'airblade/vim-gitgutter'
"Plugin 'alvan/vim-closetag'
"Plugin 'bling/vim-airline'
Plugin 'christoomey/vim-sort-motion'
Plugin 'ctrlpvim/ctrlp.vim'
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
"Plugin 'valloric/MatchTagAlways'
"Plugin 'valloric/youcompleteme'
Plugin 'Yggdroot/indentline'

" Syntax Files
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'

" Themes
Plugin 'altercation/vim-colors-solarized'
Plugin 'fcevado/molokai_dark'
Plugin 'laserswald/chameleon.vim'
Plugin 'sickill/vim-monokai'
Plugin 'trapd00r/neverland-vim-theme'
"Plugin 'vim-dichromatic'
Plugin 'whatyouhide/vim-gotham'

call vundle#end()            " required
filetype plugin indent on    " required

" To ignore plugin indent changes, instead use:
"filetype plugin on

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
set binary
" set cursorline
set ignorecase
set mouse=a
set noeol
set number
set relativenumber
set shiftwidth=2
set splitbelow
set splitright
set tabstop=2
"syntax enable
set guifont=Monospace\ 16
set so=999

let g:plug_timeout = 5

" Vim Indent Guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd guibg=darkgrey ctermbg=DarkGray
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=lightgrey ctermbg=DarkMagenta


let g:jsx_ext_required = 0

" Lightline
" let g:lightline = {'colortheme': 'solarized'}
set laststatus=2

" Syntastic
let g:syntastic_css_checkers = ['csf']
let g:syntastic_javascript_checkers = ['csf']
let g:syntastic_scss_checkers = ['csf']

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
" colorscheme solarized

" key bindings
map <C-\> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
