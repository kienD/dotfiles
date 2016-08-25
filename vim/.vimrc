"""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim Configs
"""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""

" Plugins
call plug#begin('~/.vim/plugged')

" Themes
Plug 'altercation/vim-colors-solarized'
Plug 'fcevado/molokai_dark'
Plug 'laserswald/chameleon.vim'
Plug 'trapd00r/neverland-vim-theme'
"Plug 'vim-dichromatic'
Plug 'whatyouhide/vim-gotham'


" Plugs
Plug 'airblade/vim-gitgutter'
Plug 'alvan/vim-closetag'
Plug 'jiangmiao/auto-pairs'
Plug 'mthadley/syntastic-csf'
"Plug 'ntpeters/vim-better-whitespace'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'Valloric/MatchTagAlways'

" Syntax Files
Plug 'cakebaker/scss-syntax.vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""
"set cursorline
set ignorecase
set mouse=a
set number
set relativenumber
set shiftwidth=2
set splitbelow
set splitright
set tabstop=2
"syntax enable
"set syntax=whitespace
set guifont=Monospace\ 16
set so=999

let g:plug_timeout = 5

let g:jsx_ext_required = 0
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

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
"highlight ExtraWhitespace ctermbg=white
"set background=dark
"colorscheme molokai_dark

" key bindings
map <C-\> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif