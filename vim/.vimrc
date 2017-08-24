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
Plugin 'alvan/vim-closetag'
Plugin 'christoomey/vim-sort-motion'
Plugin 'crusoexia/vim-monokai'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'ElmCast/elm-vim'
Plugin 'henrik/vim-indexed-search'
" Plugin 'itchyny/lightline.vim'
Plugin 'jiangmiao/auto-pairs'
" Plugin 'mthadley/syntastic-csf'
Plugin 'rudes/vim-java'
Plugin 'scrooloose/nerdtree'
" Plugin 'scrooloose/syntastic'
Plugin 'SirVer/ultisnips' " Maybe use this
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'valloric/youcompleteme'
Plugin 'vim-airline/vim-airline'
Plugin 'w0rp/ale'
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
colorscheme monokai

syntax on

set background=dark
set dir=/tmp
set expandtab
" set guifont=Source\ Code\ Pro\ 14
set hlsearch
set ignorecase
set mouse=a
set nobackup
set number
set relativenumber
set shiftwidth=2
set splitbelow
set splitright
set sts=2
set tabstop=2
set t_Co=256
set ttymouse=sgr
set term=rxvt-256color

" Set clipboard as shared between X session and Vim
set clipboard=unnamedplus

let g:plug_timeout = 5

" Airline
" let g:airline_powerline_fonts = 1
let g:airline#extensions#ale#enabled = 1

" CtrlP Vim
let g:ctrlp_working_path_mode = 'a'
let g:ctrlp_custom_ignore = {
  \ 'dir': '\v[\/]\.?(git|hg|svn|node_modules|classes|build|dist)$',
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
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"""""""""""""""""""""""""""""""""""""""""""""""""""
" Auto Commands
"""""""""""""""""""""""""""""""""""""""""""""""""""
" Autoreload file on change
set autoread
autocmd CursorHold * checktime

" Remove trailing whitespaces
autocmd BufWritePre * :%s/\s\+$//e

" Force Syntax highlighting for certain  file ext
autocmd BufRead,BufNewFile *.jspf,*.tag set filetype=jsp

" Work settings for trailing newlines
au BufRead,BufNewFile */Liferay/* setlocal noeol nofixeol sw=2 sts=2 ts=2 noet

"""""""""""""""""""""""""""""""""""""""""""""""""""
" Macros
"""""""""""""""""""""""""""""""""""""""""""""""""""

" Break a 3 attribute single-line tag into a multi-line tag
let @n='f xif xif xif>i'

" Break text after space into new line
let @l='f xi'

" Trim js ext off imports & add ;
let @i = 'vbbxa;'
