"""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim Configs
"""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""
" VimPlug
"""""""""""""""""""""""""""""""""""""""""""""""""""

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/bundle')

" Plugins
Plug 'airblade/vim-gitgutter'
Plug 'alvan/vim-closetag'
Plug 'christoomey/vim-sort-motion'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ElmCast/elm-vim'
Plug 'henrik/vim-indexed-search'
Plug 'honza/vim-snippets'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/vim-plug'
Plug 'prettier/vim-prettier'
Plug 'rudes/vim-java'
Plug 'scrooloose/nerdtree'
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'valloric/youcompleteme'
Plug 'vim-airline/vim-airline'
Plug 'w0rp/ale'
Plug 'Yggdroot/indentline'

" Syntax Files
Plug 'cakebaker/scss-syntax.vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

" Themes
Plug 'crusoexia/vim-monokai'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme monokai

syntax on

set background=dark
set dir=/tmp
set expandtab
set hlsearch
set ignorecase
set lazyredraw
set mouse=a
set nobackup
set nocursorline
set number
set relativenumber
set shiftwidth=2
set splitbelow
set splitright
set sts=2
set tabstop=2
set t_Co=256

hi Search cterm=NONE
hi Search ctermbg=White
hi Search ctermfg=Black

" Set clipboard as shared between X session and Vim
set clipboard^=unnamed,unnamedplus

"""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""

" Airline
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" Ale
highlight ALEError ctermbg=Blue

" Closetag
let g:closetag_filenames = "*.html,*.xhtml,*.js,*.jsp,*.jsx,*.xml"
let g:mta_filetypes = {
  \ 'html' : 1,
  \ 'xhtml': 1,
  \ 'xml' : 1,
  \ 'js' : 1,
  \ 'jsx' : 1,
  \ 'jsp': 1
  \}

" CtrlP Vim
let g:ctrlp_custom_ignore = {
  \ 'dir': '\v[\/]\.?(git|hg|svn|node_modules|classes|build|dist|test-classes)$',
  \ }

let g:ctrlp_show_hidden = 1
let g:ctrlp_working_path_mode = 'a'

" ElmCast/elm-vim
let g:elm_detailed_complete = 1
let g:elm_format_autosave = 1
let g:elm_make_show_warnings = 1
let g:elm_setup_keybindings = 0

" Indent Line
let g:indentLine_char = '•'

let g:jsx_ext_required = 0

set laststatus=2

" NerdTree
let NERDTreeShowHidden = 1

" Prettier
let g:prettier#autoformat = 0

" Syntastic
let g:syntastic_css_checkers = ['csf']
let g:syntastic_scss_checkers = ['csf']
let g:syntastic_javascript_checkers = ['csf']

" vim-javascript
let g:jsx_ext_required = 0
let g:javascript_plugin_jsdoc = 1

" Vim Sort Motion
let g:sort_motion_flags = "ui"

"""""""""""""""""""""""""""""""""""""""""""""""""""
" Functions
"""""""""""""""""""""""""""""""""""""""""""""""""""
function! s:DiffWithSaved()
  let filetype=&ft
    diffthis
      vnew | r # | normal! 1Gdd
        diffthis
          exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()

" Key Bindings
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap j jzz
nnoremap k kzz

map <C-\> :NERDTreeToggle<CR>
au StdinReadPre * let s:std_in=1

"""""""""""""""""""""""""""""""""""""""""""""""""""
" Auto Commands
"""""""""""""""""""""""""""""""""""""""""""""""""""
" Autoreload file on change
set autoread
au WinEnter * checktime

" Remove trailing whitespaces
au BufWritePre * :%s/\s\+$//e

" Force Syntax highlighting for certain  file ext
au BufRead,BufNewFile *.jspf,*.tag set filetype=jsp

" Work settings for trailing newlines
au BufRead,BufNewFile */Liferay/* setlocal noeol nofixeol sw=2 sts=2 ts=2 noet

"""""""""""""""""""""""""""""""""""""""""""""""""""
" Macros
"""""""""""""""""""""""""""""""""""""""""""""""""""
runtime macros/matchit.vim

" Wrap selected item in console.log
let @c='S)iconsole.log'

" Break a 3 attribute single-line tag into a multi-line tag
let @n='f xif xif xif>i'

" Break text after space into new line
let @l='f xi'

" Trim js ext off imports & add ;
let @i = 'vbbxa;'
